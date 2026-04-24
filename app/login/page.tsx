import { redirect } from "next/navigation";
import { z } from "zod";

import { createSupabaseServerClient } from "@/lib/supabase/server";

const loginSchema = z.object({
  email: z.string().email(),
});

async function sendMagicLink(formData: FormData): Promise<void> {
  "use server";

  const parsed = loginSchema.safeParse({
    email: formData.get("email"),
  });

  if (!parsed.success) {
    redirect("/login?status=invalid-email");
  }

  try {
    const supabase = await createSupabaseServerClient();
    const { error } = await supabase.auth.signInWithOtp({
      email: parsed.data.email,
      options: {
        emailRedirectTo: `${process.env.NEXT_PUBLIC_SITE_URL ?? "http://localhost:3000"}/account`,
      },
    });

    if (error) {
      redirect("/login?status=error");
    }

    redirect("/login?status=sent");
  } catch {
    redirect("/login?status=missing-env");
  }
}

export default function LoginPage({
  searchParams,
}: {
  searchParams?: { status?: string };
}) {
  const status = searchParams?.status;

  return (
    <main className="mx-auto flex min-h-screen max-w-3xl flex-col justify-center px-6 py-20">
      <div className="space-y-6 rounded-2xl border p-8">
        <div className="space-y-2">
          <h1 className="text-2xl font-semibold">Login</h1>
          <p className="text-muted-foreground">
            Sign in with a magic link to save your travel brief and bookings.
          </p>
          {status ? (
            <p className="text-sm text-muted-foreground">
              {status === "sent" && "Magic link sent. Check your inbox."}
              {status === "invalid-email" && "Please enter a valid email."}
              {status === "error" && "Could not send your magic link yet."}
              {status === "missing-env" &&
                "Supabase environment variables are not configured yet."}
            </p>
          ) : null}
        </div>
        <form action={sendMagicLink} className="space-y-4">
          <div className="space-y-2">
            <label className="text-sm font-medium" htmlFor="email">
              Email
            </label>
            <input
              className="w-full rounded-md border bg-background px-3 py-2 text-sm"
              id="email"
              name="email"
              placeholder="you@example.com"
              type="email"
              required
            />
          </div>
          <button
            className="inline-flex h-10 items-center justify-center rounded-md bg-foreground px-4 text-sm font-medium text-background"
            type="submit"
          >
            Send magic link
          </button>
        </form>
      </div>
    </main>
  );
}
