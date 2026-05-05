import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";

import { cityShowcase } from "@/lib/city-showcase";
import { destinationPositioningBySlug } from "@/lib/destination-positioning";

const cityScenes: Record<
  (typeof cityShowcase)[number]["slug"],
  {
    highlightsLabel: string;
    highlightsBody: string;
    experienceLabel: string;
    experienceBody: string;
    fitLabel: string;
    fitBody: string;
  }
> = {
  beijing: {
    highlightsLabel: "What defines it",
    highlightsBody:
      "The ceremonial center, the hutong fabric, and the way dynastic scale meets ordinary neighborhood life.",
    experienceLabel: "How to approach it well",
    experienceBody:
      "Balance major historical anchors with long walks, courtyard streets, and time to feel how the city actually breathes.",
    fitLabel: "Who it suits",
    fitBody:
      "Travelers who want history, architecture, ritual, and a capital city that still rewards close reading.",
  },
  quanzhou: {
    highlightsLabel: "What defines it",
    highlightsBody:
      "A great port history, dense temple life, and a rare sense of religions and trade routes layered into one city.",
    experienceLabel: "How to approach it well",
    experienceBody:
      "Treat it as a cultural reading city: move between streets, shrines, port memory, and local rhythms instead of rushing landmarks.",
    fitLabel: "Who it suits",
    fitBody:
      "Travelers who like maritime history, layered belief systems, and places with strong narrative depth.",
  },
  jingdezhen: {
    highlightsLabel: "What defines it",
    highlightsBody:
      "Porcelain history, active workshops, and the feeling that making is still the city’s living language.",
    experienceLabel: "How to approach it well",
    experienceBody:
      "Go beyond shopping and focus on process, kilns, studios, materials, and the people who still shape clay every day.",
    fitLabel: "Who it suits",
    fitBody:
      "Travelers interested in craft, design, material culture, and the beauty of skilled work.",
  },
  chongqing: {
    highlightsLabel: "What defines it",
    highlightsBody:
      "Extreme topography, river-city scale, and a night atmosphere that gives the city unusual visual force.",
    experienceLabel: "How to approach it well",
    experienceBody:
      "Let geography lead: viewpoints, slopes, river edges, old stairs, and late meals reveal more than a checklist of hot spots.",
    fitLabel: "Who it suits",
    fitBody:
      "Travelers who want sensation, urban energy, food, and a city that feels unlike anywhere else.",
  },
  chengdu: {
    highlightsLabel: "What defines it",
    highlightsBody:
      "Tea-house culture, Sichuan flavor, and a rhythm of city life built around comfort, conversation, and return.",
    experienceLabel: "How to approach it well",
    experienceBody:
      "Give it time. Chengdu becomes more meaningful when you allow for long meals, local streets, gardens, and unhurried afternoons.",
    fitLabel: "Who it suits",
    fitBody:
      "Travelers who want food, local daily life, and a culturally rich city that feels soft rather than overwhelming.",
  },
  "jingmai-mountain": {
    highlightsLabel: "What defines it",
    highlightsBody:
      "Ancient tea forests, mountain atmosphere, and a version of China shaped by ecology, ritual, and slowness.",
    experienceLabel: "How to approach it well",
    experienceBody:
      "This is a place for pace reduction: mornings, tea, air, distance, and the feeling of staying with a landscape rather than passing through it.",
    fitLabel: "Who it suits",
    fitBody:
      "Travelers seeking tea culture, mountain quiet, beauty, and a more contemplative route.",
  },
  "wudang-mountain": {
    highlightsLabel: "What defines it",
    highlightsBody:
      "Taoist architecture, mountain routes, and traditions of practice that give the place a philosophical and physical depth.",
    experienceLabel: "How to approach it well",
    experienceBody:
      "Approach it as a mountain culture journey, not only a scenic stop. Space, breath, and early light matter here.",
    fitLabel: "Who it suits",
    fitBody:
      "Travelers drawn to philosophy, mountain landscapes, internal practice, and a stronger spiritual register.",
  },
};

export default function DestinationDetailPage({
  params,
}: {
  params: { slug: string };
}) {
  const city = cityShowcase.find((entry) => entry.slug === params.slug);

  if (!city) {
    notFound();
  }

  const scene = cityScenes[city.slug];
  const positioning = destinationPositioningBySlug[city.slug];

  return (
    <main className="relative min-h-[calc(100vh-76px)] overflow-hidden bg-[#f6efe6] px-6 py-8 text-[#231815]">
      <div className="pointer-events-none absolute inset-0">
        <div className="absolute left-[5%] top-12 h-60 w-60 rounded-full bg-[radial-gradient(circle,_rgba(255,255,255,0.7)_0%,_rgba(255,255,255,0)_74%)]" />
        <div className="absolute right-[8%] top-28 h-72 w-72 rounded-full bg-[radial-gradient(circle,_rgba(202,171,136,0.15)_0%,_rgba(202,171,136,0)_74%)]" />
      </div>

      <div className="relative z-10 mx-auto flex w-full max-w-[1480px] flex-col gap-8">
        <section className="grid gap-6 lg:grid-cols-[1.02fr_0.98fr] lg:items-end">
          <div className="max-w-4xl pt-8 sm:pt-14">
            <Link
              href="/destinations"
              className="text-[11px] uppercase tracking-[0.3em] text-[#8f725d] transition hover:text-[#6b574e] sm:text-xs"
            >
              Destinations
            </Link>
            <h1 className="mt-4 font-serif text-5xl font-semibold leading-[1.02] tracking-[-0.055em] text-[#221713] sm:text-7xl lg:text-[5.5rem]">
              {city.name}
            </h1>
            <p className="mt-5 max-w-3xl text-base leading-7 text-[#685149] sm:text-[1.12rem] sm:leading-8">
              {city.detail}
            </p>
          </div>

          <div className="rounded-[2rem] border border-white/55 bg-[linear-gradient(180deg,rgba(255,253,249,0.82),rgba(245,237,225,0.7))] p-5 shadow-[0_36px_90px_-46px_rgba(69,45,25,0.38)] backdrop-blur-2xl sm:p-6">
            <div className="flex items-center justify-between text-[11px] uppercase tracking-[0.22em] text-[#8b7368]">
              <span>{city.eyebrow}</span>
              <span>Route lens</span>
            </div>
            <p className="mt-5 text-2xl font-semibold tracking-[-0.035em] text-[#271a16]">
              {positioning.signatureHook}
            </p>
            <p className="mt-4 text-sm leading-7 text-[#5e4b43] sm:text-[15px]">
              {city.rhythm}
            </p>
            <div className="mt-6 flex flex-wrap gap-2">
              {city.highlights.map((highlight) => (
                <span
                  key={highlight}
                  className="rounded-full border border-[#e6d5c1] bg-white/72 px-3 py-1 text-xs text-[#6a554d]"
                >
                  {highlight}
                </span>
              ))}
            </div>
          </div>
        </section>

        <section className="relative overflow-hidden rounded-[2.2rem] border border-[#ddcab0]/70 shadow-[0_28px_70px_-36px_rgba(78,51,29,0.28)]">
          <div className="relative h-[320px] sm:h-[420px] lg:h-[520px]">
            <Image
              src={city.image}
              alt={city.name}
              fill
              priority
              sizes="100vw"
              className="object-cover"
            />
            <div className="absolute inset-0 bg-[linear-gradient(to_top,rgba(19,12,11,0.76),rgba(19,12,11,0.16)_38%,transparent)]" />
            <div className="absolute inset-x-0 bottom-0 p-6 text-white sm:p-8">
              <p className="text-[10px] uppercase tracking-[0.24em] text-white/72">
                Why it matters
              </p>
              <p className="mt-3 max-w-3xl text-sm leading-7 text-white/92 sm:text-[1rem]">
                {city.idealFor}
              </p>
            </div>
          </div>
        </section>

        <section className="grid gap-4 md:grid-cols-3">
          <div className="rounded-[1.8rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.8),rgba(244,236,225,0.7))] p-5 shadow-[0_24px_60px_-40px_rgba(58,36,24,0.24)] backdrop-blur-2xl sm:p-6">
            <p className="text-[10px] uppercase tracking-[0.24em] text-[#9d7e63]">
              {scene.highlightsLabel}
            </p>
            <p className="mt-3 text-sm leading-7 text-[#634f47] sm:text-[15px]">
              {scene.highlightsBody}
            </p>
          </div>
          <div className="rounded-[1.8rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.8),rgba(244,236,225,0.7))] p-5 shadow-[0_24px_60px_-40px_rgba(58,36,24,0.24)] backdrop-blur-2xl sm:p-6">
            <p className="text-[10px] uppercase tracking-[0.24em] text-[#9d7e63]">
              {scene.experienceLabel}
            </p>
            <p className="mt-3 text-sm leading-7 text-[#634f47] sm:text-[15px]">
              {scene.experienceBody}
            </p>
          </div>
          <div className="rounded-[1.8rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.8),rgba(244,236,225,0.7))] p-5 shadow-[0_24px_60px_-40px_rgba(58,36,24,0.24)] backdrop-blur-2xl sm:p-6">
            <p className="text-[10px] uppercase tracking-[0.24em] text-[#9d7e63]">
              {scene.fitLabel}
            </p>
            <p className="mt-3 text-sm leading-7 text-[#634f47] sm:text-[15px]">
              {scene.fitBody}
            </p>
          </div>
        </section>

        <section className="grid gap-4 lg:grid-cols-[0.9fr_1.1fr]">
          <div className="rounded-[2rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.84),rgba(244,236,225,0.72))] p-5 shadow-[0_30px_80px_-44px_rgba(58,36,24,0.28)] backdrop-blur-2xl sm:p-6">
            <p className="text-[11px] uppercase tracking-[0.24em] text-[#8f725d]">
              Why come here
            </p>
            <h2 className="mt-4 text-3xl font-semibold tracking-[-0.04em] text-[#241915] sm:text-[2.15rem]">
              The reason this city earns a place in the route.
            </h2>
            <p className="mt-4 text-sm leading-7 text-[#634f47] sm:text-[15px]">
              {positioning.whyVisit}
            </p>
            <div className="mt-5 rounded-[1.35rem] border border-[#e4d3c0] bg-[#fffaf5]/76 p-4">
              <p className="text-[10px] uppercase tracking-[0.22em] text-[#9d7e63]">
                Avoid this framing
              </p>
              <p className="mt-2 text-sm leading-6 text-[#6a554d]">
                {positioning.doNotSellAs}
              </p>
            </div>
          </div>

          <div className="grid gap-3">
            {positioning.coreSellPoints.map((point) => (
              <div
                key={point.title}
                className="rounded-[1.65rem] border border-white/60 bg-[rgba(255,251,246,0.84)] p-5 shadow-[0_22px_58px_-38px_rgba(58,36,24,0.2)]"
              >
                <p className="text-[10px] uppercase tracking-[0.22em] text-[#9d7e63]">
                  Core selling point
                </p>
                <h3 className="mt-2 text-xl font-semibold tracking-[-0.035em] text-[#241915]">
                  {point.title}
                </h3>
                <p className="mt-2 text-sm leading-7 text-[#634f47]">
                  {point.body}
                </p>
              </div>
            ))}
          </div>
        </section>

        <section className="grid gap-4 lg:grid-cols-[0.82fr_1.18fr]">
          <div className="rounded-[2rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.82),rgba(244,236,225,0.72))] p-5 shadow-[0_26px_70px_-42px_rgba(58,36,24,0.24)] backdrop-blur-2xl sm:p-6">
            <p className="text-[11px] uppercase tracking-[0.24em] text-[#8f725d]">
              Best for
            </p>
            <div className="mt-5 flex flex-wrap gap-2">
              {positioning.bestFor.map((fit) => (
                <span
                  key={fit}
                  className="rounded-full border border-[#e3d2bf] bg-[#fffaf5] px-3 py-1.5 text-xs leading-5 text-[#6b574e]"
                >
                  {fit}
                </span>
              ))}
            </div>
          </div>

          <div className="grid gap-3 md:grid-cols-3">
            {positioning.routeSeeds.map((route) => (
              <div
                key={route.title}
                className="rounded-[1.65rem] border border-[#decbb4]/70 bg-[rgba(255,251,246,0.9)] p-5 shadow-[0_22px_58px_-38px_rgba(58,36,24,0.22)]"
              >
                <p className="text-[10px] uppercase tracking-[0.22em] text-[#9d7e63]">
                  {route.duration}
                </p>
                <h3 className="mt-2 text-lg font-semibold tracking-[-0.035em] text-[#241915]">
                  {route.title}
                </h3>
                <p className="mt-2 text-sm leading-6 text-[#634f47]">
                  {route.body}
                </p>
              </div>
            ))}
          </div>
        </section>

        <section className="rounded-[2rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.82),rgba(244,236,225,0.72))] p-5 shadow-[0_30px_80px_-44px_rgba(58,36,24,0.24)] backdrop-blur-2xl sm:p-6">
          <p className="text-[11px] uppercase tracking-[0.24em] text-[#8f725d]">
            Traveler questions
          </p>
          <div className="mt-5 grid gap-3 md:grid-cols-2">
            {positioning.faq.map((item) => (
              <div
                key={item.question}
                className="rounded-[1.45rem] border border-[#e4d3c0] bg-[#fffaf5]/76 p-4"
              >
                <h3 className="text-base font-semibold tracking-[-0.025em] text-[#241915]">
                  {item.question}
                </h3>
                <p className="mt-2 text-sm leading-6 text-[#6a554d]">
                  {item.answer}
                </p>
              </div>
            ))}
          </div>
        </section>

        <section className="grid gap-4 lg:grid-cols-[1fr_0.92fr] lg:items-end">
          <div className="rounded-[2rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.82),rgba(244,236,225,0.72))] p-5 shadow-[0_30px_80px_-44px_rgba(58,36,24,0.28)] backdrop-blur-2xl sm:p-6">
            <p className="text-[11px] uppercase tracking-[0.24em] text-[#8f725d]">
              Continue from here
            </p>
            <h2 className="mt-4 text-3xl font-semibold tracking-[-0.04em] text-[#241915] sm:text-[2.15rem]">
              Turn {city.name} into a route, not just an idea.
            </h2>
            <p className="mt-4 max-w-2xl text-sm leading-7 text-[#634f47] sm:text-[15px]">
              Use the concierge to shape pacing, combine cities, decide whether
              this should stand alone or be part of a larger itinerary, and move
              toward a travel brief you can refine further.
            </p>
          </div>

          <div className="flex flex-wrap gap-3 lg:justify-end">
            <Link
              href={city.href}
              className="inline-flex min-h-[56px] items-center justify-center rounded-full bg-[linear-gradient(180deg,#26211e,#171311)] px-6 text-sm font-medium text-white shadow-[0_24px_54px_-30px_rgba(24,17,14,0.45)] transition hover:brightness-105"
            >
              Start with {city.name}
            </Link>
            <Link
              href="/destinations"
              className="inline-flex min-h-[56px] items-center justify-center rounded-full border border-[#d6c5b1] bg-[linear-gradient(180deg,#ffffff,#f2ece3)] px-6 text-sm font-medium text-[#231815] shadow-[0_24px_54px_-30px_rgba(45,28,19,0.22)] transition hover:brightness-[1.02]"
            >
              Back to all destinations
            </Link>
          </div>
        </section>
      </div>
    </main>
  );
}
