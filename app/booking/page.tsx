import Link from "next/link";

import { formatCity } from "@/lib/format";
import { getExpertBySlug } from "@/lib/matching/match-experts";
import { splitFee, usd } from "@/lib/money";

const trustPoints = [
  "Founder-reviewed expert selection in the earliest version.",
  "Clear pricing shape before payment is turned on.",
  "Future flow will support confirmation, cancellation policy, and email follow-up.",
];

export default function BookingPage({
  searchParams,
}: {
  searchParams?: Record<string, string | string[] | undefined>;
}) {
  const slugParam = Array.isArray(searchParams?.expert)
    ? searchParams?.expert[0]
    : searchParams?.expert;
  const durationParam = Array.isArray(searchParams?.duration)
    ? searchParams?.duration[0]
    : searchParams?.duration;

  const expert = slugParam ? getExpertBySlug(slugParam) : undefined;
  const durationHours = Number(durationParam ?? "3");
  const totalCents = expert ? expert.hourlyRateCents * durationHours : 0;
  const feeSplit = splitFee(totalCents);

  return (
    <main className="mx-auto max-w-5xl px-6 py-16">
      <div className="mb-8 flex items-center justify-between gap-4">
        <div>
          <p className="text-sm text-muted-foreground">Booking demo</p>
          <h1 className="text-3xl font-semibold">Checkout-style placeholder</h1>
        </div>
        <div className="rounded-full border px-3 py-1 text-xs text-muted-foreground">
          Stripe and Supabase will replace this step later
        </div>
      </div>

      <div className="grid gap-8 lg:grid-cols-[1fr_0.9fr]">
        <section className="space-y-6 rounded-3xl border p-8">
          <div className="space-y-2">
            <p className="text-sm text-muted-foreground">Session details</p>
            <p className="text-sm leading-6 text-muted-foreground">
              This page is intentionally designed to feel like a calm
              pre-checkout step. In the real product, it will lead into payment
              and a stored booking record.
            </p>
          </div>

          {expert ? (
            <div className="space-y-6">
              <div className="rounded-2xl bg-muted/40 p-5">
                <p className="text-sm text-muted-foreground">
                  {expert.name} · {formatCity(expert.city)}
                </p>
                <p className="mt-2 text-lg font-medium">{expert.headline}</p>
                <p className="mt-2 text-sm text-muted-foreground">
                  Suggested demo session length: {durationHours} hours
                </p>
              </div>

              <form action="/booking/success" className="space-y-5">
                <input name="expert" type="hidden" value={expert.slug} />
                <input
                  name="duration"
                  type="hidden"
                  value={String(durationHours)}
                />

                <div className="grid gap-4 sm:grid-cols-2">
                  <div className="space-y-2">
                    <label className="text-sm font-medium" htmlFor="date">
                      Preferred date
                    </label>
                    <input
                      className="w-full rounded-md border bg-background px-3 py-2 text-sm"
                      id="date"
                      name="date"
                      type="date"
                    />
                  </div>
                  <div className="space-y-2">
                    <label className="text-sm font-medium" htmlFor="timeWindow">
                      Time window
                    </label>
                    <select
                      className="w-full rounded-md border bg-background px-3 py-2 text-sm"
                      defaultValue="afternoon"
                      id="timeWindow"
                      name="timeWindow"
                    >
                      <option value="morning">Morning</option>
                      <option value="afternoon">Afternoon</option>
                      <option value="evening">Evening</option>
                      <option value="flexible">Flexible</option>
                    </select>
                  </div>
                </div>

                <div className="space-y-2">
                  <label className="text-sm font-medium" htmlFor="notes">
                    What would make this session feel meaningful?
                  </label>
                  <textarea
                    className="min-h-28 w-full rounded-md border bg-background px-3 py-2 text-sm"
                    defaultValue="I want a thoughtful introduction, not a rushed checklist."
                    id="notes"
                    name="notes"
                  />
                </div>

                <div className="rounded-2xl border border-dashed p-4 text-sm text-muted-foreground">
                  In the real checkout, this section will also capture traveler
                  details, payment confirmation, and cancellation policy
                  acknowledgement.
                </div>

                <button
                  className="inline-flex h-10 items-center justify-center rounded-md bg-foreground px-4 text-sm font-medium text-background"
                  type="submit"
                >
                  Continue to confirmation
                </button>
              </form>
            </div>
          ) : (
            <div className="rounded-2xl border border-dashed p-6 text-sm text-muted-foreground">
              Pick an expert first from the directory or matching flow.
            </div>
          )}
        </section>

        <aside className="space-y-5 rounded-3xl border p-8">
          <div>
            <p className="text-sm text-muted-foreground">Order summary</p>
            <h2 className="text-2xl font-semibold">
              {expert ? expert.name : "No expert selected"}
            </h2>
          </div>

          {expert ? (
            <>
              <dl className="space-y-3 text-sm text-muted-foreground">
                <div className="flex items-center justify-between gap-4">
                  <dt>Duration</dt>
                  <dd>{durationHours} hours</dd>
                </div>
                <div className="flex items-center justify-between gap-4">
                  <dt>Total</dt>
                  <dd>{usd(feeSplit.totalCents)}</dd>
                </div>
                <div className="flex items-center justify-between gap-4">
                  <dt>Platform fee</dt>
                  <dd>{usd(feeSplit.platformCents)}</dd>
                </div>
                <div className="flex items-center justify-between gap-4">
                  <dt>Expert share</dt>
                  <dd>{usd(feeSplit.expertCents)}</dd>
                </div>
              </dl>

              <div className="rounded-2xl bg-muted/40 p-5 text-sm text-muted-foreground">
                <p className="font-medium text-foreground">Trust hints</p>
                <ul className="mt-3 space-y-2 leading-6">
                  {trustPoints.map((item) => (
                    <li key={item}>• {item}</li>
                  ))}
                </ul>
              </div>

              <div className="rounded-2xl bg-muted/40 p-5 text-sm text-muted-foreground">
                <p className="font-medium text-foreground">
                  What happens later
                </p>
                <ul className="mt-3 space-y-2 leading-6">
                  <li>• Stripe Checkout will handle payment.</li>
                  <li>• Supabase will store the booking and traveler brief.</li>
                  <li>• Confirmation email will be sent through Resend.</li>
                </ul>
              </div>
            </>
          ) : null}

          <div className="space-y-3 text-sm text-muted-foreground">
            <Link className="inline-flex text-sm underline" href="/experts">
              Back to experts
            </Link>
          </div>
        </aside>
      </div>
    </main>
  );
}
