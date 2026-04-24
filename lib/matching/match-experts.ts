import type { ExpertProfile, TravelBrief } from "@/lib/mock-data";
import { mockExperts } from "@/lib/mock-data";

export type ExpertMatch = ExpertProfile & {
  score: number;
  reasons: string[];
};

function scoreExpert(expert: ExpertProfile, brief: TravelBrief): ExpertMatch {
  let score = 0;
  const reasons: string[] = [];

  if (brief.city && expert.city === brief.city) {
    score += 40;
    reasons.push("Matches your destination city");
  }

  if (brief.category && expert.categories.includes(brief.category)) {
    score += 35;
    reasons.push("Strong fit for your main cultural interest");
  }

  const interests = brief.interests.toLowerCase();

  if (
    expert.tags.some((tag) => interests.includes(tag.toLowerCase())) ||
    expert.bio.toLowerCase().includes(interests) ||
    expert.sampleSession.toLowerCase().includes(interests)
  ) {
    score += 20;
    reasons.push("Connects with what you said you want to explore");
  }

  if (brief.pace === "immersive") {
    score += 10;
    reasons.push("Good fit for a deeper, more immersive session");
  }

  return {
    ...expert,
    score,
    reasons,
  };
}

export function matchExperts(brief: TravelBrief): ExpertMatch[] {
  return mockExperts
    .map((expert) => scoreExpert(expert, brief))
    .sort((a, b) => b.score - a.score)
    .slice(0, 3);
}

export function getExpertBySlug(slug: string) {
  return mockExperts.find((expert) => expert.slug === slug);
}
