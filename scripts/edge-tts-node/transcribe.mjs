import { randomUUID } from "node:crypto";
import WebSocket from "ws";

const chunks = [];
for await (const chunk of process.stdin) {
  chunks.push(chunk);
}

const payload = JSON.parse(Buffer.concat(chunks).toString("utf8") || "{}");
const audioBase64 = String(payload.audioBase64 || "");
const format = String(payload.format || "wav");
const sampleRate = Number(payload.sampleRate || 16000);
const url = String(
  payload.url || "wss://dashscope.aliyuncs.com/api-ws/v1/inference",
);
const apiKey = String(payload.apiKey || "");
const model = String(payload.model || "fun-asr-realtime");

if (!audioBase64 || !apiKey) {
  process.stdout.write(JSON.stringify({ transcript: null }));
  process.exit(0);
}

const taskId = randomUUID().replace(/-/g, "").slice(0, 32);
const audioBuffer = Buffer.from(audioBase64, "base64");

const ws = new WebSocket(url, {
  headers: {
    Authorization: `bearer ${apiKey}`,
  },
});

let transcript = "";
let finished = false;

const done = (value) => {
  if (finished) return;
  finished = true;
  try {
    ws.close();
  } catch {}
  process.stdout.write(JSON.stringify({ transcript: value || null }));
  process.exit(0);
};

ws.on("open", () => {
  ws.send(
    JSON.stringify({
      header: {
        action: "run-task",
        task_id: taskId,
        streaming: "duplex",
      },
      payload: {
        task_group: "audio",
        task: "asr",
        function: "recognition",
        model,
        parameters: {
          format,
          sample_rate: sampleRate,
          semantic_punctuation_enabled: false,
        },
        input: {},
      },
    }),
  );
});

ws.on("message", (raw) => {
  const message = JSON.parse(raw.toString());
  const eventName = message?.header?.event;

  if (eventName === "task-started") {
    ws.send(audioBuffer);
    ws.send(
      JSON.stringify({
        header: {
          action: "finish-task",
          task_id: taskId,
          streaming: "duplex",
        },
        payload: {
          input: {},
        },
      }),
    );
    return;
  }

  if (eventName === "result-generated") {
    const sentence = message?.payload?.output?.sentence;
    if (!sentence?.heartbeat && sentence?.text) {
      transcript = sentence.text;
    }
    return;
  }

  if (eventName === "task-finished") {
    done(transcript);
    return;
  }

  if (eventName === "task-failed") {
    done(transcript);
  }
});

ws.on("error", () => done(transcript));
ws.on("close", () => done(transcript));
