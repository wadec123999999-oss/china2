import { ChatConciergeClient } from "@/components/marketing/chat-concierge-client";

function pickFirst(value: string | string[] | undefined) {
  return Array.isArray(value) ? value[0] : value;
}

export default function ChatPage({
  searchParams,
}: {
  searchParams?: Record<string, string | string[] | undefined>;
}) {
  const query = pickFirst(searchParams?.q) ?? "";

  return <ChatConciergeClient initialQuery={query} />;
}
