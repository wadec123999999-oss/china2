import Link from "next/link";
import { redirect } from "next/navigation";
import { z } from "zod";

import { createSupabaseServerClient } from "@/lib/supabase/server";

const loginSchema = z.object({
	email: z.string().email(),
});

async function sendMagicLink(formData: FormData): Promise<void> {
	"use server";

	const parsed = loginSchema.safeParse({
		email: formData.get("email"),
	});

	if (!parsed.success) {
		redirect("/login?status=invalid-email");
	}

	try {
		const supabase = await createSupabaseServerClient();
		const { error } = await supabase.auth.signInWithOtp({
			email: parsed.data.email,
			options: {
				emailRedirectTo: `${process.env.NEXT_PUBLIC_SITE_URL ?? "http://localhost:3000"}/account`,
			},
		});

		if (error) {
			redirect("/login?status=error");
		}

		redirect("/login?status=sent");
	} catch {
		redirect("/login?status=missing-env");
	}
}

function getStatusMessage(status?: string) {
	if (status === "sent") return "Magic link sent. Check your inbox.";
	if (status === "invalid-email") return "Please enter a valid email.";
	if (status === "error") return "Could not send your magic link yet.";
	if (status === "missing-env") {
		return "Supabase environment variables are not configured yet.";
	}
	return null;
}

export default function LoginPage({
	searchParams,
}: {
	searchParams?: { status?: string };
}) {
	const statusMessage = getStatusMessage(searchParams?.status);

	return (
		<main className="relative min-h-[calc(100vh-76px)] overflow-hidden bg-[#f4ede4] px-6 py-10 text-[#231815]">
			<div className="pointer-events-none absolute inset-0">
				<div className="absolute left-[8%] top-8 h-56 w-56 rounded-full bg-[radial-gradient(circle,_rgba(255,255,255,0.76)_0%,_rgba(255,255,255,0)_72%)]" />
				<div className="absolute right-[10%] top-24 h-72 w-72 rounded-full bg-[radial-gradient(circle,_rgba(214,187,154,0.18)_0%,_rgba(214,187,154,0)_74%)]" />
				<div className="absolute inset-x-0 top-0 h-72 bg-[linear-gradient(180deg,rgba(255,255,255,0.32),rgba(255,255,255,0))]" />
			</div>

			<div className="relative z-10 mx-auto grid max-w-[980px] gap-8 pt-12 lg:grid-cols-[0.95fr_1.05fr] lg:items-center">
				<div>
					<p className="text-[11px] uppercase tracking-[0.3em] text-[#8f725d]">
						Trip workspace access
					</p>
					<h1 className="mt-3 font-serif text-4xl font-semibold leading-tight tracking-[-0.05em] text-[#221713] sm:text-5xl">
						Sign in only when the trip becomes specific.
					</h1>
					<p className="mt-5 text-sm leading-7 text-[#685149] sm:text-[15px]">
						Browsing stays open. Account is for saving a route brief, tracking a
						managed expert request, and receiving the post-payment handoff.
					</p>
				</div>

				<section className="rounded-[2rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.86),rgba(244,236,225,0.72))] p-6 shadow-[0_36px_90px_-46px_rgba(69,45,25,0.38)] backdrop-blur-2xl sm:p-8">
					<div className="space-y-2">
						<h2 className="text-2xl font-semibold tracking-[-0.04em] text-[#241915]">
							Email magic link
						</h2>
						<p className="text-sm leading-6 text-[#6a554d]">
							No password is needed for the MVP. The link gives the traveler a
							private planning room.
						</p>
						{statusMessage ? (
							<p className="rounded-[1.1rem] border border-[#e5d4bf] bg-[#fffaf5] px-4 py-3 text-sm text-[#6a554d]">
								{statusMessage}
							</p>
						) : null}
					</div>

					<form action={sendMagicLink} className="mt-6 space-y-4">
						<div className="space-y-2">
							<label className="text-sm font-medium" htmlFor="email">
								Email
							</label>
							<input
								className="w-full rounded-xl border border-[#e0cfba] bg-[#fffaf5] px-3 py-2 text-sm outline-none transition placeholder:text-[#9a897b] focus:border-[#b99a73]"
								id="email"
								name="email"
								placeholder="you@example.com"
								type="email"
								required
							/>
						</div>
						<button
							className="inline-flex min-h-[48px] w-full items-center justify-center rounded-full border border-[#d6c5b1] bg-[linear-gradient(180deg,#ffffff,#f2ece3)] px-5 text-sm font-medium text-[#231815] shadow-[0_20px_48px_-30px_rgba(45,28,19,0.32)] transition hover:brightness-[1.02]"
							type="submit"
						>
							Send magic link
						</button>
					</form>

					<Link
						className="mt-5 inline-flex text-sm text-[#6a554d] underline"
						href="/account"
					>
						Back to workspace
					</Link>
				</section>
			</div>
		</main>
	);
}
