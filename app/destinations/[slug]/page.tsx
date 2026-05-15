import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";

import { cityShowcase } from "@/lib/city-showcase";
import { destinationGuides } from "@/lib/destination-guides";
import { destinationItineraryBlueprints } from "@/lib/destination-itineraries";
import { destinationPositioningBySlug } from "@/lib/destination-positioning";

export default function DestinationDetailPage({
  params,
}: {
  params: { slug: string };
}) {
  const city = cityShowcase.find((entry) => entry.slug === params.slug);

  if (!city) {
    notFound();
  }

  const positioning = destinationPositioningBySlug[city.slug];
  const guide = destinationGuides[city.slug];
  const itineraryBlueprints = destinationItineraryBlueprints[city.slug];

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
              {guide.editorialLead}
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
          <div className="relative h-[320px] sm:h-[430px] lg:h-[540px]">
            <Image
              src={city.image}
              alt={city.name}
              fill
              priority
              sizes="100vw"
              className="object-cover"
              style={{ objectPosition: city.imagePosition }}
            />
            <div className="absolute inset-0 bg-[linear-gradient(to_top,rgba(19,12,11,0.78),rgba(19,12,11,0.16)_42%,transparent)]" />
            <div className="absolute inset-x-0 bottom-0 grid gap-4 p-6 text-white sm:p-8 lg:grid-cols-[1fr_0.72fr] lg:items-end">
              <div>
                <p className="text-[10px] uppercase tracking-[0.24em] text-white/72">
                  Why it matters
                </p>
                <p className="mt-3 max-w-3xl text-sm leading-7 text-white/92 sm:text-[1rem]">
                  {city.idealFor}
                </p>
              </div>
              <p className="rounded-[1.35rem] border border-white/18 bg-white/12 p-4 text-xs leading-6 text-white/82 backdrop-blur-md sm:text-sm">
                {guide.visualCaption}
              </p>
            </div>
          </div>
        </section>

        <section className="grid gap-4 lg:grid-cols-[0.88fr_1.12fr]">
          <div className="rounded-[2rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.84),rgba(244,236,225,0.72))] p-5 shadow-[0_30px_80px_-44px_rgba(58,36,24,0.28)] backdrop-blur-2xl sm:p-6">
            <p className="text-[11px] uppercase tracking-[0.24em] text-[#8f725d]">
              Not a generic guide
            </p>
            <h2 className="mt-4 text-3xl font-semibold tracking-[-0.04em] text-[#241915] sm:text-[2.15rem]">
              {guide.notGeneric.title}
            </h2>
            <p className="mt-4 text-sm leading-7 text-[#634f47] sm:text-[15px]">
              {guide.notGeneric.body}
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

          <div className="grid gap-3 md:grid-cols-3">
            {guide.readTheCity.map((item) => (
              <div
                key={item.title}
                className="rounded-[1.65rem] border border-white/60 bg-[rgba(255,251,246,0.84)] p-5 shadow-[0_22px_58px_-38px_rgba(58,36,24,0.2)]"
              >
                <p className="text-[10px] uppercase tracking-[0.22em] text-[#9d7e63]">
                  Read the city
                </p>
                <h3 className="mt-2 text-lg font-semibold tracking-[-0.035em] text-[#241915]">
                  {item.title}
                </h3>
                <p className="mt-2 text-sm leading-7 text-[#634f47]">
                  {item.body}
                </p>
              </div>
            ))}
          </div>
        </section>

        <section className="grid gap-4 lg:grid-cols-[0.82fr_1.18fr]">
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

        <section className="rounded-[2rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.82),rgba(244,236,225,0.72))] p-5 shadow-[0_30px_80px_-44px_rgba(58,36,24,0.24)] backdrop-blur-2xl sm:p-6">
          <div className="flex flex-col gap-3 sm:flex-row sm:items-end sm:justify-between">
            <div>
              <p className="text-[11px] uppercase tracking-[0.24em] text-[#8f725d]">
                Signature days
              </p>
              <h2 className="mt-3 text-3xl font-semibold tracking-[-0.04em] text-[#241915] sm:text-[2.15rem]">
                Build the itinerary around the city&apos;s own logic.
              </h2>
            </div>
            <p className="max-w-md text-sm leading-7 text-[#634f47]">
              These are not fixed packages. They are planning modules the
              concierge can reshape by pace, budget, season, and traveler type.
            </p>
          </div>

          <div className="mt-6 grid gap-3 md:grid-cols-3">
            {guide.signatureDays.map((day) => (
              <div
                key={day.title}
                className="rounded-[1.65rem] border border-[#decbb4]/70 bg-[rgba(255,251,246,0.9)] p-5 shadow-[0_22px_58px_-38px_rgba(58,36,24,0.22)]"
              >
                <h3 className="text-lg font-semibold tracking-[-0.035em] text-[#241915]">
                  {day.title}
                </h3>
                <p className="mt-2 text-sm leading-6 text-[#634f47]">
                  {day.body}
                </p>
              </div>
            ))}
          </div>
        </section>

        <section className="rounded-[2rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.82),rgba(244,236,225,0.72))] p-5 shadow-[0_30px_80px_-44px_rgba(58,36,24,0.24)] backdrop-blur-2xl sm:p-6">
          <div className="flex flex-col gap-3 sm:flex-row sm:items-end sm:justify-between">
            <div>
              <p className="text-[11px] uppercase tracking-[0.24em] text-[#8f725d]">
                3 / 5 / 7 day blueprints
              </p>
              <h2 className="mt-3 text-3xl font-semibold tracking-[-0.04em] text-[#241915] sm:text-[2.15rem]">
                Pick the depth before picking the sights.
              </h2>
            </div>
            <p className="max-w-md text-sm leading-7 text-[#634f47]">
              These route blueprints are designed to help the concierge avoid a
              generic checklist and choose the right depth for the traveler.
            </p>
          </div>

          <div className="mt-6 grid gap-4 lg:grid-cols-3">
            {itineraryBlueprints.map((blueprint) => (
              <article
                key={blueprint.duration}
                className="flex h-full flex-col rounded-[1.75rem] border border-[#decbb4]/70 bg-[rgba(255,251,246,0.9)] p-5 shadow-[0_22px_58px_-38px_rgba(58,36,24,0.22)]"
              >
                <p className="text-[10px] uppercase tracking-[0.22em] text-[#9d7e63]">
                  {blueprint.duration}
                </p>
                <h3 className="mt-2 text-xl font-semibold tracking-[-0.035em] text-[#241915]">
                  {blueprint.title}
                </h3>
                <p className="mt-3 text-sm leading-6 text-[#634f47]">
                  {blueprint.routeLogic}
                </p>
                <div className="mt-4 rounded-[1.2rem] border border-[#eadbca] bg-white/62 p-4">
                  <p className="text-[10px] uppercase tracking-[0.22em] text-[#9d7e63]">
                    Best for
                  </p>
                  <p className="mt-2 text-sm leading-6 text-[#6a554d]">
                    {blueprint.bestFor}
                  </p>
                </div>
                <ol className="mt-4 flex flex-1 flex-col gap-2">
                  {blueprint.days.map((day, index) => (
                    <li
                      key={day}
                      className="grid grid-cols-[2.2rem_1fr] gap-3 rounded-[1rem] border border-[#eadbca] bg-[#fffaf5]/72 p-3 text-sm leading-6 text-[#604c44]"
                    >
                      <span className="flex h-8 w-8 items-center justify-center rounded-full bg-[#2a211d] text-xs font-semibold text-white">
                        {index + 1}
                      </span>
                      <span>{day}</span>
                    </li>
                  ))}
                </ol>
                <p className="mt-4 rounded-[1.2rem] bg-[#2a211d] p-4 text-sm leading-6 text-white/88">
                  {blueprint.conversionPrompt}
                </p>
              </article>
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
            {guide.travelerFit.map((fit) => (
              <div
                key={fit.title}
                className="rounded-[1.65rem] border border-[#decbb4]/70 bg-[rgba(255,251,246,0.9)] p-5 shadow-[0_22px_58px_-38px_rgba(58,36,24,0.22)]"
              >
                <p className="text-[10px] uppercase tracking-[0.22em] text-[#9d7e63]">
                  Traveler fit
                </p>
                <h3 className="mt-2 text-lg font-semibold tracking-[-0.035em] text-[#241915]">
                  {fit.title}
                </h3>
                <p className="mt-2 text-sm leading-6 text-[#634f47]">
                  {fit.body}
                </p>
              </div>
            ))}
          </div>
        </section>

        <section className="grid gap-4 lg:grid-cols-[1.08fr_0.92fr]">
          <div className="rounded-[2rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.82),rgba(244,236,225,0.72))] p-5 shadow-[0_30px_80px_-44px_rgba(58,36,24,0.24)] backdrop-blur-2xl sm:p-6">
            <p className="text-[11px] uppercase tracking-[0.24em] text-[#8f725d]">
              Planning signals
            </p>
            <div className="mt-5 grid gap-3 md:grid-cols-3">
              {guide.planningSignals.map((signal) => (
                <div
                  key={signal.title}
                  className="rounded-[1.45rem] border border-[#e4d3c0] bg-[#fffaf5]/76 p-4"
                >
                  <h3 className="text-base font-semibold tracking-[-0.025em] text-[#241915]">
                    {signal.title}
                  </h3>
                  <p className="mt-2 text-sm leading-6 text-[#6a554d]">
                    {signal.body}
                  </p>
                </div>
              ))}
            </div>
          </div>

          <div className="rounded-[2rem] border border-white/60 bg-[linear-gradient(180deg,rgba(255,252,247,0.82),rgba(244,236,225,0.72))] p-5 shadow-[0_30px_80px_-44px_rgba(58,36,24,0.24)] backdrop-blur-2xl sm:p-6">
            <p className="text-[11px] uppercase tracking-[0.24em] text-[#8f725d]">
              Research anchors
            </p>
            <p className="mt-3 text-sm leading-7 text-[#634f47]">
              These sources keep the page tied to durable cultural evidence
              rather than generic AI travel copy.
            </p>
            <div className="mt-5 grid gap-2">
              {guide.sourceAnchors.map((source) => (
                <a
                  key={source.url}
                  href={source.url}
                  target="_blank"
                  rel="noreferrer"
                  className="rounded-full border border-[#e3d2bf] bg-[#fffaf5] px-4 py-3 text-sm text-[#4d3d36] transition hover:border-[#c4aa91] hover:bg-white"
                >
                  {source.label}
                </a>
              ))}
            </div>
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
