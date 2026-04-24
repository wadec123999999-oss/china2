"use client";

import Image from "next/image";
import Link from "next/link";
import { useRouter } from "next/navigation";

import { cityShowcase } from "@/lib/city-showcase";

const curatedCities = [
  "beijing",
  "chongqing",
  "chengdu",
  "jingdezhen",
  "quanzhou",
  "jingmai-mountain",
  "wudang-mountain",
] as const;

const entryPoints = [
  {
    title: "Begin with AI",
    description:
      "Speak or type what kind of China you want, and let the concierge shape the first route.",
    href: "/chat",
    label: "Open concierge",
  },
  {
    title: "Explore the seven cities",
    description:
      "Start from Beijing, Chengdu, Chongqing, Quanzhou, Jingmai, Jingdezhen, and Wudang Mountain.",
    href: "/destinations",
    label: "Browse the world",
  },
  {
    title: "Move into custom planning",
    description:
      "From first brief to refined itinerary to trusted on-the-ground help, the journey deepens in stages.",
    href: "/chat",
    label: "See the flow",
  },
] as const;

const serviceLayers = [
  {
    eyebrow: "Step 1",
    title: "AI consultation",
    body: "Lower the barrier to asking. Start with voice or text and turn a vague idea into a credible route direction.",
  },
  {
    eyebrow: "Step 2",
    title: "Human refinement",
    body: "Upgrade into itinerary thinking shaped around pace, cities, cultural depth, and the trip you actually want.",
  },
  {
    eyebrow: "Step 3",
    title: "Local support",
    body: "When the direction is right, move into trusted experts, guides, and on-the-ground execution.",
  },
] as const;

export default function Home() {
  const router = useRouter();

  const orderedCities = curatedCities
    .map((slug) => cityShowcase.find((city) => city.slug === slug))
    .filter((city): city is (typeof cityShowcase)[number] => Boolean(city));

  return (
    <main className="relative min-h-[calc(100vh-76px)] overflow-hidden bg-[#f7f0e8] px-6 pb-8 text-[#231815]">
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

      <div className="relative z-10 mx-auto flex min-h-[calc(100vh-76px)] w-full max-w-[1480px] flex-col gap-8 pt-8 sm:pt-10">
        <section className="grid gap-8 lg:grid-cols-[1.12fr_0.88fr] lg:items-end">
          <div className="max-w-4xl pt-8 sm:pt-14 lg:pt-20">
            <p className="text-[11px] uppercase tracking-[0.34em] text-[#8f725d] sm:text-xs">
              a Deeper China
            </p>
            <h1 className="mt-4 max-w-5xl font-serif text-5xl font-semibold leading-[1.02] tracking-[-0.055em] text-[#221713] sm:text-7xl lg:text-[5.6rem]">
              China, Closely:
              <span className="block text-[#4a342b]">See the unseen.</span>
            </h1>
            <p className="mt-5 max-w-2xl text-base leading-7 text-[#685149] sm:text-[1.12rem] sm:leading-8">
              A refined way into China for travelers drawn to culture,
              architecture, food, ritual, craft, and the routes that do not feel
              like everyone else’s.
            </p>
          </div>

          <div className="rounded-[2rem] border border-white/55 bg-[linear-gradient(180deg,rgba(255,253,249,0.82),rgba(245,237,225,0.7))] p-5 shadow-[0_36px_90px_-46px_rgba(69,45,25,0.38)] backdrop-blur-2xl sm:p-6">
            <div className="flex items-center justify-between text-[11px] uppercase tracking-[0.22em] text-[#8b7368]">
              <span>Positioning</span>
              <span>V1</span>
            </div>
            <p className="mt-5 text-2xl font-semibold tracking-[-0.035em] text-[#271a16]">
              An AI-led journey into a more meaningful China.
            </p>
            <p className="mt-4 text-sm leading-7 text-[#5e4b43] sm:text-[15px]">
              Begin with conversation, move into route refinement, and continue
              into trusted local support only when the trip becomes real.
            </p>
            <div className="mt-6 grid gap-3">
              {entryPoints.map((entry) => (
                <Link
                  key={entry.title}
                  href={entry.href}
                  className="rounded-[1.3rem] border border-white/70 bg-white/72 px-4 py-4 shadow-[0_16px_40px_-28px_rgba(0,0,0,0.2)] transition hover:bg-white"
                >
                  <div className="flex items-center justify-between gap-4">
                    <div>
                      <h2 className="text-[15px] font-medium text-[#231815]">
                        {entry.title}
                      </h2>
                      <p className="mt-1 text-sm leading-6 text-[#6a554d]">
                        {entry.description}
                      </p>
                    </div>
                    <span className="shrink-0 text-[11px] uppercase tracking-[0.18em] text-[#9c7b61]">
                      {entry.label}
                    </span>
                  </div>
                </Link>
              ))}
            </div>
          </div>
        </section>

        <section className="grid gap-3 md:grid-cols-7">
          {orderedCities.map((city) => (
            <Link
              key={city.slug}
              href={city.href}
              className="group relative block min-h-[182px] overflow-hidden rounded-[0.35rem] border border-[#d7c2a2]/60 bg-[#fff8f3] text-left shadow-[0_18px_48px_-28px_rgba(88,58,22,0.22)]"
            >
              <Image
                src={city.image}
                alt={city.name}
                fill
                className="object-contain object-center transition duration-700 group-hover:scale-[1.02]"
                style={{ objectPosition: city.imagePosition }}
                sizes="(max-width: 768px) 100vw, 14vw"
              />
              <div className="absolute inset-0 bg-[radial-gradient(circle_at_center,rgba(255,255,255,0.02),rgba(20,13,12,0.18)_46%,rgba(20,13,12,0.72))]" />
              <div className="absolute inset-x-0 bottom-0 p-3.5">
                <p className="text-[10px] uppercase tracking-[0.18em] text-white/72">
                  {city.name}
                </p>
                <p className="mt-2 max-w-full text-[11px] leading-4.5 text-white drop-shadow-[0_2px_10px_rgba(0,0,0,0.68)]">
                  {city.blurb}
                </p>
              </div>
            </Link>
          ))}
        </section>

        <section className="grid gap-4 lg:grid-cols-[1fr_0.92fr] lg:items-end">
          <div className="rounded-[2.2rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.8),rgba(244,236,225,0.68))] p-5 shadow-[0_30px_80px_-44px_rgba(58,36,24,0.36)] backdrop-blur-2xl sm:p-6">
            <div className="grid gap-4 md:grid-cols-3">
              {serviceLayers.map((layer) => (
                <div
                  key={layer.title}
                  className="rounded-[1.5rem] border border-white/70 bg-white/60 p-4"
                >
                  <p className="text-[10px] uppercase tracking-[0.24em] text-[#9d7e63]">
                    {layer.eyebrow}
                  </p>
                  <h2 className="mt-3 text-lg font-medium tracking-[-0.02em] text-[#241915]">
                    {layer.title}
                  </h2>
                  <p className="mt-2 text-sm leading-6 text-[#634f47]">
                    {layer.body}
                  </p>
                </div>
              ))}
            </div>
          </div>

          <section className="flex justify-center lg:justify-end">
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
        </section>
      </div>
    </main>
  );
}
