from __future__ import annotations

import base64
import json
import os
import tempfile
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path

import edge_tts

HOST = os.environ.get("EDGE_TTS_HOST", "127.0.0.1")
PORT = int(os.environ.get("EDGE_TTS_PORT", "5051"))
VOICE = os.environ.get("EDGE_TTS_VOICE", "zh-CN-XiaoxiaoNeural")
RATE = os.environ.get("EDGE_TTS_RATE", "+0%")
VOLUME = os.environ.get("EDGE_TTS_VOLUME", "+0%")


class Handler(BaseHTTPRequestHandler):
    def _send_json(self, status: int, payload: dict):
        body = json.dumps(payload).encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(body)))
        self.send_header("Access-Control-Allow-Origin", "*")
        self.end_headers()
        self.wfile.write(body)

    def do_OPTIONS(self):
        self.send_response(204)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path != "/tts":
            self._send_json(404, {"error": "Not found"})
            return

        length = int(self.headers.get("Content-Length", "0"))
        raw = self.rfile.read(length)
        try:
            payload = json.loads(raw.decode("utf-8"))
        except json.JSONDecodeError:
            self._send_json(400, {"error": "Invalid JSON"})
            return

        text = str(payload.get("text", "")).strip()
        if not text:
            self._send_json(400, {"error": "Missing text"})
            return

        voice = str(payload.get("voice") or VOICE)
        rate = str(payload.get("rate") or RATE)
        volume = str(payload.get("volume") or VOLUME)

        try:
            with tempfile.NamedTemporaryFile(suffix=".mp3", delete=False) as tmp:
                tmp_path = Path(tmp.name)

            communicate = edge_tts.Communicate(text=text, voice=voice, rate=rate, volume=volume)
            communicate.save_sync(str(tmp_path))
            audio_base64 = base64.b64encode(tmp_path.read_bytes()).decode("ascii")
            tmp_path.unlink(missing_ok=True)
            self._send_json(
                200,
                {
                    "audioBase64": audio_base64,
                    "audioMimeType": "audio/mpeg",
                    "voice": voice,
                },
            )
        except Exception as exc:  # noqa: BLE001
            self._send_json(500, {"error": str(exc)})


def main():
    server = ThreadingHTTPServer((HOST, PORT), Handler)
    print(f"edge-tts server listening on http://{HOST}:{PORT}")
    server.serve_forever()


if __name__ == "__main__":
    main()
