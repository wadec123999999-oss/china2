import { createClient } from "@supabase/supabase-js";

import { getServerSupabaseEnv } from "@/lib/supabase/env";

export function createSupabaseAdminClient() {
  const result = getServerSupabaseEnv();

  if (!result.success) {
    throw new Error("Missing server Supabase environment variables.");
  }

  const env = result.data;

  return createClient(
    env.NEXT_PUBLIC_SUPABASE_URL,
    env.SUPABASE_SERVICE_ROLE_KEY,
    {
      auth: {
        autoRefreshToken: false,
        persistSession: false,
      },
    },
  );
}
