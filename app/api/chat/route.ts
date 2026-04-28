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
		return Response.json(
			{ error: "Please provide a message." },
			{ status: 400 },
		);
	}

	const payload = await runConciergeTurn(parsed.data);
	const encoder = new TextEncoder();
	const stream = new ReadableStream<Uint8Array>({
		async start(controller) {
			const segments = payload.reply
				.replace(/\r\n/g, "\n")
				.split(/(?<=[.!?。！？])\s+|\n+/)
				.map((segment) => segment.trim())
				.filter(Boolean);

			controller.enqueue(
				encoder.encode(
					`data: ${JSON.stringify({ type: "meta", payload: { ...payload, reply: "" } })}\n\n`,
				),
			);

			if (segments.length === 0) {
				controller.enqueue(
					encoder.encode(`data: ${JSON.stringify({ type: "done" })}\n\n`),
				);
				controller.close();
				return;
			}

			for (const segment of segments) {
				controller.enqueue(
					encoder.encode(
						`data: ${JSON.stringify({ type: "line", content: segment })}\n\n`,
					),
				);
				await new Promise((resolve) => setTimeout(resolve, 80));
			}

			controller.enqueue(
				encoder.encode(`data: ${JSON.stringify({ type: "done" })}\n\n`),
			);
			controller.close();
		},
	});

	return new Response(stream, {
		headers: {
			"Content-Type": "text/event-stream; charset=utf-8",
			"Cache-Control": "no-cache, no-transform",
			Connection: "keep-alive",
		},
	});
}
