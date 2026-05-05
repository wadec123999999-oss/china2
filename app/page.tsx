"use client";

import Image from "next/image";
import Link from "next/link";
import { useRouter } from "next/navigation";

import { cityShowcase } from "@/lib/city-showcase";
import { en } from "@/lib/i18n/en";

const curatedCities = [
	"beijing",
	"chongqing",
	"chengdu",
	"jingdezhen",
	"quanzhou",
	"jingmai-mountain",
	"wudang-mountain",
] as const;

export default function Home() {
	const router = useRouter();

	const orderedCities = curatedCities
		.map((slug) => cityShowcase.find((city) => city.slug === slug))
		.filter((city): city is (typeof cityShowcase)[number] => Boolean(city));

	return (
		<main className="relative min-h-[calc(100vh-76px)] overflow-hidden bg-[#f7f0e8] px-6 pb-3 text-[#261816]">
			<div className="pointer-events-none absolute inset-0 z-0 overflow-hidden">
				<Image
					src="/hero-bg.png"
					alt="Hero background"
					fill
					priority
					quality={100}
					sizes="100vw"
					className="scale-[1.04] object-cover object-center blur-[10px] saturate-[0.34] sepia-[0.2] brightness-[0.98] contrast-[0.68]"
				/>
				<div className="absolute inset-0 bg-[linear-gradient(to_bottom,rgba(253,249,242,0.58),rgba(242,231,211,0.42)_22%,rgba(232,217,192,0.38)_46%,rgba(244,235,220,0.64)_74%,rgba(247,240,232,0.96)),radial-gradient(circle_at_16%_22%,rgba(255,247,231,0.38),transparent_18%),radial-gradient(circle_at_82%_18%,rgba(199,157,102,0.12),transparent_16%),radial-gradient(circle_at_50%_20%,rgba(255,252,247,0.28),transparent_28%),radial-gradient(circle_at_46%_38%,rgba(255,255,255,0.14),transparent_22%)]" />
			</div>

			<div className="relative z-10 flex min-h-[calc(100vh-76px)] flex-col justify-between">
				<section className="grain-overlay relative left-1/2 right-1/2 ml-[-50vw] mr-[-50vw] w-screen overflow-hidden bg-transparent px-6 pb-2 pt-8">
					<div className="pointer-events-none absolute inset-0 z-0 overflow-hidden">
						<div className="absolute inset-x-0 bottom-0 h-32 bg-gradient-to-t from-[#fff4e6]/62 via-[#fff4e8]/24 to-transparent" />
					</div>

					<div className="relative z-10 mx-auto flex min-h-[250px] max-w-4xl flex-col items-center justify-start pt-44 text-center sm:min-h-[280px] sm:pt-48">
						<h1 className="mx-auto max-w-4xl font-serif text-5xl font-semibold leading-[1.04] tracking-[-0.04em] text-[#261816] sm:text-7xl lg:text-[5.2rem]">
							{en.site.name}
						</h1>
						<p className="mx-auto mt-3 max-w-2xl text-base leading-7 text-[#725b57] sm:mt-4 sm:text-xl sm:leading-8">
							A refined way into China for travelers drawn to culture,
							architecture, food, ritual, craft, and the routes that do not feel
							like everyone else&apos;s.
						</p>
					</div>
				</section>

				<div className="relative z-10 mx-auto flex w-full max-w-[1600px] flex-1 flex-col justify-end pb-3">
					<section className="grid gap-3 md:grid-cols-7">
						{orderedCities.map((city) => (
							<Link
								key={city.slug}
								href={`/destinations/${city.slug}`}
								className="group relative block min-h-[152px] overflow-hidden rounded-[0.2rem] bg-transparent text-left shadow-[0_10px_40px_-18px_rgba(110,78,28,0.12)] sm:min-h-[164px]"
							>
								<Image
									src={city.image}
									alt={city.name}
									fill
									className="object-cover transition duration-700 group-hover:scale-[1.05]"
									sizes="(max-width: 768px) 100vw, 14vw"
								/>
								<div className="absolute inset-0 bg-[linear-gradient(to_top,rgba(24,15,14,0.72),rgba(24,15,14,0.16)_42%,transparent)]" />
								<div className="absolute inset-x-0 bottom-0 p-3.5">
									<p className="max-w-full text-[11px] leading-4.5 text-white drop-shadow-[0_2px_10px_rgba(0,0,0,0.65)]">
										{city.blurb}
									</p>
								</div>
							</Link>
						))}
					</section>

					<section className="mt-3 flex justify-center">
						<form
							className="group block w-full max-w-3xl rounded-[999px] border border-[#d9ccb9] bg-[#f5f1ea]/92 p-2.5 shadow-[0_26px_66px_-30px_rgba(46,29,20,0.22)] backdrop-blur-xl transition hover:shadow-[0_30px_72px_-30px_rgba(46,29,20,0.26)]"
							onSubmit={(event) => {
								event.preventDefault();
								const formData = new FormData(event.currentTarget);
								const query = String(formData.get("q") ?? "").trim();
								router.push(
									query ? `/chat?q=${encodeURIComponent(query)}` : "/chat",
								);
							}}
						>
							<div className="rounded-[999px] border border-white/80 bg-[linear-gradient(to_bottom,rgba(255,255,255,0.98),rgba(244,240,234,0.94))] px-4 py-2.5 sm:px-5 sm:py-3">
								<div className="flex items-center gap-3 rounded-[999px] bg-white/92 px-4 py-2.5 text-left text-[#5b554d] shadow-[0_10px_30px_-18px_rgba(0,0,0,0.14),inset_0_1px_0_rgba(255,255,255,0.7)]">
									<span className="text-lg text-[#8e867b]">⌕</span>
									<input
										name="q"
										type="text"
										placeholder="Start with a city, a mood, or the kind of China you want to understand"
										className="w-full bg-transparent text-[15px] text-[#5b554d] outline-none placeholder:text-[#8e867b] sm:text-base"
									/>
								</div>
							</div>
						</form>
					</section>
				</div>
			</div>
		</main>
	);
}
