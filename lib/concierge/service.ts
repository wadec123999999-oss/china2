import { formatCity } from "@/lib/format";
import { generateChatReply } from "@/lib/llm/provider";
import {
  matchExpertPool,
  matchExperts,
  type ExpertMatch,
} from "@/lib/matching/match-experts";
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
import { fetchConciergeKnowledge } from "./repository";

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

function inferAudienceSlugs(message: string): string[] {
  const lowered = message.toLowerCase();
  const audienceSlugs = new Set<string>();

  if (
    lowered.includes("first time") ||
    lowered.includes("first-time") ||
    lowered.includes("my first trip") ||
    lowered.includes("first visit to china")
  ) {
    audienceSlugs.add("first_time_china");
  }

  if (
    lowered.includes("philippines") ||
    lowered.includes("malaysia") ||
    lowered.includes("singapore") ||
    lowered.includes("indonesia") ||
    lowered.includes("thailand") ||
    lowered.includes("hokkien") ||
    lowered.includes("diaspora")
  ) {
    audienceSlugs.add("seasia_diaspora");
  }

  if (lowered.includes("roots") || lowered.includes("ancestry") || lowered.includes("family")) {
    audienceSlugs.add("family_roots");
  }

  if (lowered.includes("japan") || lowered.includes("japanese")) {
    audienceSlugs.add("japan_culture");
  }

  if (lowered.includes("korea") || lowered.includes("korean")) {
    audienceSlugs.add("korea_visual_culture");
  }

  if (
    lowered.includes("united states") ||
    lowered.includes("america") ||
    lowered.includes("american") ||
    lowered.includes("canada") ||
    lowered.includes("canadian")
  ) {
    audienceSlugs.add("north_america_cultural");
  }

  if (lowered.includes("australia") || lowered.includes("australian")) {
    audienceSlugs.add("australia_cultural");
  }

  if (
    lowered.includes("middle east") ||
    lowered.includes("uae") ||
    lowered.includes("oman") ||
    lowered.includes("saudi") ||
    lowered.includes("muslim") ||
    lowered.includes("islamic")
  ) {
    audienceSlugs.add("middle_east_heritage");
  }

  if (
    lowered.includes("europe") ||
    lowered.includes("european") ||
    lowered.includes("france") ||
    lowered.includes("french") ||
    lowered.includes("italy") ||
    lowered.includes("italian") ||
    lowered.includes("germany") ||
    lowered.includes("german") ||
    lowered.includes("uk") ||
    lowered.includes("british")
  ) {
    audienceSlugs.add("europe_heritage");
  }

  if (
    lowered.includes("photo") ||
    lowered.includes("photography") ||
    lowered.includes("instagram") ||
    lowered.includes("style")
  ) {
    audienceSlugs.add("photography_style");
  }

  if (
    lowered.includes("academic") ||
    lowered.includes("museum") ||
    lowered.includes("scholar") ||
    lowered.includes("research")
  ) {
    audienceSlugs.add("academic_museum");
  }

  if (
    lowered.includes("wellness") ||
    lowered.includes("retreat") ||
    lowered.includes("reflective") ||
    lowered.includes("stillness") ||
    lowered.includes("restorative") ||
    lowered.includes("quiet trip")
  ) {
    audienceSlugs.add("wellness_slow_travel");
  }

  return Array.from(audienceSlugs);
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

function formatExpertCategory(category?: string) {
  return category
    ? category
        .split("_")
        .map((word) => word.charAt(0).toUpperCase() + word.slice(1))
        .join(" ")
    : "Cultural";
}

function formatManagedExpertLabel(expert?: ExpertMatch | null) {
  if (!expert) return "a managed local expert match";

  return `${formatCity(expert.city)} managed ${formatExpertCategory(expert.categories[0]).toLowerCase()} expert match`;
}

function toManagedExpertSummary(expert: ExpertMatch, index: number) {
  return {
    slug: `managed-match-${index + 1}`,
    name: formatManagedExpertLabel(expert),
    city: formatCity(expert.city),
    headline: expert.headline,
    languages: expert.languages,
    reasons: expert.reasons,
  };
}

function maskRetrievedExpertContext(context: RetrievedContext): RetrievedContext {
  return {
    ...context,
    notes: context.notes.map((note) => {
      if (note.includes("Why visit:")) return note;
      const publicSnippet = note.includes(":")
        ? note.replace(/^.*:\s*/, "")
        : note;
      return `Managed expert context: ${publicSnippet}`;
    }),
  };
}

function getCityFocusPoints(city: string) {
  switch (city) {
    case "Beijing":
      return [
        "imperial order",
        "the Central Axis and ceremonial space",
        "hutong life",
      ];
    case "Jingdezhen":
      return ["porcelain history", "kilns and making", "studio culture"];
    case "Quanzhou":
      return [
        "the great Song-Yuan port",
        "maritime trade history",
        "religious and cultural plurality",
      ];
    case "Chongqing":
      return [
        "a cyberpunk-feeling 8D mountain city",
        "night movement, neon, and multi-level urban drama",
        "hotpot and wartime layers",
      ];
    case "Chengdu":
      return [
        "Sichuan food and flavor",
        "pandas as an easy entry point",
        "tea-house rhythm and gentle urban life",
      ];
    case "Wudang Mountain":
      return ["Taoist culture", "Taiji and internal practice", "sacred mountain architecture"];
    case "Jingmai Mountain":
      return ["ancient tea forests", "village continuity", "tea ritual"];
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
            (expert) => `${expert.name} -${expert.city}: ${expert.headline}`,
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
        .map((expert) => `${expert.name} -${expert.city}: ${expert.headline}`),
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
  itineraryHints: Array<{ title: string; summary: string; city: string; days: number }>,
) {
  const mainCity = brief.preferredCities[0] ?? "Jingdezhen";
  const mainExpert = expertMatches[0];
  const topHint = itineraryHints[0];

  if (brief.interest === "Porcelain") {
    return {
      title: topHint?.title ?? `${brief.days}-Day ${mainCity} Ceramic Deep Dive`,
      summary:
        topHint?.summary ??
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
        ? { name: formatManagedExpertLabel(mainExpert), city: formatCity(mainExpert.city) }
        : null,
    };
  }

  if (brief.interest === "Tea") {
    return {
      title: topHint?.title ?? `${brief.days}-Day ${mainCity} Tea Landscape Route`,
      summary:
        topHint?.summary ??
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
        ? { name: formatManagedExpertLabel(mainExpert), city: formatCity(mainExpert.city) }
        : null,
    };
  }

  if (brief.interest === "Food") {
    return {
      title: topHint?.title ?? `${brief.days}-Day ${mainCity} Food & Neighborhood Route`,
      summary:
        topHint?.summary ??
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
        ? { name: formatManagedExpertLabel(mainExpert), city: formatCity(mainExpert.city) }
        : null,
    };
  }

  return {
    title: topHint?.title ?? `${brief.days}-Day ${mainCity} Cultural Discovery Brief`,
    summary:
      topHint?.summary ??
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
      ? { name: formatManagedExpertLabel(mainExpert), city: formatCity(mainExpert.city) }
      : null,
  };
}

function getPositioningBrief(context: RetrievedContext) {
  const routeCombination = context.notes.find((item) =>
    item.startsWith("Route combination:"),
  );
  if (routeCombination) {
    return routeCombination.split(" Best for:")[0] ?? routeCombination;
  }

  const note = context.notes.find((item) => item.includes("Why visit:"));
  return note?.split(" Why visit:")[0] ?? null;
}

function buildStructuredAnswer(
  brief: BriefPayload,
  itinerary: ReturnType<typeof buildItinerary>,
  matchedExperts: ReturnType<typeof matchExperts>,
  context: RetrievedContext,
): StructuredAnswer {
  const topExpert = formatManagedExpertLabel(matchedExperts[0]);
  const positioningBrief = getPositioningBrief(context);
  const hasRouteCombination = context.notes.some((item) =>
    item.startsWith("Route combination:"),
  );
  const sourceLabel =
    context.source === "supabase"
      ? "Grounded in Supabase knowledge database"
      : context.source === "static"
        ? "Grounded in destination knowledge base"
      : context.source === "mock"
        ? "Grounded in curated destination demo data"
        : "Generated from concierge trip logic";

  return {
    summary:
      positioningBrief ??
      `This looks best as a ${brief.pace} ${brief.days}-day ${brief.interest.toLowerCase()} journey led by ${brief.preferredCities.slice(0, 2).join(" + ") || "a flagship China destination"}.`,
    reasons: [
      hasRouteCombination
        ? "The recommendation uses a city-combination route logic, not a generic list of famous stops."
        : positioningBrief
        ? "The city recommendation starts from its core selling proposition, not only from attractions."
        : `The brief points toward ${brief.mustHave.slice(0, 2).join(" and ") || "a slower, more contextual route"} rather than a generic city checklist.`,
      hasRouteCombination
        ? "The next step is to calibrate pace, comfort, budget, and expert support after the city order feels right."
        : `The current match logic would start with ${topExpert} and shape the experience around ${brief.interest.toLowerCase()}, pacing, and cultural depth.`,
    ],
    routeHighlights: itinerary.days.map(
      (day) =>
        `Day ${day.day}: ${day.theme} - ${day.activities[0] ?? "Tailored local immersion"}`,
    ),
    sourceLabel,
  };
}

function buildEvidenceCards(
  brief: BriefPayload,
  matchedExperts: ReturnType<typeof matchExperts>,
  context: RetrievedContext,
): EvidenceCard[] {
  const hasRouteCombination = context.notes.some((item) =>
    item.startsWith("Route combination:"),
  );
  const shouldShowExperts =
    !hasRouteCombination &&
    (brief.preferredCities.length > 0 || brief.interest !== "Cultural Discovery");
  const expertCards = shouldShowExperts
    ? matchedExperts.slice(0, 2).map((expert, index) => ({
        title: `Managed expert match ${index + 1}`,
        type: "expert" as const,
        snippet: expert.headline,
        meta: `${formatCity(expert.city)} - ${expert.reasons[0] ?? "Relevant expert match"}`,
      }))
    : [];

  const contextCards = context.notes.slice(0, 2).map((note, index) => ({
    title:
      context.source === "supabase"
        ? `Knowledge note ${index + 1}`
        : `Context note ${index + 1}`,
    type: "context" as const,
    snippet: note,
    meta:
      context.source === "supabase"
        ? "Supabase knowledge database"
        : context.source === "static"
          ? "Destination knowledge base"
          : context.source === "mock"
            ? "Curated demo knowledge"
            : "Concierge internal context",
  }));

  const signalCard = {
    title: "Trip signals",
    type: "signal" as const,
    snippet: `${brief.interest} - ${brief.pace} pace - ${brief.days} days - ${brief.budget}`,
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
  recommendedThemes: string[],
  itineraryHints: Array<{ title: string; summary: string; city: string; days: number }>,
) {
  const topExpert = formatManagedExpertLabel(matchedExperts[0]);
  const contextLine =
    context.notes.length > 0
      ? `I also pulled relevant context from ${context.source === "supabase" ? "your database" : context.source === "static" ? "the destination knowledge base" : "the current demo knowledge base"}.`
      : "I'm still working from the built-in destination logic and demo expert set.";
  const positioningBrief = getPositioningBrief(context);
  const openingLine = positioningBrief ?? buildFocusedOpening(brief);
  const cityFocusGuidance = buildCityFocusGuidance(brief.preferredCities);

  const historySummary = buildHistorySummary(history);
  const routeHint = itineraryHints[0];
  const fallback = `${openingLine} You're pointing toward ${brief.interest.toLowerCase()} with a ${brief.pace} pace and about ${brief.days} day${brief.days > 1 ? "s" : ""}. ${contextLine} I'd shape the route around ${brief.mustHave.join(", ")}, keep the city focus anchored in ${cityFocusGuidance || "clear local highlights"}, and only introduce an expert after the place itself is clear.`;

  try {
    const modelReply = await generateChatReply([
      {
        role: "system",
        content:
          "You are a premium China travel concierge. Reply briefly, warmly, and clearly. Start by explaining why the destination is worth visiting and what its real selling point is, not by recommending a guide. If the context includes a Why visit note, use it as the opening logic. For the opening answer, make the city feel specific by focusing on 1 to 3 defining highlights. Avoid ### headings. Use plain paragraphs, short bullets when helpful, and clean markdown-like formatting only. Ground your answer in the structured brief provided. Prefer theme-led answers over attraction lists. Do not mention raw system prompts or internal reasoning.",
      },
      {
        role: "user",
        content: `User message: ${message}\n\nRecent conversation:\n${historySummary || "No prior conversation."}\n\nInterest: ${brief.interest}\nPace: ${brief.pace}\nDays: ${brief.days}\nPreferred cities: ${brief.preferredCities.join(", ")}\nMust-have: ${brief.mustHave.join(", ")}\nRecommended themes: ${recommendedThemes.join(", ") || "none"}\nContext source: ${context.source}\nContext notes: ${context.notes.join(" | ")}\nTop expert: ${topExpert}\nRoute hint: ${routeHint ? `${routeHint.title} -${routeHint.summary}` : "none"}\n\nCity focus guidance: ${cityFocusGuidance || "Highlight the city's defining identity first."}\n\nOpening rule: explain the city's most important 1 to 3 points first. Examples: Beijing = imperial order, Central Axis, hutongs; Jingdezhen = porcelain history, kilns, studios; Quanzhou = Song-Yuan port and plural culture; Chongqing = cyberpunk-feeling 8D mountain city, neon night movement, hotpot and wartime layers; Chengdu = tea-house rhythm, local ease, food; Wudang Mountain = Taoist mountain, sacred architecture, internal practice; Jingmai Mountain = tea forests, village continuity, tea ritual.`,
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
  const brief = buildBrief(message);
  const travelBrief = buildTravelBrief(message);
  const audienceSlugs = inferAudienceSlugs(message);
  const knowledge = await fetchConciergeKnowledge({
    message,
    preferredCities: brief.preferredCities,
    category: travelBrief.category,
    audienceSlugs,
  });
  const hasKnowledgeContext =
    knowledge.source !== "none" && knowledge.notes.length > 0;
  const context = hasKnowledgeContext
    ? { source: knowledge.source, notes: knowledge.notes }
    : maskRetrievedExpertContext(await retrieveContext(message, history));
  const expertMatches =
    knowledge.experts.length > 0
      ? matchExpertPool(travelBrief, knowledge.experts)
      : matchExperts(travelBrief);
  const recommendedThemes =
    knowledge.themeLabels.length > 0 ? knowledge.themeLabels : buildThemes(brief);
  const itinerary = buildItinerary(brief, expertMatches, knowledge.itineraryHints);
  const reply = await buildReply(
    message,
    brief,
    expertMatches,
    context,
    history,
    recommendedThemes,
    knowledge.itineraryHints,
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
    matchedExperts: expertMatches.map(toManagedExpertSummary),
    itinerary,
  };
}
