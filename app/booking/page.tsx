import Link from "next/link";

import { formatCategory, formatCity } from "@/lib/format";
import { getExpertBySlug } from "@/lib/matching/match-experts";
import { usd } from "@/lib/money";

const trustPoints = [
	"Expert identity and direct contact are released only after booking confirmation.",
	"Traveler payment is handled by China Insider, not collected directly by the local expert.",
	"The route brief, service standard, cancellation policy, and post-service review stay with the platform.",
];

export default function BookingPage({
	searchParams,
}: {
	searchParams?: Record<string, string | string[] | undefined>;
}) {
	const slugParam = Array.isArray(searchParams?.expert)
		? searchParams?.expert[0]
		: searchParams?.expert;
	const durationParam = Array.isArray(searchParams?.duration)
		? searchParams?.duration[0]
		: searchParams?.duration;

	const expert = slugParam ? getExpertBySlug(slugParam) : undefined;
	const durationHours = Number(durationParam ?? "3");
	const totalCents = expert ? expert.hourlyRateCents * durationHours : 0;
	const expertType = expert
		? expert.categories.map(formatCategory).join(" / ")
		: null;

	return (
		<main className="relative min-h-[calc(100vh-76px)] overflow-hidden bg-[#f4ede4] px-6 py-10 text-[#231815]">
			<div className="pointer-events-none absolute inset-0">
				<div className="absolute left-[8%] top-8 h-56 w-56 rounded-full bg-[radial-gradient(circle,_rgba(255,255,255,0.76)_0%,_rgba(255,255,255,0)_72%)]" />
				<div className="absolute right-[10%] top-24 h-72 w-72 rounded-full bg-[radial-gradient(circle,_rgba(214,187,154,0.18)_0%,_rgba(214,187,154,0)_74%)]" />
				<div className="absolute inset-x-0 top-0 h-72 bg-[linear-gradient(180deg,rgba(255,255,255,0.32),rgba(255,255,255,0))]" />
			</div>

			<div className="relative z-10 mx-auto max-w-[1180px]">
				<div className="mb-8 flex flex-wrap items-end justify-between gap-4 pt-6">
					<div className="max-w-3xl">
						<p className="text-[11px] uppercase tracking-[0.3em] text-[#8f725d]">
							Booking preview
						</p>
						<h1 className="mt-3 font-serif text-4xl font-semibold leading-tight tracking-[-0.05em] text-[#221713] sm:text-5xl">
							Platform-managed booking
						</h1>
					</div>
					<div className="rounded-full border border-[#e5d4bf] bg-[#fffaf5] px-3 py-1 text-xs text-[#6b574e]">
						Expert identity stays gated until confirmation
					</div>
				</div>

				<div className="grid gap-8 lg:grid-cols-[1fr_0.9fr]">
					<section className="space-y-6 rounded-[2rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.86),rgba(244,236,225,0.72))] p-6 shadow-[0_36px_90px_-46px_rgba(69,45,25,0.38)] backdrop-blur-2xl sm:p-8">
						<div className="space-y-2">
							<p className="text-[11px] uppercase tracking-[0.24em] text-[#8f725d]">
								Session details
							</p>
							<p className="text-sm leading-6 text-[#6a554d]">
								This step confirms the match type, preferred timing, and
								traveler brief before payment. The individual expert is
								introduced only after China Insider confirms the booking.
							</p>
						</div>

						{expert ? (
							<div className="space-y-6">
								<div className="rounded-[1.4rem] border border-white/70 bg-white/68 p-5 shadow-[0_16px_40px_-28px_rgba(0,0,0,0.2)]">
									<p className="text-sm text-[#6a554d]">
										{formatCity(expert.city)} managed expert match
									</p>
									<p className="mt-2 text-lg font-medium text-[#231815]">
										{expert.headline}
									</p>
									<p className="mt-2 text-sm text-[#6a554d]">
										{expertType} - suggested session length: {durationHours}{" "}
										hours
									</p>
								</div>

								<form action="/booking/success" className="space-y-5">
									<input name="expert" type="hidden" value={expert.slug} />
									<input
										name="duration"
										type="hidden"
										value={String(durationHours)}
									/>

									<div className="grid gap-4 sm:grid-cols-2">
										<div className="space-y-2">
											<label className="text-sm font-medium" htmlFor="date">
												Preferred date
											</label>
											<input
												className="w-full rounded-xl border border-[#e0cfba] bg-[#fffaf5] px-3 py-2 text-sm outline-none transition focus:border-[#b99a73]"
												id="date"
												name="date"
												type="date"
											/>
										</div>
										<div className="space-y-2">
											<label
												className="text-sm font-medium"
												htmlFor="timeWindow"
											>
												Time window
											</label>
											<select
												className="w-full rounded-xl border border-[#e0cfba] bg-[#fffaf5] px-3 py-2 text-sm outline-none transition focus:border-[#b99a73]"
												defaultValue="afternoon"
												id="timeWindow"
												name="timeWindow"
											>
												<option value="morning">Morning</option>
												<option value="afternoon">Afternoon</option>
												<option value="evening">Evening</option>
												<option value="flexible">Flexible</option>
											</select>
										</div>
									</div>

									<div className="space-y-2">
										<label className="text-sm font-medium" htmlFor="notes">
											What would make this session feel meaningful?
										</label>
										<textarea
											className="min-h-28 w-full rounded-xl border border-[#e0cfba] bg-[#fffaf5] px-3 py-2 text-sm outline-none transition focus:border-[#b99a73]"
											defaultValue="I want a thoughtful introduction, not a rushed checklist."
											id="notes"
											name="notes"
										/>
									</div>

									<div className="rounded-[1.4rem] border border-dashed border-[#d8c5ad] bg-[#fffaf5]/62 p-4 text-sm text-[#6a554d]">
										In the real checkout, this section will capture traveler
										details, payment confirmation, cancellation policy
										acknowledgement, and the release of expert identity after
										confirmation.
									</div>

									<button
										className="inline-flex min-h-[48px] items-center justify-center rounded-full border border-[#d6c5b1] bg-[linear-gradient(180deg,#ffffff,#f2ece3)] px-5 text-sm font-medium text-[#231815] shadow-[0_20px_48px_-30px_rgba(45,28,19,0.32)] transition hover:brightness-[1.02]"
										type="submit"
									>
										Continue to confirmation
									</button>
								</form>
							</div>
						) : (
							<div className="rounded-[1.4rem] border border-dashed border-[#d8c5ad] bg-[#fffaf5]/62 p-6 text-sm text-[#6a554d]">
								Pick an expert match first from the managed expert flow.
							</div>
						)}
					</section>

					<aside className="space-y-5 rounded-[2rem] border border-[#dcc8ad]/70 bg-[rgba(255,251,246,0.9)] p-6 shadow-[0_24px_64px_-34px_rgba(71,44,23,0.28)] sm:p-8">
						<div>
							<p className="text-[11px] uppercase tracking-[0.24em] text-[#8f725d]">
								Order summary
							</p>
							<h2 className="mt-2 text-2xl font-semibold tracking-[-0.04em] text-[#241915]">
								{expert ? "Managed expert match" : "No expert selected"}
							</h2>
						</div>

						{expert ? (
							<>
								<dl className="space-y-3 border-y border-[#eadcc9] py-5 text-sm text-[#6a554d]">
									<div className="flex items-center justify-between gap-4">
										<dt>Duration</dt>
										<dd>{durationHours} hours</dd>
									</div>
									<div className="flex items-center justify-between gap-4">
										<dt>Total</dt>
										<dd>{usd(totalCents)}</dd>
									</div>
									<div className="flex items-center justify-between gap-4">
										<dt>Payment holder</dt>
										<dd>China Insider</dd>
									</div>
									<div className="flex items-center justify-between gap-4">
										<dt>Expert identity</dt>
										<dd>After confirmation</dd>
									</div>
								</dl>

								<div className="rounded-[1.4rem] border border-white/70 bg-white/68 p-5 text-sm text-[#6a554d] shadow-[0_16px_40px_-28px_rgba(0,0,0,0.2)]">
									<p className="font-medium text-[#231815]">Trust model</p>
									<ul className="mt-3 space-y-2 leading-6">
										{trustPoints.map((item) => (
											<li key={item}>{item}</li>
										))}
									</ul>
								</div>

								<div className="rounded-[1.4rem] border border-white/70 bg-white/68 p-5 text-sm text-[#6a554d] shadow-[0_16px_40px_-28px_rgba(0,0,0,0.2)]">
									<p className="font-medium text-[#231815]">
										What happens later
									</p>
									<ul className="mt-3 space-y-2 leading-6">
										<li>Payment will be collected by the platform.</li>
										<li>Supabase will store the booking and traveler brief.</li>
										<li>
											The confirmed expert identity is released after payment.
										</li>
									</ul>
								</div>
							</>
						) : null}

						<div className="space-y-3 text-sm text-[#6a554d]">
							<Link className="inline-flex text-sm underline" href="/experts">
								Back to experts
							</Link>
						</div>
					</aside>
				</div>
			</div>
		</main>
	);
}
