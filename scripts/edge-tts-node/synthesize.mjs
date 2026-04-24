import { Buffer } from "node:buffer";
import { MsEdgeTTS, OUTPUT_FORMAT } from "msedge-tts";

const chunks = [];
for await (const chunk of process.stdin) {
  chunks.push(chunk);
}

const raw = Buffer.concat(chunks).toString("utf8");
const payload = JSON.parse(raw || "{}");
const text = String(payload.text || "").trim();
const voice = String(payload.voice || "zh-CN-XiaoxiaoNeural");

if (!text) {
  process.stdout.write(JSON.stringify({ error: "Missing text" }));
  process.exit(1);
}

const tts = new MsEdgeTTS();
await tts.setMetadata(voice, OUTPUT_FORMAT.AUDIO_24KHZ_48KBITRATE_MONO_MP3);
const { audioStream } = await tts.toStream(text);

const audioChunks = [];

await new Promise((resolve, reject) => {
  audioStream.on("data", (chunk) => {
    audioChunks.push(Buffer.from(chunk));
  });

  audioStream.on("error", (error) => {
    reject(error);
  });

  audioStream.on("end", () => {
    resolve(null);
  });
});

const audioBuffer = Buffer.concat(audioChunks);
process.stdout.write(
  JSON.stringify({
    audioBase64: audioBuffer.toString("base64"),
    audioMimeType: "audio/mpeg",
    voice,
  }),
);
