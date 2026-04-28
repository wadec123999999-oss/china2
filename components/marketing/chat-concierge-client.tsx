"use client";

import { Download, Loader2, Mic, Sparkles } from "lucide-react";
import { useEffect, useMemo, useRef, useState } from "react";

import type {
	ChatApiResponse,
	ItineraryPayload,
	VoiceTurnResponse,
} from "@/lib/concierge/types";

type Message = {
	id: string;
	role: "user" | "assistant";
	content: string;
};

type ChatStreamEvent =
	| { type: "meta"; payload: ChatApiResponse }
	| { type: "line"; content: string }
	| { type: "done" }
	| { type: "error"; error?: string };

type InlineSegment = {
	id: string;
	text: string;
	strong: boolean;
};

function isChatApiResponse(
	value: ChatApiResponse | { error?: string },
): value is ChatApiResponse {
	return (
		"reply" in value &&
		"answer" in value &&
		"evidence" in value &&
		"followUpQuestions" in value &&
		"contextSource" in value &&
		"usedModel" in value &&
		"brief" in value &&
		"recommendedCities" in value &&
		"recommendedThemes" in value &&
		"matchedExperts" in value &&
		"itinerary" in value
	);
}

function isVoiceTurnResponse(
	value: VoiceTurnResponse | { error?: string },
): value is VoiceTurnResponse {
	return isChatApiResponse(value) && "transcript" in value;
}

function createMessage(role: Message["role"], content: string): Message {
	if (typeof crypto !== "undefined" && "randomUUID" in crypto) {
		return { id: crypto.randomUUID(), role, content };
	}

	return {
		id: `${role}-${Date.now()}-${Math.random().toString(36).slice(2)}`,
		role,
		content,
	};
}

const starterQuestions = [
	"Plan a calm first trip to China with tea, food, and culture.",
	"Design a 5-day ceramics journey centered on Jingdezhen.",
	"Build a slower luxury route for history, temples, and design.",
] as const;

function formatRouteBrief(
	itinerary: ItineraryPayload,
	answerSummary: string,
	messages: Message[],
) {
	const travelerMessages = messages
		.filter((message) => message.role === "user")
		.map((message, index) => `${index + 1}. ${message.content}`)
		.join("\n");

	const aiMessages = messages
		.filter((message) => message.role === "assistant")
		.map((message, index) => `${index + 1}. ${message.content}`)
		.join("\n\n");

	const days = itinerary.days
		.map((day) => {
			const activities = day.activities
				.map((activity) => `- ${activity}`)
				.join("\n");
			return `Day ${day.day}: ${day.theme}\n${activities}`;
		})
		.join("\n\n");

	return `${itinerary.title}\n\nTravel brief summary\n${answerSummary}\n\nTraveler requests\n${travelerMessages || "No traveler messages yet."}\n\nAI consultation summary\n${aiMessages || "No AI summary yet."}\n\nTravel plan\n${itinerary.summary}\n\nDetailed itinerary\n${days}`;
}

function downloadRouteBrief(result: ChatApiResponse, messages: Message[]) {
	const content = formatRouteBrief(
		result.itinerary,
		result.answer.summary,
		messages,
	);
	const blob = new Blob([content], { type: "text/plain;charset=utf-8" });
	const url = URL.createObjectURL(blob);
	const link = document.createElement("a");
	const safeTitle =
		result.itinerary.title
			.toLowerCase()
			.replace(/[^a-z0-9]+/g, "-")
			.replace(/^-+|-+$/g, "") || "route-brief";

	link.href = url;
	link.download = `${safeTitle}.txt`;
	document.body.appendChild(link);
	link.click();
	link.remove();
	URL.revokeObjectURL(url);
}

function renderInlineSegments(content: string) {
	const parts = content.split(/(\*\*[^*]+\*\*)/g).filter(Boolean);

	return parts.map((part, index) => {
		const isStrong =
			part.startsWith("**") && part.endsWith("**") && part.length > 4;

		const segment: InlineSegment = {
			id: `${isStrong ? "strong" : "text"}-${part}-${index}-${content.length}`,
			text: isStrong ? part.slice(2, -2) : part,
			strong: isStrong,
		};

		if (segment.strong) {
			return <strong key={segment.id}>{segment.text}</strong>;
		}

		return <span key={segment.id}>{segment.text}</span>;
	});
}

type MessageBlock =
	| { type: "heading"; level: 1 | 2; content: string }
	| { type: "line"; content: string }
	| { type: "unordered-list"; items: { id: string; content: string }[] }
	| { type: "ordered-list"; items: { id: string; content: string }[] };

function parseAssistantBlocks(content: string): MessageBlock[] {
	const lines = content.replace(/\r\n/g, "\n").split("\n");
	const blocks: MessageBlock[] = [];

	for (let index = 0; index < lines.length; index += 1) {
		const rawLine = lines[index] ?? "";
		const line = rawLine.trim();

		if (!line) {
			continue;
		}

		if (line.startsWith("## ")) {
			blocks.push({ type: "heading", level: 2, content: line.slice(3).trim() });
			continue;
		}

		if (line.startsWith("# ")) {
			blocks.push({ type: "heading", level: 1, content: line.slice(2).trim() });
			continue;
		}

		if (/^[-*]\s+/.test(line)) {
			const items: { id: string; content: string }[] = [];

			while (index < lines.length) {
				const current = lines[index]?.trim() ?? "";
				if (!/^[-*]\s+/.test(current)) break;
				const itemContent = current.replace(/^[-*]\s+/, "").trim();
				items.push({
					id: `ul-${index}-${itemContent.length}`,
					content: itemContent,
				});
				index += 1;
			}

			index -= 1;
			blocks.push({ type: "unordered-list", items });
			continue;
		}

		if (/^\d+\.\s+/.test(line)) {
			const items: { id: string; content: string }[] = [];

			while (index < lines.length) {
				const current = lines[index]?.trim() ?? "";
				if (!/^\d+\.\s+/.test(current)) break;
				const itemContent = current.replace(/^\d+\.\s+/, "").trim();
				items.push({
					id: `ol-${index}-${itemContent.length}`,
					content: itemContent,
				});
				index += 1;
			}

			index -= 1;
			blocks.push({ type: "ordered-list", items });
			continue;
		}

		blocks.push({ type: "line", content: line });
	}

	return blocks;
}

function AssistantMessage({ content }: { content: string }) {
	const blocks = parseAssistantBlocks(content);

	return (
		<div className="space-y-4 text-[15px] leading-7 text-[#1d1d1f]">
			{blocks.map((block, index) => {
				const key = `${block.type}-${index}`;

				if (block.type === "heading") {
					if (block.level === 1) {
						return (
							<h3
								key={key}
								className="text-[1.05rem] font-semibold tracking-[-0.02em] text-[#161616]"
							>
								{renderInlineSegments(block.content)}
							</h3>
						);
					}

					return (
						<h4
							key={key}
							className="text-[0.98rem] font-semibold tracking-[-0.01em] text-[#2a2724]"
						>
							{renderInlineSegments(block.content)}
						</h4>
					);
				}

				if (block.type === "unordered-list") {
					return (
						<ul
							key={key}
							className="list-disc space-y-2 pl-5 text-[#2f2b27] marker:text-[#8a847d]"
						>
							{block.items.map((item) => (
								<li key={item.id}>{renderInlineSegments(item.content)}</li>
							))}
						</ul>
					);
				}

				if (block.type === "ordered-list") {
					return (
						<ol
							key={key}
							className="list-decimal space-y-2 pl-5 text-[#2f2b27] marker:text-[#8a847d]"
						>
							{block.items.map((item) => (
								<li key={item.id}>{renderInlineSegments(item.content)}</li>
							))}
						</ol>
					);
				}

				if (block.type === "line") {
					return (
						<p key={key} className="text-[#2f2b27]">
							{renderInlineSegments(block.content)}
						</p>
					);
				}

				return null;
			})}
		</div>
	);
}

export function ChatConciergeClient({
	initialQuery = "",
}: {
	initialQuery?: string;
}) {
	const [input, setInput] = useState(initialQuery);
	const [messages, setMessages] = useState<Message[]>(
		initialQuery ? [createMessage("user", initialQuery)] : [],
	);
	const [loading, setLoading] = useState(false);
	const [voiceState, setVoiceState] = useState<
		"idle" | "listening" | "thinking" | "done"
	>("idle");
	const [result, setResult] = useState<ChatApiResponse | null>(null);
	const [error, setError] = useState<string | null>(null);
	const [isRecording, setIsRecording] = useState(false);
	const conversationScrollRef = useRef<HTMLDivElement | null>(null);
	const recorderRef = useRef<MediaRecorder | null>(null);
	const hasMessages = messages.length > 0;

	const voiceLabel = useMemo(() => {
		switch (voiceState) {
			case "listening":
				return "Listening";
			case "thinking":
				return "Thinking";
			case "done":
				return "Voice ready";
			default:
				return "Speak";
		}
	}, [voiceState]);

	async function submitTextTurn(message: string, history: Message[]) {
		const response = await fetch("/api/chat", {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify({
				message,
				history,
			}),
		});

		if (!response.ok) {
			const data = ((await response.json().catch(() => null)) ?? {}) as {
				error?: string;
			};
			throw new Error(data.error || "Something went wrong.");
		}

		if (!response.body) {
			throw new Error("Streaming is unavailable right now.");
		}

		return response.body.getReader();
	}

	async function submitVoiceTurn(
		file: Blob,
		history: Message[],
		message: string,
	) {
		const formData = new FormData();
		formData.append("file", file, "voice.webm");
		formData.append("message", message.trim());
		formData.append("history", JSON.stringify(history));

		const response = await fetch("/api/voice/turn", {
			method: "POST",
			body: formData,
		});

		const data = (await response.json()) as
			| VoiceTurnResponse
			| { error?: string };

		if (!response.ok || "error" in data) {
			throw new Error(
				("error" in data && data.error) || "Something went wrong.",
			);
		}

		if (!isVoiceTurnResponse(data)) {
			throw new Error("Something went wrong.");
		}

		return data;
	}

	async function submitMessage(message: string) {
		const trimmed = message.trim();
		if (!trimmed) return;

		const userMessage = createMessage("user", trimmed);
		const assistantMessage = createMessage("assistant", "");
		const nextMessages = [...messages, userMessage];
		setMessages([...nextMessages, assistantMessage]);
		setLoading(true);
		setError(null);
		setVoiceState((current) =>
			current === "listening" ? "thinking" : current,
		);

		try {
			const reader = await submitTextTurn(trimmed, nextMessages);
			const decoder = new TextDecoder();
			let buffer = "";
			let streamedReply = "";
			let payloadMeta: ChatApiResponse | null = null;

			while (true) {
				const { done, value } = await reader.read();
				if (done) break;

				buffer += decoder.decode(value, { stream: true });
				const events = buffer.split("\n\n");
				buffer = events.pop() ?? "";

				for (const event of events) {
					const line = event
						.split("\n")
						.find((entry) => entry.startsWith("data: "));

					if (!line) continue;

					const parsed = JSON.parse(line.slice(6)) as ChatStreamEvent;

					if (parsed.type === "meta") {
						payloadMeta = parsed.payload;
						continue;
					}

					if (parsed.type === "line") {
						streamedReply = streamedReply
							? `${streamedReply}\n${parsed.content}`
							: parsed.content;
						setMessages((current) =>
							current.map((entry) =>
								entry.id === assistantMessage.id
									? { ...entry, content: streamedReply }
									: entry,
							),
						);
						continue;
					}

					if (parsed.type === "error") {
						throw new Error(parsed.error || "Something went wrong.");
					}
				}
			}

			if (!payloadMeta || !isChatApiResponse(payloadMeta)) {
				throw new Error("Something went wrong.");
			}

			setResult({ ...payloadMeta, reply: streamedReply });
			setMessages((current) =>
				current.map((entry) =>
					entry.id === assistantMessage.id
						? { ...entry, content: streamedReply }
						: entry,
				),
			);
			setVoiceState((current) =>
				current === "thinking" || current === "listening" ? "done" : current,
			);
			setInput("");
		} catch (caught) {
			setMessages((current) =>
				current.filter((entry) => entry.id !== assistantMessage.id),
			);
			setError(
				caught instanceof Error
					? caught.message
					: "Unable to reach the concierge right now.",
			);
			setVoiceState("idle");
		} finally {
			setLoading(false);
		}
	}

	async function onSubmit(event: React.FormEvent<HTMLFormElement>) {
		event.preventDefault();
		await submitMessage(input);
	}

	async function onVoiceClick() {
		if (loading) return;

		if (isRecording) {
			recorderRef.current?.stop();
			setIsRecording(false);
			setVoiceState("thinking");
			return;
		}

		try {
			const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
			const recorder = new MediaRecorder(stream);
			recorderRef.current = recorder;
			const chunks: BlobPart[] = [];

			recorder.ondataavailable = (event) => {
				if (event.data.size > 0) chunks.push(event.data);
			};

			recorder.onstop = async () => {
				stream.getTracks().forEach((track) => {
					track.stop();
				});

				setLoading(true);
				setError(null);
				setVoiceState("thinking");

				try {
					const blob = new Blob(chunks, {
						type: recorder.mimeType || "audio/webm",
					});
					const payload = await submitVoiceTurn(blob, messages, input);

					setMessages((current) => [
						...current,
						createMessage("user", payload.transcript),
						createMessage("assistant", payload.reply),
					]);
					setResult(payload);
					setInput("");
					setVoiceState("done");

					if (payload.audioBase64 && payload.audioMimeType) {
						const audio = new Audio(
							`data:${payload.audioMimeType};base64,${payload.audioBase64}`,
						);
						void audio.play().catch(() => {});
					} else if (payload.audioUrl) {
						const audio = new Audio(payload.audioUrl);
						void audio.play().catch(() => {});
					}
				} catch (caught) {
					setError(
						caught instanceof Error
							? caught.message
							: "Unable to reach the concierge right now.",
					);
					setVoiceState("idle");
				} finally {
					setLoading(false);
				}
			};

			recorder.start();
			setIsRecording(true);
			setVoiceState("listening");
			window.setTimeout(() => {
				if (recorder.state !== "inactive") recorder.stop();
			}, 10000);
		} catch {
			setError("Microphone access was denied.");
			setVoiceState("idle");
			setIsRecording(false);
		}
	}

	useEffect(() => {
		if (!conversationScrollRef.current) return;
		conversationScrollRef.current.scrollTop =
			conversationScrollRef.current.scrollHeight;
	});

	return (
		<main className="relative min-h-[calc(100vh-76px)] overflow-hidden bg-[#ece7df] px-4 py-6 text-[#151515] sm:px-6 sm:py-8">
			<div className="pointer-events-none absolute inset-0">
				<div className="absolute left-1/2 top-[-14rem] h-[28rem] w-[28rem] -translate-x-1/2 rounded-full bg-[radial-gradient(circle,_rgba(255,255,255,0.92)_0%,_rgba(255,255,255,0)_72%)]" />
				<div className="absolute inset-x-0 top-0 h-64 bg-[linear-gradient(180deg,rgba(255,255,255,0.62),rgba(255,255,255,0))]" />
				<div className="absolute bottom-[-12rem] left-[-8rem] h-[22rem] w-[22rem] rounded-full bg-[radial-gradient(circle,_rgba(208,214,223,0.26)_0%,_rgba(208,214,223,0)_72%)]" />
			</div>

			<div className="relative mx-auto flex max-w-5xl flex-col gap-6">
				<section className="px-1 text-center sm:px-4">
					<div className="inline-flex items-center gap-2 rounded-full border border-white/70 bg-white/65 px-3 py-1.5 text-[11px] tracking-[0.24em] text-[#6f6a63] shadow-[0_10px_30px_-18px_rgba(0,0,0,0.28)] backdrop-blur-xl">
						<Sparkles className="size-3.5" />a Deeper China
					</div>
					<p className="mt-5 text-[11px] uppercase tracking-[0.28em] text-[#8a7467] sm:text-xs">
						China, Closely: See the unseen.
					</p>
					<h1 className="mt-4 text-4xl font-semibold tracking-[-0.05em] text-[#1b1b1d] sm:text-6xl">
						Begin with a conversation, then move toward a more meaningful China.
					</h1>
					<p className="mx-auto mt-4 max-w-3xl text-sm leading-7 text-[#5f5a54] sm:text-base">
						Use voice or text to shape a first route, clarify cultural focus,
						and decide whether the next step should be a refined itinerary or
						deeper local support.
					</p>
				</section>

				<section className="rounded-[2.25rem] border border-white/55 bg-[linear-gradient(180deg,rgba(255,255,255,0.72),rgba(248,245,240,0.56))] p-4 shadow-[0_28px_90px_-44px_rgba(27,29,33,0.36)] backdrop-blur-2xl sm:p-6">
					<div className="flex flex-col gap-4">
						<div className="flex items-center justify-between px-1 text-[11px] uppercase tracking-[0.2em] text-[#7a736c]">
							<span>Conversation</span>
							<span>{hasMessages ? `${messages.length} turns` : "Ready"}</span>
						</div>

						<div
							ref={conversationScrollRef}
							className="max-h-[56vh] min-h-[360px] space-y-3 overflow-y-auto rounded-[1.8rem] border border-white/55 bg-[linear-gradient(180deg,rgba(255,255,255,0.72),rgba(244,240,235,0.92))] p-4 shadow-[inset_0_1px_0_rgba(255,255,255,0.45)] sm:p-6"
						>
							{messages.length === 0 ? (
								<div className="flex h-full flex-col items-center justify-center text-center">
									<p className="max-w-lg text-base font-medium text-[#1d1d1f] sm:text-lg">
										Start with a destination, a mood, or the kind of trip you
										want this first version to become.
									</p>
									<div className="mt-8 flex flex-wrap justify-center gap-2.5">
										{starterQuestions.map((question) => (
											<button
												key={question}
												type="button"
												onClick={() => setInput(question)}
												className="rounded-full border border-white/70 bg-white/72 px-4 py-2 text-sm text-[#49453f] shadow-[0_12px_24px_-18px_rgba(0,0,0,0.3)] transition hover:border-white hover:bg-white"
											>
												{question}
											</button>
										))}
									</div>
								</div>
							) : (
								messages.map((message) => (
									<div
										key={message.id}
										className={`flex ${message.role === "assistant" ? "justify-start" : "justify-end"}`}
									>
										<div
											className={`max-w-[85%] rounded-[1.6rem] px-4 py-3 text-[15px] leading-7 shadow-[0_16px_40px_-28px_rgba(0,0,0,0.34)] sm:max-w-[78%] ${
												message.role === "assistant"
													? "border border-white/65 bg-[rgba(255,255,255,0.82)] text-[#1d1d1f]"
													: "bg-[linear-gradient(180deg,#242426,#161618)] text-white"
											}`}
										>
											{message.role === "assistant" ? (
												<AssistantMessage content={message.content} />
											) : (
												message.content
											)}
										</div>
									</div>
								))
							)}

							{loading ? (
								<div className="flex justify-start">
									<div className="inline-flex items-center gap-2 rounded-[1.5rem] border border-white/65 bg-[rgba(255,255,255,0.82)] px-4 py-3 text-sm text-[#5f5a54] shadow-[0_16px_40px_-28px_rgba(0,0,0,0.24)]">
										<Loader2 className="size-4 animate-spin" />
										{voiceState === "thinking" ? "Thinking…" : "Working…"}
									</div>
								</div>
							) : null}
						</div>

						{error ? (
							<div className="rounded-[1.35rem] border border-[#efc5c3] bg-[rgba(255,244,243,0.92)] px-4 py-3 text-sm text-[#b42318] shadow-[0_12px_32px_-24px_rgba(180,35,24,0.4)]">
								{error}
							</div>
						) : null}

						<form
							onSubmit={onSubmit}
							className="rounded-[1.9rem] border border-white/65 bg-[rgba(255,255,255,0.7)] p-3 shadow-[0_24px_60px_-36px_rgba(0,0,0,0.3)] backdrop-blur-xl sm:p-4"
						>
							<div className="flex flex-col gap-3">
								<div className="rounded-[1.45rem] border border-white/55 bg-[rgba(242,238,233,0.9)] px-4 py-3.5">
									<textarea
										id="concierge-input"
										name="q"
										value={input}
										onChange={(event) => setInput(event.target.value)}
										onKeyDown={(event) => {
											if (event.key === "Enter" && !event.shiftKey) {
												event.preventDefault();
												if (!loading && input.trim().length > 0) {
													void submitMessage(input);
												}
											}
										}}
										placeholder="Ask about pace, culture, food, craft, route shape, or the kind of trip you want."
										className="min-h-[88px] w-full resize-none bg-transparent text-[15px] leading-7 text-[#1d1d1f] outline-none placeholder:text-[#8a847d]"
									/>
								</div>

								<div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
									<div className="text-xs text-[#7e776f]">
										{voiceState === "listening"
											? "Recording now. Tap again to finish."
											: "Single-turn voice now. Realtime can be added later."}
									</div>

									<div className="flex items-center gap-2 self-end sm:self-auto">
										<button
											type="button"
											onClick={onVoiceClick}
											className={`inline-flex h-11 items-center justify-center gap-2 rounded-full px-4 text-sm font-medium transition ${
												isRecording
													? "bg-[#1d1d1f] text-white shadow-[0_18px_40px_-24px_rgba(0,0,0,0.55)]"
													: "border border-white/70 bg-white/78 text-[#1d1d1f] shadow-[0_14px_30px_-22px_rgba(0,0,0,0.28)] hover:bg-white"
											}`}
										>
											<Mic className="size-4" />
											{voiceLabel}
										</button>
										<button
											type="submit"
											disabled={loading || input.trim().length === 0}
											className="inline-flex h-11 items-center justify-center rounded-full bg-[linear-gradient(180deg,#1677e6,#0b63c9)] px-5 text-sm font-medium text-white shadow-[0_18px_40px_-24px_rgba(0,113,227,0.6)] transition hover:brightness-105 disabled:cursor-not-allowed disabled:opacity-50"
										>
											{loading ? (
												<span className="inline-flex items-center gap-2">
													<Loader2 className="size-4 animate-spin" />
													Working
												</span>
											) : (
												"Send"
											)}
										</button>
									</div>
								</div>
							</div>
						</form>

						{result ? (
							<div className="rounded-[1.8rem] border border-white/65 bg-[rgba(255,255,255,0.68)] p-4 shadow-[0_24px_60px_-40px_rgba(0,0,0,0.28)] backdrop-blur-xl sm:p-5">
								<div className="flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">
									<div className="max-w-2xl">
										<p className="text-[11px] uppercase tracking-[0.18em] text-[#8a847d]">
											Route brief
										</p>
										<h2 className="mt-2 text-2xl font-semibold tracking-[-0.03em] text-[#1d1d1f]">
											{result.itinerary.title}
										</h2>
										<p className="mt-3 text-sm leading-7 text-[#4e4943] sm:text-[15px]">
											Download the conversation summary and the current travel
											plan as a route brief.
										</p>
									</div>

									<button
										type="button"
										onClick={() => downloadRouteBrief(result, messages)}
										className="inline-flex h-11 items-center justify-center gap-2 rounded-full border border-white/70 bg-white/82 px-4 text-sm font-medium text-[#1d1d1f] shadow-[0_14px_30px_-22px_rgba(0,0,0,0.28)] transition hover:bg-white"
									>
										<Download className="size-4" />
										Download route brief
									</button>
								</div>
							</div>
						) : null}
					</div>
				</section>
			</div>
		</main>
	);
}
