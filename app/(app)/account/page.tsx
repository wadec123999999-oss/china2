import Link from "next/link";

import { createSupabaseServerClient } from "@/lib/supabase/server";

const workspaceSections = [
	{
		title: "Travel brief",
		body: "Save the city, pace, themes, dates, constraints, and traveler notes that shape the trip.",
	},
	{
		title: "Booking requests",
		body: "Track whether a managed expert match is drafted, paid, confirmed, or waiting for review.",
	},
	{
		title: "Expert handoff",
		body: "Release the expert identity, meeting point, and direct contact only after platform confirmation.",
	},
] as const;

const demoStatuses = [
	{
		label: "Brief",
		value: "Draft route and traveler context",
	},
	{
		label: "Payment",
		value: "Pending platform checkout",
	},
	{
		label: "Request",
		value: "Submitted before payment",
	},
	{
		label: "Expert identity",
		value: "Locked until confirmation",
	},
] as const;

function AccountShell({
	children,
	eyebrow,
	title,
}: {
	children: React.ReactNode;
	eyebrow: string;
	title: string;
}) {
	return (
		<main className="relative min-h-[calc(100vh-76px)] overflow-hidden bg-[#f4ede4] px-6 py-10 text-[#231815]">
			<div className="pointer-events-none absolute inset-0">
				<div className="absolute left-[8%] top-8 h-56 w-56 rounded-full bg-[radial-gradient(circle,_rgba(255,255,255,0.76)_0%,_rgba(255,255,255,0)_72%)]" />
				<div className="absolute right-[10%] top-24 h-72 w-72 rounded-full bg-[radial-gradient(circle,_rgba(214,187,154,0.18)_0%,_rgba(214,187,154,0)_74%)]" />
				<div className="absolute inset-x-0 top-0 h-72 bg-[linear-gradient(180deg,rgba(255,255,255,0.32),rgba(255,255,255,0))]" />
			</div>

			<div className="relative z-10 mx-auto max-w-[1180px] pt-6">
				<div className="max-w-4xl">
					<p className="text-[11px] uppercase tracking-[0.3em] text-[#8f725d]">
						{eyebrow}
					</p>
					<h1 className="mt-3 font-serif text-4xl font-semibold leading-tight tracking-[-0.05em] text-[#221713] sm:text-5xl">
						{title}
					</h1>
				</div>
				{children}
			</div>
		</main>
	);
}

function WorkspacePreview({ email }: { email?: string | null }) {
	return (
		<AccountShell eyebrow="Trip workspace" title="Your private planning room.">
			<div className="mt-8 grid gap-8 lg:grid-cols-[1.05fr_0.95fr]">
				<section className="rounded-[2rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.86),rgba(244,236,225,0.72))] p-6 shadow-[0_36px_90px_-46px_rgba(69,45,25,0.38)] backdrop-blur-2xl sm:p-8">
					<p className="text-sm leading-7 text-[#685149]">
						Account should exist, but not as a social profile or open member
						center. For this product, it is where a traveler&apos;s route brief,
						booking request, payment status, and post-payment expert handoff
						live.
					</p>

					<div className="mt-7 grid gap-3">
						{workspaceSections.map((section) => (
							<div
								key={section.title}
								className="rounded-[1.4rem] border border-white/70 bg-white/68 p-5 shadow-[0_16px_40px_-28px_rgba(0,0,0,0.2)]"
							>
								<h2 className="text-[15px] font-medium text-[#231815]">
									{section.title}
								</h2>
								<p className="mt-2 text-sm leading-6 text-[#6a554d]">
									{section.body}
								</p>
							</div>
						))}
					</div>

					<div className="mt-7 flex flex-wrap gap-3">
						<Link
							className="inline-flex min-h-[48px] items-center justify-center rounded-full border border-[#d6c5b1] bg-[linear-gradient(180deg,#ffffff,#f2ece3)] px-5 text-sm font-medium text-[#231815] shadow-[0_20px_48px_-30px_rgba(45,28,19,0.32)] transition hover:brightness-[1.02]"
							href="/chat"
						>
							Start or update a brief
						</Link>
						<Link
							className="inline-flex min-h-[48px] items-center justify-center rounded-full border border-[#d8c5ad] bg-[#fffaf5]/70 px-5 text-sm font-medium text-[#5e4a42] transition hover:bg-white"
							href="/experts"
						>
							View expert model
						</Link>
					</div>
				</section>

				<aside className="space-y-5 rounded-[2rem] border border-[#dcc8ad]/70 bg-[rgba(255,251,246,0.9)] p-6 shadow-[0_24px_64px_-34px_rgba(71,44,23,0.28)] sm:p-8">
					<div>
						<p className="text-[11px] uppercase tracking-[0.24em] text-[#8f725d]">
							Current access
						</p>
						<h2 className="mt-2 text-2xl font-semibold tracking-[-0.04em] text-[#241915]">
							{email ? "Signed in" : "Sign in to save trip state"}
						</h2>
						<p className="mt-3 text-sm leading-6 text-[#6a554d]">
							{email
								? `Signed in as ${email}.`
								: "The public site can stay browse-first. Account starts only when a traveler wants to save a brief or request a managed expert match."}
						</p>
					</div>

					<div className="rounded-[1.4rem] border border-dashed border-[#d8c5ad] bg-[#fffaf5]/62 p-4 text-sm leading-6 text-[#6a554d]">
						MVP logic: a booking request can be stored before payment. The
						expert remains hidden until checkout and platform confirmation are
						complete.
					</div>

					<dl className="space-y-3 border-y border-[#eadcc9] py-5 text-sm text-[#6a554d]">
						{demoStatuses.map((item) => (
							<div
								key={item.label}
								className="flex items-center justify-between gap-4"
							>
								<dt>{item.label}</dt>
								<dd className="text-right text-[#241915]">{item.value}</dd>
							</div>
						))}
					</dl>

					{!email ? (
						<Link
							className="inline-flex min-h-[48px] w-full items-center justify-center rounded-full border border-[#d6c5b1] bg-[linear-gradient(180deg,#ffffff,#f2ece3)] px-5 text-sm font-medium text-[#231815] shadow-[0_20px_48px_-30px_rgba(45,28,19,0.32)] transition hover:brightness-[1.02]"
							href="/login"
						>
							Sign in with email
						</Link>
					) : null}
				</aside>
			</div>
		</AccountShell>
	);
}

export default async function AccountPage() {
	try {
		const supabase = await createSupabaseServerClient();
		const {
			data: { user },
		} = await supabase.auth.getUser();

		return <WorkspacePreview email={user?.email} />;
	} catch {
		return <WorkspacePreview />;
	}
}
