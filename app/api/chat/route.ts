import { NextResponse } from "next/server";
import { z } from "zod";

import { runConciergeTurn } from "@/lib/concierge/service";

const chatRequestSchema = z.object({
  message: z.string().min(1).max(4000),
  history: z
    .array(
      z.object({
        role: z.enum(["user", "assistant"]),
        content: z.string().min(1).max(4000),
      }),
    )
    .optional(),
});

export async function POST(request: Request) {
  const body = await request.json().catch(() => null);
  const parsed = chatRequestSchema.safeParse(body);

  if (!parsed.success) {
    return NextResponse.json(
      { error: "Please provide a message." },
      { status: 400 },
    );
  }

  const payload = await runConciergeTurn(parsed.data);
  return NextResponse.json(payload);
}
