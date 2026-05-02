"use server";

import { redirect } from "next/navigation";
import { z } from "zod";

import { formatCategory, formatCity } from "@/lib/format";
import { getExpertBySlug } from "@/lib/matching/match-experts";
import { createSupabaseAdminClient } from "@/lib/supabase/admin";
import { getServerSupabaseEnv } from "@/lib/supabase/env";
import { createSupabaseServerClient } from "@/lib/supabase/server";

const bookingRequestSchema = z.object({
	expert: z.string().min(1),
	duration: z.coerce.number().int().min(1).max(12),
	date: z.string().optional(),
	timeWindow: z.enum(["morning", "afternoon", "evening", "flexible"]),
	notes: z.string().max(2000).optional(),
});

export async function submitBookingRequest(formData: FormData) {
	const parsed = bookingRequestSchema.safeParse({
		expert: formData.get("expert"),
		duration: formData.get("duration"),
		date: formData.get("date") || undefined,
		timeWindow: formData.get("timeWindow"),
		notes: formData.get("notes") || undefined,
	});

	if (!parsed.success) {
		redirect("/booking/success?status=invalid");
	}

	const expert = getExpertBySlug(parsed.data.expert);

	if (!expert) {
		redirect("/booking/success?status=missing-expert");
	}

	const amountTotalCents = expert.hourlyRateCents * parsed.data.duration;
	let requestId: string | null = null;
	let userId: string | null = null;
	let travelerEmail: string | null = null;

	try {
		const supabase = await createSupabaseServerClient();
		const {
			data: { user },
		} = await supabase.auth.getUser();
		userId = user?.id ?? null;
		travelerEmail = user?.email ?? null;
	} catch {
		// Public demo can still submit a preview request without auth.
	}

	if (getServerSupabaseEnv().success) {
		try {
			const admin = createSupabaseAdminClient();
			const { data } = await admin
				.from("booking_requests")
				.insert({
					traveler_id: userId,
					traveler_email: travelerEmail,
					expert_slug: expert.slug,
					expert_city: formatCity(expert.city),
					expert_type: expert.categories.map(formatCategory).join(" / "),
					duration_hours: parsed.data.duration,
					preferred_date: parsed.data.date || null,
					time_window: parsed.data.timeWindow,
					notes: parsed.data.notes ?? null,
					amount_total_cents: amountTotalCents,
					status: "submitted",
					identity_release_status: "locked",
					metadata: {
						managed_match_headline: expert.headline,
						source_page: "booking",
					},
				})
				.select("id")
				.single();

			requestId = data?.id ?? null;
		} catch {
			requestId = null;
		}
	}

	const params = new URLSearchParams({
		expert: expert.slug,
		duration: String(parsed.data.duration),
		timeWindow: parsed.data.timeWindow,
		status: requestId ? "submitted" : "demo",
	});

	if (parsed.data.date) params.set("date", parsed.data.date);
	if (parsed.data.notes) params.set("notes", parsed.data.notes);
	if (requestId) params.set("request", requestId);

	redirect(`/booking/success?${params.toString()}`);
}
