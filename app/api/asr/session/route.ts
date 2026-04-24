import { randomUUID } from "node:crypto";
import { NextResponse } from "next/server";

export async function POST() {
  return NextResponse.json({
    sessionId: randomUUID(),
    wsUrl: "/api/asr/ws",
    sampleRate: 16000,
    chunkMs: 100,
  });
}
