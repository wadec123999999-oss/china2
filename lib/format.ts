import type { Category, City } from "@/lib/constants";

const cityLabels: Record<City, string> = {
  beijing: "Beijing",
  chengdu: "Chengdu",
  chongqing: "Chongqing",
  jingdezhen: "Jingdezhen",
  quanzhou: "Quanzhou",
  jingmai_mountain: "Jingmai Mountain",
  wudang_mountain: "Wudang Mountain",
};

const categoryLabels: Record<Category, string> = {
  porcelain: "Porcelain",
  tea: "Tea",
  sichuan_food: "Sichuan Food",
  kung_fu: "Kung Fu",
  calligraphy: "Calligraphy",
  tcm: "Traditional Chinese Medicine",
  photography: "Photography",
  maritime_silk_road: "Maritime Silk Road",
};

export function formatCity(city: City): string {
  return cityLabels[city];
}

export function formatCategory(category: Category): string {
  return categoryLabels[category];
}
