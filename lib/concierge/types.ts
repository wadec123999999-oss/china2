export type RetrievedContext = {
  source: "supabase" | "static" | "mock" | "none";
  notes: string[];
};

export type BriefPayload = {
  interest: string;
  depthLevel: "curious" | "enthusiast" | "specialist";
  preferredCities: string[];
  days: number;
  budget: string;
  pace: "slow" | "balanced" | "immersive";
  mustHave: string[];
  matchedExpertTags: string[];
  nextAction: "clarify" | "generate_itinerary";
};

export type ItineraryDay = {
  day: number;
  theme: string;
  activities: string[];
};

export type ItineraryPayload = {
  title: string;
  summary: string;
  days: ItineraryDay[];
  matchedExpert: {
    name: string;
    city: string;
  } | null;
};

export type StructuredAnswer = {
  summary: string;
  reasons: string[];
  routeHighlights: string[];
  sourceLabel: string;
};

export type EvidenceCard = {
  title: string;
  type: "expert" | "context" | "signal";
  snippet: string;
  meta: string;
};

export type ChatApiResponse = {
  reply: string;
  answer: StructuredAnswer;
  evidence: EvidenceCard[];
  followUpQuestions: string[];
  contextSource: "supabase" | "static" | "mock" | "none";
  usedModel: boolean;
  brief: BriefPayload;
  recommendedCities: string[];
  recommendedThemes: string[];
  matchedExperts: Array<{
    slug: string;
    name: string;
    city: string;
    headline: string;
    languages: string[];
    reasons: string[];
  }>;
  itinerary: ItineraryPayload;
};

export type VoiceTurnResponse = ChatApiResponse & {
  transcript: string;
  audioUrl: string | null;
  audioMimeType: string | null;
  audioBase64: string | null;
};
