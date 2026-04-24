export const CITIES = [
  "beijing",
  "chengdu",
  "chongqing",
  "jingdezhen",
  "quanzhou",
  "jingmai_mountain",
  "wudang_mountain",
] as const;

export const FIRST_BATCH_CITIES = [
  "beijing",
  "chengdu",
  "jingdezhen",
  "quanzhou",
  "chongqing",
] as const satisfies readonly City[];

export const CATEGORIES = [
  "porcelain",
  "tea",
  "sichuan_food",
  "kung_fu",
  "calligraphy",
  "tcm",
  "photography",
  "maritime_silk_road",
] as const;

export type City = (typeof CITIES)[number];
export type Category = (typeof CATEGORIES)[number];

export const CANCELLATION_WINDOWS_HOURS = {
  full_refund: 48,
  half_refund: 24,
} as const;

export const PLATFORM_FEE_PCT = 25 as const;
