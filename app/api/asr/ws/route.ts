import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json({
    status: "todo",
    message:
      "Realtime ASR WebSocket proxy will live here. Use /api/voice/turn for the current upload-based voice loop.",
  });
}
