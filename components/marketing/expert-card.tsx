import Link from "next/link";

import { formatCategory, formatCity } from "@/lib/format";
import type { ExpertProfile } from "@/lib/mock-data";
import { usd } from "@/lib/money";

type Props = {
  expert: ExpertProfile;
  reasons?: string[];
};

export function ExpertCard({ expert, reasons }: Props) {
  return (
    <article className="rounded-2xl border p-6 shadow-sm">
      <div className="space-y-4">
        <div className="space-y-1">
          <p className="text-sm text-muted-foreground">
            {formatCity(expert.city)}
          </p>
          <h2 className="text-xl font-semibold">{expert.name}</h2>
          <p className="text-sm text-muted-foreground">{expert.headline}</p>
        </div>
        <div className="flex flex-wrap gap-2 text-xs text-muted-foreground">
          {expert.categories.map((category) => (
            <span key={category} className="rounded-full border px-2 py-1">
              {formatCategory(category)}
            </span>
          ))}
        </div>
        <p className="text-sm leading-6 text-muted-foreground">{expert.bio}</p>
        {reasons?.length ? (
          <ul className="space-y-1 text-sm text-muted-foreground">
            {reasons.map((reason) => (
              <li key={reason}>• {reason}</li>
            ))}
          </ul>
        ) : null}
        <div className="rounded-2xl bg-muted/30 p-4 text-sm text-muted-foreground">
          <p className="font-medium text-foreground">Sample session</p>
          <p className="mt-2 leading-6">{expert.sampleSession}</p>
        </div>
        <div className="flex items-center justify-between gap-4 pt-2">
          <p className="text-sm font-medium">
            From {usd(expert.hourlyRateCents)} / hour
          </p>
          <Link className="text-sm underline" href={`/experts/${expert.slug}`}>
            View profile
          </Link>
        </div>
      </div>
    </article>
  );
}
