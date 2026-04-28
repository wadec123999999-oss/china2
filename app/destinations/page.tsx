import Image from "next/image";
import Link from "next/link";

import { cityShowcase } from "@/lib/city-showcase";

const highlightedSlugs = [
	"beijing",
	"chengdu",
	"quanzhou",
	"jingdezhen",
	"jingmai-mountain",
	"wudang-mountain",
	"chongqing",
] as const;

const planningSteps = [
	{
		title: "Find your starting point",
		body: "Begin with the city, mood, or cultural thread that feels most alive to you.",
	},
	{
		title: "Clarify the route with AI",
		body: "Move into the concierge when you want pacing, city order, or a first route brief.",
	},
	{
		title: "Deepen into custom planning",
		body: "Once the direction feels right, continue into tailored itinerary thinking and local support.",
	},
] as const;

export default function DestinationsPage() {
	const cities = highlightedSlugs
		.map((slug) => cityShowcase.find((city) => city.slug === slug))
		.filter((city): city is (typeof cityShowcase)[number] => Boolean(city));

	return (
		<main className="relative min-h-[calc(100vh-76px)] overflow-hidden bg-[#f4ede4] px-6 py-8 text-[#231815]">
			<div className="pointer-events-none absolute inset-0">
				<div className="absolute left-[8%] top-8 h-56 w-56 rounded-full bg-[radial-gradient(circle,_rgba(255,255,255,0.72)_0%,_rgba(255,255,255,0)_72%)]" />
				<div className="absolute right-[10%] top-24 h-72 w-72 rounded-full bg-[radial-gradient(circle,_rgba(214,187,154,0.16)_0%,_rgba(214,187,154,0)_74%)]" />
				<div className="absolute inset-x-0 top-0 h-72 bg-[linear-gradient(180deg,rgba(255,255,255,0.28),rgba(255,255,255,0))]" />
			</div>

			<div className="relative z-10 mx-auto flex w-full max-w-[1480px] flex-col gap-8">
				<section className="grid gap-6 lg:grid-cols-[1.08fr_0.92fr] lg:items-end">
					<div className="max-w-4xl pt-8 sm:pt-14">
						<p className="text-[11px] uppercase tracking-[0.34em] text-[#8f725d] sm:text-xs">
							Destinations
						</p>
						<h1 className="mt-4 max-w-5xl font-serif text-5xl font-semibold leading-[1.02] tracking-[-0.055em] text-[#221713] sm:text-7xl lg:text-[5.5rem]">
							Seven ways into a deeper China.
						</h1>
						<p className="mt-5 max-w-2xl text-base leading-7 text-[#685149] sm:text-[1.12rem] sm:leading-8">
							Start from the city that feels most magnetic: imperial history,
							tea mountains, porcelain craft, port memory, Taoist stillness,
							gentle urban life, or cinematic mountain-city intensity.
						</p>
					</div>

					<div className="rounded-[2rem] border border-white/55 bg-[linear-gradient(180deg,rgba(255,253,249,0.82),rgba(245,237,225,0.7))] p-5 shadow-[0_36px_90px_-46px_rgba(69,45,25,0.38)] backdrop-blur-2xl sm:p-6">
						<div className="flex items-center justify-between text-[11px] uppercase tracking-[0.22em] text-[#8b7368]">
							<span>How to use this</span>
							<span>V1</span>
						</div>
						<div className="mt-5 grid gap-3">
							{planningSteps.map((step, index) => (
								<div
									key={step.title}
									className="rounded-[1.4rem] border border-white/70 bg-white/68 px-4 py-4 shadow-[0_16px_40px_-28px_rgba(0,0,0,0.2)]"
								>
									<p className="text-[10px] uppercase tracking-[0.2em] text-[#9c7b61]">
										Step {index + 1}
									</p>
									<h2 className="mt-2 text-[15px] font-medium text-[#231815]">
										{step.title}
									</h2>
									<p className="mt-1 text-sm leading-6 text-[#6a554d]">
										{step.body}
									</p>
								</div>
							))}
						</div>
					</div>
				</section>

				<section className="grid gap-5 md:grid-cols-2 xl:grid-cols-3">
					{cities.map((city) => (
						<Link
							key={city.slug}
							href={`/destinations/${city.slug}`}
							className="group overflow-hidden rounded-[2rem] border border-[#dcc8ad]/70 bg-[rgba(255,251,246,0.9)] shadow-[0_24px_64px_-34px_rgba(71,44,23,0.28)] transition duration-300 hover:-translate-y-1 hover:shadow-[0_30px_74px_-34px_rgba(71,44,23,0.34)]"
						>
							<div className="relative h-72 overflow-hidden">
								<Image
									src={city.image}
									alt={city.name}
									fill
									sizes="(max-width: 768px) 100vw, (max-width: 1280px) 50vw, 33vw"
									className="object-cover transition duration-700 group-hover:scale-[1.04]"
								/>
								<div className="absolute inset-0 bg-[linear-gradient(to_top,rgba(22,16,14,0.84),rgba(22,16,14,0.26)_45%,transparent)]" />
								<div className="absolute inset-x-0 bottom-0 p-5 text-white">
									<p className="text-[10px] uppercase tracking-[0.22em] text-white/74">
										{city.eyebrow}
									</p>
									<div className="mt-2 flex items-end justify-between gap-4">
										<h2 className="font-serif text-3xl tracking-[-0.04em] sm:text-[2rem]">
											{city.name}
										</h2>
										<span className="text-sm text-white/78 transition group-hover:translate-x-1">
											Enter →
										</span>
									</div>
								</div>
							</div>

							<div className="space-y-4 p-5 sm:p-6">
								<p className="text-sm leading-7 text-[#5f4b44]">
									{city.detail}
								</p>
								<div>
									<p className="text-[10px] uppercase tracking-[0.2em] text-[#9d7e63]">
										Best for
									</p>
									<p className="mt-2 text-sm leading-6 text-[#6a554d]">
										{city.idealFor}
									</p>
								</div>
								<div className="flex flex-wrap gap-2">
									{city.highlights.map((highlight) => (
										<span
											key={highlight}
											className="rounded-full border border-[#e5d4bf] bg-[#fffaf5] px-3 py-1 text-xs text-[#6b574e]"
										>
											{highlight}
										</span>
									))}
								</div>
							</div>
						</Link>
					))}
				</section>

				<section className="grid gap-4 lg:grid-cols-[1.05fr_0.95fr] lg:items-center">
					<div className="rounded-[2rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.8),rgba(244,236,225,0.68))] p-5 shadow-[0_30px_80px_-44px_rgba(58,36,24,0.36)] backdrop-blur-2xl sm:p-6">
						<p className="text-[11px] uppercase tracking-[0.26em] text-[#8f725d]">
							What comes next
						</p>
						<h2 className="mt-4 text-3xl font-semibold tracking-[-0.04em] text-[#241915] sm:text-[2.2rem]">
							When a city feels right, let the concierge shape the route.
						</h2>
						<p className="mt-4 max-w-2xl text-sm leading-7 text-[#634f47] sm:text-[15px]">
							The city pages are for orientation. The chat is where pace,
							sequence, travel style, and real trip constraints begin to take
							form.
						</p>
					</div>

					<div className="flex justify-start lg:justify-end">
						<Link
							href="/chat"
							className="inline-flex min-h-[64px] items-center justify-center rounded-full border border-[#d6c5b1] bg-[linear-gradient(180deg,#ffffff,#f2ece3)] px-6 text-sm font-medium text-[#231815] shadow-[0_24px_54px_-30px_rgba(45,28,19,0.32)] transition hover:brightness-[1.02]"
						>
							Open the AI concierge
						</Link>
					</div>
				</section>
			</div>
		</main>
	);
}
