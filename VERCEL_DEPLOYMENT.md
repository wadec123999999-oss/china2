# Vercel Deployment Checklist

This project is ready to deploy as a public demo through Vercel.

## Recommended First Demo Setup

1. Open https://vercel.com/new.
2. Import GitHub repository `wadec123999999-oss/china2`.
3. Keep framework preset as `Next.js`.
4. Use the default install/build settings:
   - Install command: `pnpm install`
   - Build command: `pnpm build`
   - Output directory: leave empty
5. Add environment variables from `.env.example`.
6. Deploy.

## Minimum Variables For Page-Only Demo

These are enough for the public pages to render:

```text
NEXT_PUBLIC_SITE_URL=https://your-vercel-domain.vercel.app
```

Without Supabase or model keys, the site can still show the homepage, destinations, experts, booking preview, workspace, and login UI. Chat/database/login/voice features may be degraded.

## Recommended Variables For Functional MVP

Add these in Vercel Project Settings -> Environment Variables:

```text
NEXT_PUBLIC_SITE_URL=
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=
LLM_BASE_URL=
LLM_API_KEY=
LLM_MODEL=
```

Use the real values from local `.env.local`, but do not commit those values to GitHub.

## Optional Variables

Use these only when the corresponding feature is ready:

```text
OPENAI_API_KEY=
DASHSCOPE_API_KEY=
DASHSCOPE_ASR_MODEL=
DASHSCOPE_ASR_WS_URL=
EDGE_TTS_URL=
EDGE_TTS_VOICE=
STRIPE_SECRET_KEY=
STRIPE_WEBHOOK_SECRET=
STRIPE_CONNECT_CLIENT_ID=
RESEND_API_KEY=
NEXT_PUBLIC_POSTHOG_KEY=
NEXT_PUBLIC_POSTHOG_HOST=
ADMIN_EMAILS=
CRON_SECRET=
```

## Supabase Notes

Run the SQL files in `supabase/migrations` in order if the target Supabase project is empty. The concierge works best after the decision knowledge tables and seed data are present.

For a first public demo, it is acceptable to deploy the site before fully wiring Supabase, as long as you understand that database-grounded answers and login persistence will not be complete.

## Current Build Status

Last verified locally:

```text
pnpm typecheck
pnpm build
```

Both passed before this checklist was added.
