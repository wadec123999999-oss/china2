import { formatCity } from "@/lib/format";
import { generateChatReply } from "@/lib/llm/provider";
import { matchExperts } from "@/lib/matching/match-experts";
import { mockExperts, type TravelBrief } from "@/lib/mock-data";
import { createSupabaseAdminClient } from "@/lib/supabase/admin";
import { getServerSupabaseEnv } from "@/lib/supabase/env";

import type {
  BriefPayload,
  ChatApiResponse,
  EvidenceCard,
  RetrievedContext,
  StructuredAnswer,
} from "./types";

function inferInterest(message: string): BriefPayload["interest"] {
  const lowered = message.toLowerCase();
  if (
    lowered.includes("porcelain") ||
    lowered.includes("ceramic") ||
    lowered.includes("kiln")
  )
    return "Porcelain";
  if (lowered.includes("tea") || lowered.includes("mountain")) return "Tea";
  if (
    lowered.includes("food") ||
    lowered.includes("hotpot") ||
    lowered.includes("sichuan")
  )
    return "Food";
  if (
    lowered.includes("history") ||
    lowered.includes("temple") ||
    lowered.includes("heritage")
  )
    return "History";
  if (
    lowered.includes("martial") ||
    lowered.includes("kung fu") ||
    lowered.includes("tao") ||
    lowered.includes("taoism")
  )
    return "Martial Arts & Taoism";
  return "Cultural Discovery";
}

function inferPreferredCities(message: string): TravelBrief["city"][] {
  const lowered = message.toLowerCase();
  const cities: TravelBrief["city"][] = [];
  if (lowered.includes("beijing")) cities.push("beijing");
  if (lowered.includes("chengdu")) cities.push("chengdu");
  if (lowered.includes("chongqing")) cities.push("chongqing");
  if (lowered.includes("jingdezhen") || lowered.includes("porcelain"))
    cities.push("jingdezhen");
  if (lowered.includes("quanzhou")) cities.push("quanzhou");
  if (lowered.includes("jingmai") || lowered.includes("tea mountain"))
    cities.push("jingmai_mountain");
  if (
    lowered.includes("wudang") ||
    lowered.includes("tao") ||
    lowered.includes("kung fu")
  )
    cities.push("wudang_mountain");
  return Array.from(new Set(cities));
}

function inferCategory(message: string): TravelBrief["category"] {
  const lowered = message.toLowerCase();
  if (
    lowered.includes("porcelain") ||
    lowered.includes("ceramic") ||
    lowered.includes("kiln")
  )
    return "porcelain";
  if (lowered.includes("tea")) return "tea";
  if (
    lowered.includes("food") ||
    lowered.includes("hotpot") ||
    lowered.includes("sichuan")
  )
    return "sichuan_food";
  if (lowered.includes("martial") || lowered.includes("kung fu"))
    return "kung_fu";
  if (lowered.includes("calligraphy")) return "calligraphy";
  if (lowered.includes("tcm") || lowered.includes("medicine")) return "tcm";
  if (lowered.includes("photo")) return "photography";
  if (
    lowered.includes("maritime") ||
    lowered.includes("port") ||
    lowered.includes("trade route")
  )
    return "maritime_silk_road";
  return undefined;
}

function inferPace(message: string): TravelBrief["pace"] {
  const lowered = message.toLowerCase();
  if (
    lowered.includes("slow") ||
    lowered.includes("quiet") ||
    lowered.includes("calm")
  )
    return "slow";
  if (
    lowered.includes("immersive") ||
    lowered.includes("deep dive") ||
    lowered.includes("intense")
  )
    return "immersive";
  return "balanced";
}

function inferDays(message: string): number {
  const match = message.match(/(\d+)\s*day/i);
  if (match) return Math.min(Math.max(Number(match[1]), 1), 14);
  return 3;
}

function inferBudget(message: string): string {
  const lowered = message.toLowerCase();
  if (lowered.includes("luxury") || lowered.includes("premium"))
    return "4000+ USD";
  if (lowered.includes("budget") || lowered.includes("affordable"))
    return "1000-2000 USD";
  return "2000-4000 USD";
}

function inferDepthLevel(message: string): BriefPayload["depthLevel"] {
  const lowered = message.toLowerCase();
  if (
    lowered.includes("scholar") ||
    lowered.includes("serious") ||
    lowered.includes("specialist")
  )
    return "specialist";
  if (
    lowered.includes("deep") ||
    lowered.includes("enthusiast") ||
    lowered.includes("immersive")
  )
    return "enthusiast";
  return "curious";
}

function inferMustHaves(message: string, interest: string): string[] {
  const lowered = message.toLowerCase();
  const items = new Set<string>();
  if (lowered.includes("museum")) items.add("museum");
  if (lowered.includes("workshop")) items.add("workshop");
  if (lowered.includes("kiln")) items.add("kiln visit");
  if (lowered.includes("tea")) items.add("tea tasting");
  if (lowered.includes("food")) items.add("local food experience");
  if (lowered.includes("temple")) items.add("temple visit");
  if (lowered.includes("market")) items.add("market walk");
  if (lowered.includes("history")) items.add("historical context");

  if (items.size === 0) {
    if (interest === "Porcelain") {
      items.add("kiln visit");
      items.add("workshop");
      items.add("museum");
    } else if (interest === "Tea") {
      items.add("tea tasting");
      items.add("mountain landscape");
      items.add("slow village time");
    } else if (interest === "Food") {
      items.add("local food experience");
      items.add("market walk");
      items.add("neighborhood context");
    } else {
      items.add("local guide");
      items.add("cultural context");
      items.add("slower pacing");
    }
  }

  return Array.from(items).slice(0, 4);
}

type TurnHistory = Array<{ role: "user" | "assistant"; content: string }>;

function getCityFocusPoints(city: string) {
  switch (city) {
    case "Beijing":
      return [
        "imperial culture",
        "the Great Wall and the Forbidden City",
        "hutong life",
      ];
    case "Jingdezhen":
      return ["porcelain heritage", "kilns and making", "studio culture"];
    case "Quanzhou":
      return [
        "the great Song-Yuan port",
        "maritime trade history",
        "religious and cultural plurality",
      ];
    case "Chongqing":
      return [
        "cyberpunk topography",
        "layered river-city drama",
        "hotpot and bold street food",
      ];
    case "Chengdu":
      return [
        "comfortable everyday living",
        "tea-house rhythm and food",
        "pandas",
      ];
    case "Wudang Mountain":
      return [
        "mountain scenery",
        "Taoist culture",
        "taiji and embodied practice",
      ];
    case "Jingmai Mountain":
      return ["tea mountains", "terraced landscape", "long tea-making memory"];
    default:
      return ["cultural depth", "local texture", "a clear sense of place"];
  }
}

function buildCityFocusGuidance(preferredCities: string[]) {
  return preferredCities
    .slice(0, 2)
    .map((city) => `${city}: ${getCityFocusPoints(city).join("; ")}`)
    .join(" | ");
}

function buildFocusedOpening(brief: BriefPayload) {
  const mainCity = brief.preferredCities[0] ?? "Beijing";
  const focusPoints = getCityFocusPoints(mainCity);

  return `If you want to understand ${mainCity}, start with ${focusPoints[0]}, then ${focusPoints[1]}, and then ${focusPoints[2]}. That gives the trip a clear center instead of turning it into a generic checklist.`;
}

function buildHistorySummary(history: TurnHistory) {
  return history
    .slice(-6)
    .map(
      (entry) =>
        `${entry.role === "user" ? "Traveler" : "Assistant"}: ${entry.content}`,
    )
    .join("\n");
}

async function retrieveContext(
  message: string,
  history: TurnHistory,
): Promise<RetrievedContext> {
  const lowered = `${buildHistorySummary(history)} ${message}`.toLowerCase();
  const env = getServerSupabaseEnv();

  if (env.success) {
    try {
      const supabase = createSupabaseAdminClient();
      const { data, error } = await supabase
        .from("experts")
        .select("name, city, headline")
        .limit(5);
      if (!error && data && data.length > 0) {
        return {
          source: "supabase",
          notes: data.map(
            (expert) => `${expert.name} — ${expert.city}: ${expert.headline}`,
          ),
        };
      }
    } catch {
      // noop
    }
  }

  const matchedExperts = mockExperts.filter((expert) => {
    const haystack = [
      expert.name,
      expert.city,
      expert.headline,
      expert.bio,
      ...expert.tags,
      ...expert.categories,
    ]
      .join(" ")
      .toLowerCase();
    return lowered
      .split(/\s+/)
      .filter(Boolean)
      .some((token) => haystack.includes(token));
  });

  if (matchedExperts.length > 0) {
    return {
      source: "mock",
      notes: matchedExperts
        .slice(0, 5)
        .map((expert) => `${expert.name} — ${expert.city}: ${expert.headline}`),
    };
  }

  return { source: "none", notes: [] };
}

function buildBrief(message: string): BriefPayload {
  const interest = inferInterest(message);
  const preferredCityValues = inferPreferredCities(message);
  const days = inferDays(message);
  const pace = inferPace(message);

  return {
    interest,
    depthLevel: inferDepthLevel(message),
    preferredCities:
      preferredCityValues.length > 0
        ? preferredCityValues
            .filter(
              (
                city,
              ): city is NonNullable<(typeof preferredCityValues)[number]> =>
                Boolean(city),
            )
            .map((city) => formatCity(city))
        : interest === "Porcelain"
          ? ["Jingdezhen"]
          : interest === "Tea"
            ? ["Jingmai Mountain", "Chengdu"]
            : interest === "Food"
              ? ["Chengdu", "Chongqing"]
              : ["Beijing", "Quanzhou"],
    days,
    budget: inferBudget(message),
    pace,
    mustHave: inferMustHaves(message, interest),
    matchedExpertTags:
      interest === "Porcelain"
        ? ["ceramics", "kiln", "museum"]
        : interest === "Tea"
          ? ["tea", "landscape", "local ritual"]
          : interest === "Food"
            ? ["food culture", "market", "neighborhood"]
            : ["culture", "history", "guide"],
    nextAction: "generate_itinerary",
  };
}

function buildTravelBrief(message: string): TravelBrief {
  const preferredCities = inferPreferredCities(message);
  return {
    city: preferredCities[0],
    category: inferCategory(message),
    interests: message,
    pace: inferPace(message),
  };
}

function buildThemes(brief: BriefPayload): string[] {
  if (brief.interest === "Porcelain")
    return ["Porcelain history", "Studio visits", "Hands-on workshop"];
  if (brief.interest === "Tea")
    return ["Tea landscapes", "Tasting ritual", "Mountain stay"];
  if (brief.interest === "Food")
    return ["Neighborhood food", "Markets", "Regional classics"];
  if (brief.interest === "Martial Arts & Taoism")
    return ["Taoist thought", "Temple rhythm", "Embodied practice"];
  return ["Cultural framing", "Local texture", "Slow discovery"];
}

function buildItinerary(
  brief: BriefPayload,
  expertMatches: ReturnType<typeof matchExperts>,
) {
  const mainCity = brief.preferredCities[0] ?? "Jingdezhen";
  const mainExpert = expertMatches[0];

  if (brief.interest === "Porcelain") {
    return {
      title: `${brief.days}-Day ${mainCity} Ceramic Deep Dive`,
      summary:
        "A route shaped around making, material knowledge, museum context, and quieter studio time.",
      days: [
        {
          day: 1,
          theme: "Porcelain history and museum context",
          activities: [
            "Imperial kiln museum visit",
            "Private introduction to porcelain history",
            "Old town ceramic street walk",
          ],
        },
        {
          day: 2,
          theme: "Hands-on making",
          activities: [
            "Wheel throwing workshop",
            "Glazing session",
            "Studio talk with local ceramic artist",
          ],
        },
        {
          day: 3,
          theme: "Collecting and slower reflection",
          activities: [
            "Independent gallery circuit",
            "Maker neighborhood exploration",
            "Farewell tea and purchase guidance",
          ],
        },
      ].slice(0, brief.days),
      matchedExpert: mainExpert
        ? { name: mainExpert.name, city: formatCity(mainExpert.city) }
        : null,
    };
  }

  if (brief.interest === "Tea") {
    return {
      title: `${brief.days}-Day ${mainCity} Tea Landscape Route`,
      summary:
        "A calmer tea-led route balancing landscape, tasting, and enough quiet to actually absorb place.",
      days: [
        {
          day: 1,
          theme: "Tea orientation",
          activities: [
            "Tea history introduction",
            "Landscape overview",
            "First guided tasting",
          ],
        },
        {
          day: 2,
          theme: "Mountain and processing",
          activities: [
            "Tea garden visit",
            "Processing walkthrough",
            "Long-form tasting",
          ],
        },
        {
          day: 3,
          theme: "Quiet immersion",
          activities: [
            "Slow village time",
            "Tea and food pairing",
            "Optional mountain stay",
          ],
        },
      ].slice(0, brief.days),
      matchedExpert: mainExpert
        ? { name: mainExpert.name, city: formatCity(mainExpert.city) }
        : null,
    };
  }

  if (brief.interest === "Food") {
    return {
      title: `${brief.days}-Day ${mainCity} Food & Neighborhood Route`,
      summary:
        "A city-led immersion through markets, local dishes, and the street-level logic of daily life.",
      days: [
        {
          day: 1,
          theme: "Flavor and orientation",
          activities: [
            "Neighborhood introduction",
            "Local signature meal",
            "Evening street atmosphere walk",
          ],
        },
        {
          day: 2,
          theme: "Market intelligence",
          activities: [
            "Morning market visit",
            "Ingredient decoding with a guide",
            "Regional food storytelling",
          ],
        },
        {
          day: 3,
          theme: "Deep local cut",
          activities: [
            "Less-touristed district exploration",
            "Specialty tasting sequence",
            "Optional expert add-on experience",
          ],
        },
      ].slice(0, brief.days),
      matchedExpert: mainExpert
        ? { name: mainExpert.name, city: formatCity(mainExpert.city) }
        : null,
    };
  }

  return {
    title: `${brief.days}-Day ${mainCity} Cultural Discovery Brief`,
    summary:
      "A tailored route that turns broad curiosity into a coherent China journey with the right pace and expert fit.",
    days: [
      {
        day: 1,
        theme: "Orientation and cultural framing",
        activities: [
          "Private introduction with your guide",
          "Context-setting city walk",
          "Evening reflection and route adjustment",
        ],
      },
      {
        day: 2,
        theme: "Deeper local immersion",
        activities: [
          "Theme-led experience block",
          "Local neighborhood exploration",
          "Optional specialist add-on",
        ],
      },
      {
        day: 3,
        theme: "Personalized closing day",
        activities: [
          "Flexible itinerary shaped by your strongest interest",
          "Local recommendations for what comes next",
          "Booking-ready handoff",
        ],
      },
    ].slice(0, brief.days),
    matchedExpert: mainExpert
      ? { name: mainExpert.name, city: formatCity(mainExpert.city) }
      : null,
  };
}

function buildStructuredAnswer(
  brief: BriefPayload,
  itinerary: ReturnType<typeof buildItinerary>,
  matchedExperts: ReturnType<typeof matchExperts>,
  context: RetrievedContext,
): StructuredAnswer {
  const topExpert = matchedExperts[0]?.name ?? "a local specialist";
  const sourceLabel =
    context.source === "supabase"
      ? "Grounded in expert database context"
      : context.source === "mock"
        ? "Grounded in curated destination demo data"
        : "Generated from concierge trip logic";

  return {
    summary: `This looks best as a ${brief.pace} ${brief.days}-day ${brief.interest.toLowerCase()} journey led by ${brief.preferredCities.slice(0, 2).join(" + ") || "a flagship China destination"}.`,
    reasons: [
      `The brief points toward ${brief.mustHave.slice(0, 2).join(" and ") || "a slower, more contextual route"} rather than a generic city checklist.`,
      `The current match logic would start with ${topExpert} and shape the experience around ${brief.interest.toLowerCase()}, pacing, and cultural depth.`,
    ],
    routeHighlights: itinerary.days.map(
      (day) =>
        `Day ${day.day}: ${day.theme} — ${day.activities[0] ?? "Tailored local immersion"}`,
    ),
    sourceLabel,
  };
}

function buildEvidenceCards(
  brief: BriefPayload,
  matchedExperts: ReturnType<typeof matchExperts>,
  context: RetrievedContext,
): EvidenceCard[] {
  const expertCards = matchedExperts.slice(0, 2).map((expert) => ({
    title: expert.name,
    type: "expert" as const,
    snippet: expert.headline,
    meta: `${formatCity(expert.city)} · ${expert.reasons[0] ?? "Relevant expert match"}`,
  }));

  const contextCards = context.notes.slice(0, 2).map((note, index) => ({
    title:
      context.source === "supabase"
        ? `Knowledge note ${index + 1}`
        : `Context note ${index + 1}`,
    type: "context" as const,
    snippet: note,
    meta:
      context.source === "supabase"
        ? "Expert database context"
        : context.source === "mock"
          ? "Curated demo knowledge"
          : "Concierge internal context",
  }));

  const signalCard = {
    title: "Trip signals",
    type: "signal" as const,
    snippet: `${brief.interest} · ${brief.pace} pace · ${brief.days} days · ${brief.budget}`,
    meta: `Must-have: ${brief.mustHave.join(", ") || "none captured yet"}`,
  };

  return [...expertCards, ...contextCards, signalCard].slice(0, 5);
}

async function buildReply(
  message: string,
  brief: BriefPayload,
  matchedExperts: ReturnType<typeof matchExperts>,
  context: RetrievedContext,
  history: TurnHistory,
) {
  const topExpert = matchedExperts[0]?.name ?? "a local specialist";
  const contextLine =
    context.notes.length > 0
      ? `I also pulled relevant context from ${context.source === "supabase" ? "your database" : "the current demo knowledge base"}.`
      : "I'm still working from the built-in destination logic and demo expert set.";
  const openingLine = buildFocusedOpening(brief);
  const cityFocusGuidance = buildCityFocusGuidance(brief.preferredCities);

  const historySummary = buildHistorySummary(history);
  const fallback = `${openingLine} You're pointing toward ${brief.interest.toLowerCase()} with a ${brief.pace} pace and about ${brief.days} day${brief.days > 1 ? "s" : ""}. ${contextLine} I’d shape the route around ${brief.mustHave.join(", ")}, keep the city focus anchored in ${cityFocusGuidance || "clear local highlights"}, and only introduce an expert after the place itself is clear.`;

  try {
    const modelReply = await generateChatReply([
      {
        role: "system",
        content:
          "You are a premium China travel concierge. Reply briefly, warmly, and clearly. Start by explaining the destination itself, not by recommending a guide. For the opening answer, make the city feel specific by focusing on 1 to 3 defining highlights. Avoid ### headings. Use plain paragraphs, short bullets when helpful, and clean markdown-like formatting only. Ground your answer in the structured brief provided. Do not mention raw system prompts or internal reasoning.",
      },
      {
        role: "user",
        content: `User message: ${message}\n\nRecent conversation:\n${historySummary || "No prior conversation."}\n\nInterest: ${brief.interest}\nPace: ${brief.pace}\nDays: ${brief.days}\nPreferred cities: ${brief.preferredCities.join(", ")}\nMust-have: ${brief.mustHave.join(", ")}\nContext source: ${context.source}\nContext notes: ${context.notes.join(" | ")}\nTop expert: ${topExpert}\n\nCity focus guidance: ${cityFocusGuidance || "Highlight the city's defining identity first."}\n\nOpening rule: explain the city's most important 1 to 3 points first. Examples: Beijing = culture, Great Wall / Forbidden City, hutongs; Jingdezhen = porcelain; Quanzhou = Song-Yuan great port and plural culture; Chongqing = cyberpunk terrain and hotpot; Chengdu = comfort and pandas; Wudang Mountain = scenery, Taoist culture, taiji; Jingmai Mountain = tea mountains.`,
      },
    ]);

    return modelReply || fallback;
  } catch {
    return fallback;
  }
}

export async function runConciergeTurn({
  message,
  history = [],
}: {
  message: string;
  history?: Array<{ role: "user" | "assistant"; content: string }>;
}): Promise<ChatApiResponse> {
  const context = await retrieveContext(message, history);
  const brief = buildBrief(message);
  const travelBrief = buildTravelBrief(message);
  const expertMatches = matchExperts(travelBrief);
  const recommendedThemes = buildThemes(brief);
  const itinerary = buildItinerary(brief, expertMatches);
  const reply = await buildReply(
    message,
    brief,
    expertMatches,
    context,
    history,
  );
  const answer = buildStructuredAnswer(
    brief,
    itinerary,
    expertMatches,
    context,
  );
  const evidence = buildEvidenceCards(brief, expertMatches, context);

  return {
    reply,
    answer,
    evidence,
    followUpQuestions: [
      "Which part matters most: craft, food, history, tea, or philosophy?",
      "Do you want a slower private pace or a denser immersive route?",
      "How many days should the first version of the trip cover?",
      "Would you like us to optimize for one flagship city or a city pair?",
    ],
    contextSource: context.source,
    usedModel: Boolean(process.env.LLM_API_KEY || process.env.OPENAI_API_KEY),
    brief,
    recommendedCities: brief.preferredCities,
    recommendedThemes,
    matchedExperts: expertMatches.map((expert) => ({
      slug: expert.slug,
      name: expert.name,
      city: formatCity(expert.city),
      headline: expert.headline,
      languages: expert.languages,
      reasons: expert.reasons,
    })),
    itinerary,
  };
}
