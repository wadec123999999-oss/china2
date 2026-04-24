import { spawn } from "node:child_process";
import path from "node:path";

type ProviderEnv = {
  baseUrl: string | null;
  apiKey: string | null;
  textModel: string | null;
  asrModel: string | null;
  ttsModel: string | null;
  dashscopeApiKey: string | null;
  dashscopeAsrWsUrl: string | null;
};

function readEnv(): ProviderEnv {
  return {
    baseUrl: process.env.LLM_BASE_URL ?? process.env.OPENAI_BASE_URL ?? null,
    apiKey: process.env.LLM_API_KEY ?? process.env.OPENAI_API_KEY ?? null,
    textModel: process.env.LLM_TEXT_MODEL ?? process.env.LLM_MODEL ?? null,
    asrModel: process.env.LLM_ASR_MODEL ?? null,
    ttsModel: process.env.LLM_TTS_MODEL ?? null,
    dashscopeApiKey: process.env.DASHSCOPE_API_KEY ?? null,
    dashscopeAsrWsUrl:
      process.env.DASHSCOPE_ASR_WS_URL ??
      "wss://dashscope.aliyuncs.com/api-ws/v1/inference",
  };
}

export function getVoiceProviderConfig() {
  const env = readEnv();

  return {
    ...env,
    enabled: Boolean(env.baseUrl && env.apiKey),
    asrEnabled: Boolean(env.dashscopeApiKey && env.dashscopeAsrWsUrl),
    ttsEnabled: true,
  };
}

function detectAudioFormat(file: File) {
  const mime = file.type.toLowerCase();
  const name = file.name.toLowerCase();

  if (mime.includes("wav") || name.endsWith(".wav")) return "wav";
  if (mime.includes("mpeg") || mime.includes("mp3") || name.endsWith(".mp3"))
    return "mp3";
  if (
    mime.includes("webm") ||
    mime.includes("opus") ||
    name.endsWith(".webm") ||
    name.endsWith(".opus")
  ) {
    return "opus";
  }

  return "wav";
}

export async function transcribeAudio(file: File): Promise<string | null> {
  const config = getVoiceProviderConfig();
  if (
    !config.asrEnabled ||
    !config.dashscopeApiKey ||
    !config.dashscopeAsrWsUrl
  )
    return null;

  const scriptDir = path.join(process.cwd(), "scripts", "edge-tts-node");
  const scriptPath = path.join(scriptDir, "transcribe.mjs");
  const audioBase64 = Buffer.from(await file.arrayBuffer()).toString("base64");
  const format = detectAudioFormat(file);

  try {
    const result = await new Promise<{
      stdout: string;
      stderr: string;
      code: number | null;
    }>((resolve) => {
      const child = spawn("node", [scriptPath], {
        cwd: scriptDir,
        stdio: ["pipe", "pipe", "pipe"],
      });

      let stdout = "";
      let stderr = "";

      child.stdout.on("data", (chunk: Buffer | string) => {
        stdout += chunk.toString();
      });

      child.stderr.on("data", (chunk: Buffer | string) => {
        stderr += chunk.toString();
      });

      child.on("close", (code) => {
        resolve({ stdout, stderr, code });
      });

      child.stdin.write(
        JSON.stringify({
          audioBase64,
          format,
          sampleRate: 16000,
          url: config.dashscopeAsrWsUrl,
          apiKey: config.dashscopeApiKey,
          model: process.env.DASHSCOPE_ASR_MODEL ?? "fun-asr-realtime",
        }),
      );
      child.stdin.end();
    });

    if (result.code !== 0 || !result.stdout) return null;

    const data = JSON.parse(result.stdout) as { transcript?: string | null };
    return data.transcript ?? null;
  } catch {
    return null;
  }
}

export async function synthesizeSpeech(text: string): Promise<{
  audioBase64: string | null;
  audioMimeType: string | null;
  audioUrl: string | null;
}> {
  const voice = process.env.EDGE_TTS_VOICE ?? "zh-CN-XiaoxiaoNeural";
  const scriptDir = path.join(process.cwd(), "scripts", "edge-tts-node");
  const scriptPath = path.join(scriptDir, "synthesize.mjs");

  try {
    const result = await new Promise<{
      stdout: string;
      stderr: string;
      code: number | null;
    }>((resolve) => {
      const child = spawn("node", [scriptPath], {
        cwd: scriptDir,
        stdio: ["pipe", "pipe", "pipe"],
      });

      let stdout = "";
      let stderr = "";

      child.stdout.on("data", (chunk: Buffer | string) => {
        stdout += chunk.toString();
      });

      child.stderr.on("data", (chunk: Buffer | string) => {
        stderr += chunk.toString();
      });

      child.on("close", (code) => {
        resolve({ stdout, stderr, code });
      });

      child.stdin.write(JSON.stringify({ text, voice }));
      child.stdin.end();
    });

    if (result.code !== 0 || !result.stdout) {
      return {
        audioBase64: null,
        audioMimeType: null,
        audioUrl: null,
      };
    }

    const data = JSON.parse(result.stdout) as {
      audioBase64?: string;
      audioMimeType?: string;
    };

    return {
      audioBase64: data.audioBase64 ?? null,
      audioMimeType: data.audioMimeType ?? "audio/mpeg",
      audioUrl: null,
    };
  } catch {
    return {
      audioBase64: null,
      audioMimeType: null,
      audioUrl: null,
    };
  }
}
