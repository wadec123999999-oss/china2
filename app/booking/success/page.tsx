import Link from "next/link";

import { formatCity } from "@/lib/format";
import { getExpertBySlug } from "@/lib/matching/match-experts";

export default function BookingSuccessPage({
  searchParams,
}: {
  searchParams?: Record<string, string | string[] | undefined>;
}) {
  const slugParam = Array.isArray(searchParams?.expert)
    ? searchParams?.expert[0]
    : searchParams?.expert;
  const notesParam = Array.isArray(searchParams?.notes)
    ? searchParams?.notes[0]
    : searchParams?.notes;
  const dateParam = Array.isArray(searchParams?.date)
    ? searchParams?.date[0]
    : searchParams?.date;
  const timeWindowParam = Array.isArray(searchParams?.timeWindow)
    ? searchParams?.timeWindow[0]
    : searchParams?.timeWindow;

  const expert = slugParam ? getExpertBySlug(slugParam) : undefined;

  return (
    <main className="mx-auto max-w-4xl px-6 py-16">
      <section className="rounded-3xl border p-8">
        <div className="space-y-4">
          <p className="text-sm text-muted-foreground">Demo confirmation</p>
          <h1 className="text-3xl font-semibold">Your request is in.</h1>
          <p className="max-w-2xl leading-7 text-muted-foreground">
            In the real product, this page will appear after payment succeeds
            and the booking is written to the database. For now, it closes the
            demo with a clear handoff point.
          </p>
        </div>

        <div className="mt-8 grid gap-6 rounded-2xl bg-muted/40 p-6 sm:grid-cols-2">
          <div>
            <p className="text-sm text-muted-foreground">Expert</p>
            <p className="mt-1 font-medium">
              {expert
                ? `${expert.name} · ${formatCity(expert.city)}`
                : "To be confirmed"}
            </p>
          </div>
          <div>
            <p className="text-sm text-muted-foreground">Preferred date</p>
            <p className="mt-1 font-medium">{dateParam || "Flexible"}</p>
          </div>
          <div>
            <p className="text-sm text-muted-foreground">Time window</p>
            <p className="mt-1 font-medium">{timeWindowParam || "Flexible"}</p>
          </div>
          <div>
            <p className="text-sm text-muted-foreground">Status</p>
            <p className="mt-1 font-medium">Founder review placeholder</p>
          </div>
          <div className="sm:col-span-2">
            <p className="text-sm text-muted-foreground">Your note</p>
            <p className="mt-1 leading-7 text-muted-foreground">
              {notesParam || "No extra notes yet."}
            </p>
          </div>
        </div>

        <div className="mt-8 rounded-2xl border border-dashed p-5 text-sm leading-6 text-muted-foreground">
          Next version: this page will show payment status, booking ID,
          cancellation policy, and confirmation email details.
        </div>

        <div className="mt-8 flex flex-wrap gap-3">
          <Link
            className="inline-flex h-10 items-center justify-center rounded-md bg-foreground px-4 text-sm font-medium text-background"
            href="/experts"
          >
            Browse more experts
          </Link>
          <Link
            className="inline-flex h-10 items-center justify-center rounded-md border px-4 text-sm font-medium"
            href="/chat"
          >
            Start another brief
          </Link>
        </div>
      </section>
    </main>
  );
}
