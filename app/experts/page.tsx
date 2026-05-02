import Link from "next/link";

const cityExpertTypes = [
	{
		city: "Beijing",
		title: "Capital culture interpreters",
		focus: "Central Axis, hutongs, calligraphy, political space",
		sellPoint:
			"Best when travelers need China explained with structure, not only landmarks.",
	},
	{
		city: "Chengdu",
		title: "Food, panda, and local-life hosts",
		focus: "Sichuan food, pandas, tea houses, markets, neighborhood rhythm",
		sellPoint:
			"Best for travelers who want an easy first hook and a softer city pace.",
	},
	{
		city: "Chongqing",
		title: "8D city and night-route specialists",
		focus: "Cyberpunk mountain city, neon movement, hotpot, urban photography",
		sellPoint:
			"Best when the city needs to feel visually powerful but still interpreted.",
	},
	{
		city: "Jingdezhen",
		title: "Porcelain and studio access curators",
		focus: "Imperial kilns, studios, makers, material culture",
		sellPoint:
			"Best for craft, design, museum, and collector-minded travelers.",
	},
	{
		city: "Quanzhou",
		title: "Maritime Silk Road and roots-travel interpreters",
		focus: "UNESCO port history, Hokkien memory, religious diversity, food",
		sellPoint:
			"Best for travelers who need the city explained through exchange and identity.",
	},
	{
		city: "Jingmai Mountain",
		title: "Tea forest and village-stay hosts",
		focus: "Ancient tea forests, village continuity, tasting, slow travel",
		sellPoint:
			"Best for premium slow travelers who want quiet, ecology, and tea culture.",
	},
	{
		city: "Wudang Mountain",
		title: "Taoist culture and Taiji guides",
		focus:
			"Taoist sacred mountain, Taiji, internal practice, sacred architecture",
		sellPoint:
			"Best for travelers seeking Taoist culture and embodied practice, not a show.",
	},
] as const;

const guarantees = [
	"Every local expert is selected and briefed by the platform before being offered to travelers.",
	"Traveler payment stays with the platform first; expert identity and final contact are released after booking confirmation.",
	"The platform controls the route brief, service standard, cancellation policy, and post-service review.",
	"If a match is not right, the platform adjusts the plan before the traveler is handed off.",
] as const;

const serviceSteps = [
	{
		label: "1",
		title: "Share the travel brief",
		body: "Tell us the city, travel style, interests, dates, and what would make the experience feel meaningful.",
	},
	{
		label: "2",
		title: "We match the right expert type",
		body: "You see the expert category, city fit, language ability, and proposed experience logic before payment.",
	},
	{
		label: "3",
		title: "Pay the platform",
		body: "The booking is paid through China Insider. The expert does not collect directly from the traveler.",
	},
	{
		label: "4",
		title: "Meet the expert after confirmation",
		body: "Once the booking is confirmed, we release the expert identity, meeting plan, and final contact channel.",
	},
] as const;

export default function ExpertsPage() {
	return (
		<main className="relative min-h-[calc(100vh-76px)] overflow-hidden bg-[#f4ede4] px-6 py-8 text-[#231815]">
			<div className="pointer-events-none absolute inset-0">
				<div className="absolute left-[7%] top-8 h-64 w-64 rounded-full bg-[radial-gradient(circle,_rgba(255,255,255,0.76)_0%,_rgba(255,255,255,0)_72%)]" />
				<div className="absolute right-[8%] top-36 h-80 w-80 rounded-full bg-[radial-gradient(circle,_rgba(214,187,154,0.18)_0%,_rgba(214,187,154,0)_74%)]" />
				<div className="absolute inset-x-0 top-0 h-72 bg-[linear-gradient(180deg,rgba(255,255,255,0.32),rgba(255,255,255,0))]" />
			</div>

			<div className="relative z-10 mx-auto flex w-full max-w-[1480px] flex-col gap-8">
				<section className="grid gap-6 lg:grid-cols-[1.08fr_0.92fr] lg:items-end">
					<div className="max-w-4xl pt-8 sm:pt-14">
						<p className="text-[11px] uppercase tracking-[0.34em] text-[#8f725d] sm:text-xs">
							Managed local experts
						</p>
						<h1 className="mt-4 max-w-5xl font-serif text-5xl font-semibold leading-[1.02] tracking-[-0.055em] text-[#221713] sm:text-7xl lg:text-[5.5rem]">
							Experts selected, paid, and managed by the platform.
						</h1>
						<p className="mt-5 max-w-2xl text-base leading-7 text-[#685149] sm:text-[1.12rem] sm:leading-8">
							China Insider is not an open directory of freelancers. We shape
							the brief, confirm the match, collect payment through the
							platform, and then release the expert identity and meeting plan.
						</p>
					</div>

					<div className="rounded-[2rem] border border-white/55 bg-[linear-gradient(180deg,rgba(255,253,249,0.82),rgba(245,237,225,0.7))] p-5 shadow-[0_36px_90px_-46px_rgba(69,45,25,0.38)] backdrop-blur-2xl sm:p-6">
						<div className="flex items-center justify-between text-[11px] uppercase tracking-[0.22em] text-[#8b7368]">
							<span>Booking logic</span>
							<span>Gated</span>
						</div>
						<p className="mt-5 text-sm leading-7 text-[#6a554d] sm:text-[15px]">
							Travelers do not receive direct expert contact before payment.
							They first see the expert type, city fit, language ability, and
							proposed experience logic.
						</p>
						<div className="mt-6 flex flex-wrap gap-3">
							<Link
								className="inline-flex min-h-[48px] items-center justify-center rounded-full border border-[#d6c5b1] bg-[linear-gradient(180deg,#ffffff,#f2ece3)] px-5 text-sm font-medium text-[#231815] shadow-[0_20px_48px_-30px_rgba(45,28,19,0.32)] transition hover:brightness-[1.02]"
								href="/chat"
							>
								Start with a travel brief
							</Link>
							<Link
								className="inline-flex min-h-[48px] items-center justify-center rounded-full border border-[#d8c5ad] bg-[#fffaf5]/70 px-5 text-sm font-medium text-[#5e4a42] transition hover:bg-white"
								href="/booking"
							>
								View booking flow
							</Link>
						</div>
					</div>
				</section>

				<section className="grid gap-3 md:grid-cols-4">
					{serviceSteps.map((step) => (
						<div
							key={step.label}
							className="rounded-[1.6rem] border border-white/70 bg-white/68 p-5 shadow-[0_18px_44px_-30px_rgba(0,0,0,0.2)]"
						>
							<div className="flex h-9 w-9 items-center justify-center rounded-full bg-[#efe0c9] text-sm font-semibold text-[#5b3e2f]">
								{step.label}
							</div>
							<h2 className="mt-5 text-[15px] font-medium text-[#231815]">
								{step.title}
							</h2>
							<p className="mt-2 text-sm leading-6 text-[#6a554d]">
								{step.body}
							</p>
						</div>
					))}
				</section>

				<section className="grid gap-4 lg:grid-cols-[0.9fr_1.1fr]">
					<div className="rounded-[2rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.82),rgba(244,236,225,0.7))] p-5 shadow-[0_30px_80px_-44px_rgba(58,36,24,0.36)] backdrop-blur-2xl sm:p-6">
						<p className="text-[11px] uppercase tracking-[0.26em] text-[#8f725d]">
							Why this model
						</p>
						<h2 className="mt-4 font-serif text-3xl font-semibold leading-tight tracking-[-0.04em] text-[#241915] sm:text-[2.45rem]">
							You are buying a guaranteed cultural experience, not a phone
							number.
						</h2>
					</div>
					<div className="grid gap-3 sm:grid-cols-2">
						{guarantees.map((item) => (
							<div
								key={item}
								className="rounded-[1.4rem] border border-[#dcc8ad]/70 bg-[rgba(255,251,246,0.86)] p-5 shadow-[0_18px_48px_-34px_rgba(71,44,23,0.24)]"
							>
								<p className="text-sm leading-6 text-[#5f4b44]">{item}</p>
							</div>
						))}
					</div>
				</section>

				<section>
					<div className="max-w-3xl">
						<p className="text-[11px] uppercase tracking-[0.26em] text-[#8f725d]">
							Expert types by city
						</p>
						<h2 className="mt-4 font-serif text-3xl font-semibold leading-tight tracking-[-0.04em] text-[#241915] sm:text-[2.45rem]">
							We show the match logic first. The individual expert is revealed
							after confirmation.
						</h2>
					</div>

					<div className="mt-8 grid gap-4 lg:grid-cols-2">
						{cityExpertTypes.map((item) => (
							<article
								key={item.city}
								className="rounded-[2rem] border border-[#dcc8ad]/70 bg-[rgba(255,251,246,0.9)] p-6 shadow-[0_24px_64px_-34px_rgba(71,44,23,0.28)] transition duration-300 hover:-translate-y-1 hover:shadow-[0_30px_74px_-34px_rgba(71,44,23,0.34)]"
							>
								<div className="flex flex-wrap items-start justify-between gap-4">
									<div>
										<p className="text-[10px] uppercase tracking-[0.22em] text-[#9d7e63]">
											{item.city}
										</p>
										<h3 className="mt-2 text-2xl font-semibold tracking-[-0.035em] text-[#241915]">
											{item.title}
										</h3>
									</div>
									<span className="rounded-full border border-[#e5d4bf] bg-[#fffaf5] px-3 py-1 text-xs text-[#6b574e]">
										Identity gated
									</span>
								</div>
								<p className="mt-4 text-sm leading-6 text-[#5f4b44]">
									{item.focus}
								</p>
								<p className="mt-4 border-t border-[#eadcc9] pt-4 text-sm leading-6 text-[#7a6256]">
									{item.sellPoint}
								</p>
							</article>
						))}
					</div>
				</section>
			</div>
		</main>
	);
}
