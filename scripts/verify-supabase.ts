import { createClient } from "@supabase/supabase-js";
import { config as loadEnv } from "dotenv";

loadEnv({ path: ".env.local" });

async function main() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const anonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!url || !anonKey || !serviceRoleKey) {
    throw new Error("Missing Supabase environment variables in .env.local");
  }

  const anonClient = createClient(url, anonKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  const adminClient = createClient(url, serviceRoleKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  const anonResult = await anonClient.from("experts").select("id").limit(1);
  const adminResult = await adminClient.from("profiles").select("id").limit(1);

  console.log(
    JSON.stringify(
      {
        anon: {
          error: anonResult.error?.message ?? null,
          status: anonResult.status,
        },
        admin: {
          error: adminResult.error?.message ?? null,
          status: adminResult.status,
        },
      },
      null,
      2,
    ),
  );
}

void main();
