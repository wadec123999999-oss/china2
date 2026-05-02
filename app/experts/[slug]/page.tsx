import Link from "next/link";
import { notFound } from "next/navigation";

import { formatCategory, formatCity } from "@/lib/format";
import { getExpertBySlug } from "@/lib/matching/match-experts";

export default function ExpertDetailPage({
	params,
}: {
	params: { slug: string };
}) {
	const expert = getExpertBySlug(params.slug);

	if (!expert) {
		notFound();
	}

	const categoryLabel = expert.categories.map(formatCategory).join(" / ");

	return (
		<main className="relative min-h-[calc(100vh-76px)] overflow-hidden bg-[#f4ede4] px-6 py-10 text-[#231815]">
			<div className="pointer-events-none absolute inset-0">
				<div className="absolute left-[8%] top-8 h-56 w-56 rounded-full bg-[radial-gradient(circle,_rgba(255,255,255,0.76)_0%,_rgba(255,255,255,0)_72%)]" />
				<div className="absolute right-[10%] top-24 h-72 w-72 rounded-full bg-[radial-gradient(circle,_rgba(214,187,154,0.18)_0%,_rgba(214,187,154,0)_74%)]" />
				<div className="absolute inset-x-0 top-0 h-72 bg-[linear-gradient(180deg,rgba(255,255,255,0.32),rgba(255,255,255,0))]" />
			</div>

			<div className="relative z-10 mx-auto grid max-w-[1180px] gap-6 pt-6 lg:grid-cols-[1.08fr_0.92fr]">
				<section className="rounded-[2rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.86),rgba(244,236,225,0.72))] p-6 shadow-[0_36px_90px_-46px_rgba(69,45,25,0.38)] backdrop-blur-2xl sm:p-8">
					<p className="text-[11px] uppercase tracking-[0.3em] text-[#8f725d]">
						Expert match preview
					</p>
					<h1 className="mt-4 font-serif text-4xl font-semibold leading-tight tracking-[-0.05em] text-[#221713] sm:text-5xl">
						{formatCity(expert.city)} {categoryLabel} specialist
					</h1>
					<p className="mt-5 text-base leading-7 text-[#685149]">
						This is a gated match preview. The expert&apos;s identity, direct
						contact, and exact meeting plan are released only after China
						Insider confirms the brief and receives payment through the
						platform.
					</p>

					<div className="mt-8 grid gap-4 sm:grid-cols-2">
						<div className="rounded-[1.4rem] border border-white/70 bg-white/68 p-5 shadow-[0_16px_40px_-28px_rgba(0,0,0,0.2)]">
							<p className="text-sm font-medium text-[#231815]">
								What this match is good at
							</p>
							<p className="mt-3 text-sm leading-6 text-[#6a554d]">
								{expert.headline}
							</p>
						</div>
						<div className="rounded-[1.4rem] border border-white/70 bg-white/68 p-5 shadow-[0_16px_40px_-28px_rgba(0,0,0,0.2)]">
							<p className="text-sm font-medium text-[#231815]">
								Best fit traveler
							</p>
							<p className="mt-3 text-sm leading-6 text-[#6a554d]">
								Travelers who want interpretation, pacing, and a managed local
								experience instead of an unmanaged introduction.
							</p>
						</div>
					</div>

					<div className="mt-8 space-y-3">
						<h2 className="text-xl font-semibold tracking-[-0.035em] text-[#241915]">
							Sample experience logic
						</h2>
						<p className="leading-7 text-[#5f4b44]">{expert.sampleSession}</p>
					</div>

					<div className="mt-8 flex flex-wrap gap-2 text-sm text-[#6b574e]">
						{expert.tags.map((tag) => (
							<span
								key={tag}
								className="rounded-full border border-[#e5d4bf] bg-[#fffaf5] px-3 py-1"
							>
								{tag}
							</span>
						))}
					</div>
				</section>

				<aside className="space-y-5 rounded-[2rem] border border-[#dcc8ad]/70 bg-[rgba(255,251,246,0.9)] p-6 shadow-[0_24px_64px_-34px_rgba(71,44,23,0.28)] sm:p-8">
					<div>
						<p className="text-[11px] uppercase tracking-[0.26em] text-[#8f725d]">
							Platform-gated booking
						</p>
						<h2 className="mt-3 text-2xl font-semibold tracking-[-0.04em] text-[#241915]">
							Pay China Insider first. Meet the expert after confirmation.
						</h2>
					</div>

					<div className="space-y-4 text-sm leading-6 text-[#5f4b44]">
						<p>
							The platform reviews the traveler brief, confirms the expert fit,
							handles payment, and keeps the service standard accountable.
						</p>
						<p>
							The expert does not receive direct traveler contact before the
							booking is confirmed. This protects the platform, the traveler,
							and the quality of the experience.
						</p>
					</div>

					<dl className="space-y-3 border-y border-[#eadcc9] py-5 text-sm text-[#6a554d]">
						<div className="flex items-center justify-between gap-4">
							<dt>City</dt>
							<dd>{formatCity(expert.city)}</dd>
						</div>
						<div className="flex items-center justify-between gap-4">
							<dt>Expert type</dt>
							<dd>{categoryLabel}</dd>
						</div>
						<div className="flex items-center justify-between gap-4">
							<dt>Languages</dt>
							<dd>{expert.languages.join(", ")}</dd>
						</div>
						<div className="flex items-center justify-between gap-4">
							<dt>Identity</dt>
							<dd>Released after payment</dd>
						</div>
					</dl>

					<div className="space-y-3">
						<Link
							className="inline-flex min-h-[48px] w-full items-center justify-center rounded-full border border-[#d6c5b1] bg-[linear-gradient(180deg,#ffffff,#f2ece3)] px-5 text-sm font-medium text-[#231815] shadow-[0_20px_48px_-30px_rgba(45,28,19,0.32)] transition hover:brightness-[1.02]"
							href={`/booking?expert=${expert.slug}&duration=3`}
						>
							Request this match
						</Link>
						<Link
							className="inline-flex min-h-[48px] w-full items-center justify-center rounded-full border border-[#d8c5ad] bg-[#fffaf5]/70 px-5 text-sm font-medium text-[#5e4a42] transition hover:bg-white"
							href="/chat"
						>
							Start with a travel brief
						</Link>
						<Link
							className="inline-flex text-sm text-[#6a554d] underline"
							href="/experts"
						>
							Back to expert model
						</Link>
					</div>
				</aside>
			</div>
		</main>
	);
}
