import { NextResponse } from "next/server";

import { runConciergeTurn } from "@/lib/concierge/service";
import { synthesizeSpeech, transcribeAudio } from "@/lib/voice/providers";

export async function POST(request: Request) {
  const formData = await request.formData().catch(() => null);
  const file = formData?.get("file");
  const message = String(formData?.get("message") ?? "").trim();
  const historyRaw = String(formData?.get("history") ?? "[]");

  const history = JSON.parse(historyRaw) as Array<{
    role: "user" | "assistant";
    content: string;
  }>;

  let transcript = message;

  if (!transcript && file instanceof File) {
    transcript = (await transcribeAudio(file)) ?? "";
  }

  if (!transcript) {
    return NextResponse.json(
      { error: "Please provide audio or a message." },
      { status: 400 },
    );
  }

  const payload = await runConciergeTurn({
    message: transcript,
    history,
  });

  const tts = await synthesizeSpeech(payload.reply);

  return NextResponse.json({
    ...payload,
    transcript,
    audioUrl: tts.audioUrl,
    audioMimeType: tts.audioMimeType,
    audioBase64: tts.audioBase64,
  });
}
