import Link from "next/link";

import { formatCategory, formatCity } from "@/lib/format";
import { getExpertBySlug } from "@/lib/matching/match-experts";

export default function BookingSuccessPage({
	searchParams,
}: {
	searchParams?: Record<string, string | string[] | undefined>;
}) {
	const slugParam = Array.isArray(searchParams?.expert)
		? searchParams?.expert[0]
		: searchParams?.expert;
	const notesParam = Array.isArray(searchParams?.notes)
		? searchParams?.notes[0]
		: searchParams?.notes;
	const dateParam = Array.isArray(searchParams?.date)
		? searchParams?.date[0]
		: searchParams?.date;
	const timeWindowParam = Array.isArray(searchParams?.timeWindow)
		? searchParams?.timeWindow[0]
		: searchParams?.timeWindow;
	const statusParam = Array.isArray(searchParams?.status)
		? searchParams?.status[0]
		: searchParams?.status;
	const requestParam = Array.isArray(searchParams?.request)
		? searchParams?.request[0]
		: searchParams?.request;

	const expert = slugParam ? getExpertBySlug(slugParam) : undefined;
	const expertType = expert
		? expert.categories.map(formatCategory).join(" / ")
		: "Managed local expert match";

	return (
		<main className="relative min-h-[calc(100vh-76px)] overflow-hidden bg-[#f4ede4] px-6 py-10 text-[#231815]">
			<div className="pointer-events-none absolute inset-0">
				<div className="absolute left-[8%] top-8 h-56 w-56 rounded-full bg-[radial-gradient(circle,_rgba(255,255,255,0.76)_0%,_rgba(255,255,255,0)_72%)]" />
				<div className="absolute right-[10%] top-24 h-72 w-72 rounded-full bg-[radial-gradient(circle,_rgba(214,187,154,0.18)_0%,_rgba(214,187,154,0)_74%)]" />
				<div className="absolute inset-x-0 top-0 h-72 bg-[linear-gradient(180deg,rgba(255,255,255,0.32),rgba(255,255,255,0))]" />
			</div>

			<div className="relative z-10 mx-auto max-w-[980px] pt-8">
				<section className="rounded-[2rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.86),rgba(244,236,225,0.72))] p-6 shadow-[0_36px_90px_-46px_rgba(69,45,25,0.38)] backdrop-blur-2xl sm:p-8">
					<div className="space-y-4">
						<p className="text-[11px] uppercase tracking-[0.3em] text-[#8f725d]">
							Demo confirmation
						</p>
						<h1 className="font-serif text-4xl font-semibold leading-tight tracking-[-0.05em] text-[#221713] sm:text-5xl">
							Your request is in.
						</h1>
						<p className="max-w-2xl text-sm leading-7 text-[#685149] sm:text-[15px]">
							This request is now ready for platform review. In the paid flow,
							checkout comes next; expert identity remains locked until payment
							and platform confirmation.
						</p>
					</div>

					<div className="mt-8 grid gap-4 rounded-[1.6rem] border border-white/70 bg-white/68 p-5 shadow-[0_16px_40px_-28px_rgba(0,0,0,0.2)] sm:grid-cols-2">
						<div>
							<p className="text-sm text-[#8f725d]">Expert match</p>
							<p className="mt-1 font-medium text-[#241915]">
								{expert
									? `${formatCity(expert.city)} ${expertType} specialist`
									: "To be confirmed"}
							</p>
						</div>
						<div>
							<p className="text-sm text-[#8f725d]">Preferred date</p>
							<p className="mt-1 font-medium text-[#241915]">
								{dateParam || "Flexible"}
							</p>
						</div>
						<div>
							<p className="text-sm text-[#8f725d]">Time window</p>
							<p className="mt-1 font-medium text-[#241915]">
								{timeWindowParam || "Flexible"}
							</p>
						</div>
						<div>
							<p className="text-sm text-[#8f725d]">Identity status</p>
							<p className="mt-1 font-medium text-[#241915]">
								Released after confirmation
							</p>
						</div>
						<div>
							<p className="text-sm text-[#8f725d]">Request status</p>
							<p className="mt-1 font-medium text-[#241915]">
								{statusParam === "submitted"
									? "Stored for platform review"
									: statusParam === "invalid"
										? "Invalid request"
										: statusParam === "missing-expert"
											? "Expert match missing"
											: "Demo preview"}
							</p>
						</div>
						<div>
							<p className="text-sm text-[#8f725d]">Request ID</p>
							<p className="mt-1 break-all font-medium text-[#241915]">
								{requestParam || "Generated after Supabase is configured"}
							</p>
						</div>
						<div className="sm:col-span-2">
							<p className="text-sm text-[#8f725d]">Your note</p>
							<p className="mt-1 leading-7 text-[#6a554d]">
								{notesParam || "No extra notes yet."}
							</p>
						</div>
					</div>

					<div className="mt-8 rounded-[1.4rem] border border-dashed border-[#d8c5ad] bg-[#fffaf5]/62 p-5 text-sm leading-6 text-[#6a554d]">
						Next version: this page will show payment status, booking ID,
						cancellation policy, confirmation email details, and a link into the
						traveler&apos;s private workspace.
					</div>

					<div className="mt-8 flex flex-wrap gap-3">
						<Link
							className="inline-flex min-h-[48px] items-center justify-center rounded-full border border-[#d6c5b1] bg-[linear-gradient(180deg,#ffffff,#f2ece3)] px-5 text-sm font-medium text-[#231815] shadow-[0_20px_48px_-30px_rgba(45,28,19,0.32)] transition hover:brightness-[1.02]"
							href="/account"
						>
							Open trip workspace
						</Link>
						<Link
							className="inline-flex min-h-[48px] items-center justify-center rounded-full border border-[#d8c5ad] bg-[#fffaf5]/70 px-5 text-sm font-medium text-[#5e4a42] transition hover:bg-white"
							href="/chat"
						>
							Start another brief
						</Link>
					</div>
				</section>
			</div>
		</main>
	);
}
