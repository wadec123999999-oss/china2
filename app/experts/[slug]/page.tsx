import Link from "next/link";
import { notFound } from "next/navigation";

import { formatCategory, formatCity } from "@/lib/format";
import { getExpertBySlug } from "@/lib/matching/match-experts";
import { usd } from "@/lib/money";

export default function ExpertDetailPage({
  params,
}: {
  params: { slug: string };
}) {
  const expert = getExpertBySlug(params.slug);

  if (!expert) {
    notFound();
  }

  return (
    <main className="mx-auto max-w-5xl px-6 py-16">
      <div className="grid gap-8 lg:grid-cols-[1.15fr_0.85fr]">
        <section className="space-y-6 rounded-3xl border p-8">
          <div className="space-y-2">
            <p className="text-sm text-muted-foreground">
              {formatCity(expert.city)}
            </p>
            <h1 className="text-3xl font-semibold">{expert.name}</h1>
            <p className="text-lg text-muted-foreground">{expert.headline}</p>
          </div>

          <div className="flex flex-wrap gap-2 text-sm text-muted-foreground">
            {expert.categories.map((category) => (
              <span key={category} className="rounded-full border px-3 py-1">
                {formatCategory(category)}
              </span>
            ))}
          </div>

          <p className="leading-7 text-muted-foreground">{expert.bio}</p>

          <div className="grid gap-4 sm:grid-cols-2">
            <div className="rounded-2xl bg-muted/30 p-5">
              <p className="text-sm font-medium">What this expert is good at</p>
              <p className="mt-2 text-sm leading-6 text-muted-foreground">
                Slow context, lived local knowledge, and translating a niche
                interest into a memorable half-day or full-day experience.
              </p>
            </div>
            <div className="rounded-2xl bg-muted/30 p-5">
              <p className="text-sm font-medium">Best fit traveler</p>
              <p className="mt-2 text-sm leading-6 text-muted-foreground">
                Curious visitors who value interpretation, pacing, and
                conversation more than checklist tourism.
              </p>
            </div>
          </div>

          <div className="space-y-2">
            <h2 className="text-xl font-semibold">Sample session</h2>
            <p className="leading-7 text-muted-foreground">
              {expert.sampleSession}
            </p>
          </div>

          <div className="space-y-2">
            <h2 className="text-xl font-semibold">Works well for</h2>
            <div className="flex flex-wrap gap-2 text-sm text-muted-foreground">
              {expert.tags.map((tag) => (
                <span key={tag} className="rounded-full border px-3 py-1">
                  {tag}
                </span>
              ))}
            </div>
          </div>
        </section>

        <aside className="space-y-5 rounded-3xl border p-8">
          <div>
            <p className="text-sm text-muted-foreground">Pricing</p>
            <h2 className="text-2xl font-semibold">
              From {usd(expert.hourlyRateCents)} / hour
            </h2>
          </div>
          <dl className="space-y-3 text-sm text-muted-foreground">
            <div className="flex items-center justify-between gap-4">
              <dt>Half day</dt>
              <dd>{usd(expert.halfDayRateCents)}</dd>
            </div>
            <div className="flex items-center justify-between gap-4">
              <dt>Full day</dt>
              <dd>{usd(expert.fullDayRateCents)}</dd>
            </div>
            <div className="flex items-center justify-between gap-4">
              <dt>Languages</dt>
              <dd>{expert.languages.join(", ")}</dd>
            </div>
          </dl>

          <div className="rounded-2xl bg-muted/40 p-5 text-sm text-muted-foreground">
            <p className="font-medium text-foreground">Booking confidence</p>
            <ul className="mt-3 space-y-2 leading-6">
              <li>• Expert page includes pricing shape before checkout.</li>
              <li>
                • Demo flow is designed to feel curated, not transactional.
              </li>
              <li>
                • Final product will support confirmation and policy details.
              </li>
            </ul>
          </div>

          <div className="space-y-3">
            <Link
              className="inline-flex h-10 w-full items-center justify-center rounded-md bg-foreground px-4 text-sm font-medium text-background"
              href={`/booking?expert=${expert.slug}&duration=3`}
            >
              Continue to booking demo
            </Link>
            <Link
              className="inline-flex h-10 w-full items-center justify-center rounded-md border px-4 text-sm font-medium"
              href="/chat"
            >
              Start with a travel brief
            </Link>
            <Link className="inline-flex text-sm underline" href="/experts">
              Back to all experts
            </Link>
          </div>
        </aside>
      </div>
    </main>
  );
}
