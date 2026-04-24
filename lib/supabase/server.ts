import { createServerClient } from "@supabase/ssr";
import { cookies } from "next/headers";

import { getPublicSupabaseEnv } from "@/lib/supabase/env";

export async function createSupabaseServerClient() {
  const result = getPublicSupabaseEnv();

  if (!result.success) {
    throw new Error("Missing public Supabase environment variables.");
  }

  const cookieStore = await cookies();
  const env = result.data;

  return createServerClient(
    env.NEXT_PUBLIC_SUPABASE_URL,
    env.NEXT_PUBLIC_SUPABASE_ANON_KEY,
    {
      cookies: {
        getAll() {
          return cookieStore.getAll();
        },
        setAll(cookieValues) {
          try {
            for (const cookie of cookieValues) {
              cookieStore.set(cookie.name, cookie.value, cookie.options);
            }
          } catch {
            // Ignore cookie writes from server components.
          }
        },
      },
    },
  );
}
