import Link from "next/link";

import { createSupabaseServerClient } from "@/lib/supabase/server";

export default async function AccountPage() {
  try {
    const supabase = await createSupabaseServerClient();
    const {
      data: { user },
    } = await supabase.auth.getUser();

    if (!user) {
      return (
        <main className="mx-auto flex min-h-screen max-w-3xl flex-col justify-center px-6 py-20">
          <div className="space-y-4 rounded-2xl border p-8">
            <h1 className="text-2xl font-semibold">Account</h1>
            <p className="text-muted-foreground">You are not signed in yet.</p>
            <Link className="text-sm underline" href="/login">
              Go to login
            </Link>
          </div>
        </main>
      );
    }

    return (
      <main className="mx-auto flex min-h-screen max-w-3xl flex-col justify-center px-6 py-20">
        <div className="space-y-4 rounded-2xl border p-8">
          <h1 className="text-2xl font-semibold">Account</h1>
          <p className="text-muted-foreground">Signed in as {user.email}</p>
          <p className="text-sm text-muted-foreground">
            This page is ready for Phase 1 Supabase wiring.
          </p>
        </div>
      </main>
    );
  } catch {
    return (
      <main className="mx-auto flex min-h-screen max-w-3xl flex-col justify-center px-6 py-20">
        <div className="space-y-4 rounded-2xl border p-8">
          <h1 className="text-2xl font-semibold">Account</h1>
          <p className="text-muted-foreground">
            Supabase environment variables are not configured yet.
          </p>
        </div>
      </main>
    );
  }
}
