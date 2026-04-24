import type { Category, City } from "@/lib/constants";

export type ExpertProfile = {
  id: string;
  slug: string;
  name: string;
  city: City;
  categories: Category[];
  headline: string;
  bio: string;
  languages: string[];
  hourlyRateCents: number;
  halfDayRateCents: number;
  fullDayRateCents: number;
  tags: string[];
  sampleSession: string;
};

export type TravelBrief = {
  city?: City;
  category?: Category;
  interests: string;
  pace: "slow" | "balanced" | "immersive";
};

export const mockExperts: ExpertProfile[] = [
  {
    id: "expert_wei_chen",
    slug: "wei-chen",
    name: "Wei Chen",
    city: "jingdezhen",
    categories: ["porcelain"],
    headline: "Ceramic historian and working porcelain maker",
    bio: "Wei leads deep-dive porcelain experiences through kiln history, studio practice, and collecting culture in Jingdezhen.",
    languages: ["English", "Mandarin"],
    hourlyRateCents: 18000,
    halfDayRateCents: 50000,
    fullDayRateCents: 90000,
    tags: ["craft", "studio visit", "history"],
    sampleSession:
      "Spend an afternoon tracing porcelain from imperial kilns to today's studios, with time to meet makers and discuss collecting.",
  },
  {
    id: "expert_mei_zhang",
    slug: "mei-zhang",
    name: "Mei Zhang",
    city: "chengdu",
    categories: ["tea", "sichuan_food"],
    headline: "Tea educator and Sichuan food culture guide",
    bio: "Mei connects tea practice with Sichuan daily life, markets, and culinary traditions for curious travelers.",
    languages: ["English", "Mandarin"],
    hourlyRateCents: 16000,
    halfDayRateCents: 46000,
    fullDayRateCents: 82000,
    tags: ["teahouse", "markets", "food culture"],
    sampleSession:
      "Move from an old teahouse to a neighborhood market, then decode what makes Sichuan flavor feel so alive.",
  },
  {
    id: "expert_lin_qiu",
    slug: "lin-qiu",
    name: "Lin Qiu",
    city: "quanzhou",
    categories: ["maritime_silk_road", "photography"],
    headline: "Historian of ports, trade, and living heritage",
    bio: "Lin explores Quanzhou through maritime exchange, architecture, temples, and contemporary local memory.",
    languages: ["English", "Mandarin"],
    hourlyRateCents: 17000,
    halfDayRateCents: 48000,
    fullDayRateCents: 85000,
    tags: ["architecture", "temples", "history walk"],
    sampleSession:
      "Follow the layers of Quanzhou's port history through shrines, streets, and stories of exchange across the seas.",
  },
  {
    id: "expert_yan_luo",
    slug: "yan-luo",
    name: "Yan Luo",
    city: "beijing",
    categories: ["calligraphy", "photography", "tcm"],
    headline: "Calligraphy instructor and Beijing culture researcher",
    bio: "Yan designs intellectually rich sessions across calligraphy, urban memory, and traditional wellness culture.",
    languages: ["English", "Mandarin"],
    hourlyRateCents: 19000,
    halfDayRateCents: 52000,
    fullDayRateCents: 94000,
    tags: ["hutongs", "calligraphy", "urban memory"],
    sampleSession:
      "Begin with brushwork basics, then head into old Beijing streets to understand form, rhythm, and lived history.",
  },
  {
    id: "expert_hao_tang",
    slug: "hao-tang",
    name: "Hao Tang",
    city: "chongqing",
    categories: ["sichuan_food", "photography"],
    headline: "Mountain city photographer and food scene interpreter",
    bio: "Hao helps travelers understand Chongqing through layered urban space, visual culture, and bold local flavors.",
    languages: ["English", "Mandarin"],
    hourlyRateCents: 15500,
    halfDayRateCents: 43000,
    fullDayRateCents: 78000,
    tags: ["street life", "night scenes", "hotpot"],
    sampleSession:
      "See Chongqing at street level and skyline level, with stops that explain how the city shapes its food and images.",
  },
];
