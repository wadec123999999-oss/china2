import type { DestinationSlug } from "@/lib/destination-positioning";

export type RouteCombination = {
	id: string;
	title: string;
	duration: string;
	cities: DestinationSlug[];
	bestFor: string;
	routeLogic: string;
	cityOrder: string[];
	whyNotGeneric: string;
	conversionQuestion: string;
};

export const routeCombinations = [
	{
		id: "first-china-cultural-arc",
		title: "First China cultural arc",
		duration: "9-12 days",
		cities: ["beijing", "chengdu", "chongqing"],
		bestFor:
			"First-time visitors who want history, comfort, food, pandas, and one visually unforgettable modern city.",
		routeLogic:
			"Begin with Beijing for historical grammar, soften into Chengdu through pandas, food, and tea, then finish with Chongqing for 8D urban intensity.",
		cityOrder: [
			"Beijing: power, ritual, axis, hutongs, and the first framework for China.",
			"Chengdu: food, pandas, tea houses, parks, and emotional ease.",
			"Chongqing: vertical geography, nightscape, hotpot, and cinematic energy.",
		],
		whyNotGeneric:
			"This is not a Beijing-Xian-Shanghai standard route. It teaches China through capital order, Sichuan social life, and mountain-city urbanism.",
		conversionQuestion:
			"Should the route be family-friendly and soft, or more visual, food-heavy, and late-night?",
	},
	{
		id: "sichuan-basin-contrast",
		title: "Sichuan Basin contrast",
		duration: "5-7 days",
		cities: ["chengdu", "chongqing"],
		bestFor:
			"Food travelers, families with older children, photographers, and travelers choosing between comfort and intensity.",
		routeLogic:
			"Put Chengdu first because it makes Sichuan feel relaxed and generous; put Chongqing second because it raises the volume through heat, slopes, river fog, and night movement.",
		cityOrder: [
			"Chengdu: pandas, tea-house rhythm, markets, controlled Sichuan flavor.",
			"Chongqing: 8D movement, rails, bridges, stairs, hotpot, and night views.",
		],
		whyNotGeneric:
			"The point is not to see two nearby cities. The value is emotional contrast: soft Sichuan first, cinematic Sichuan second.",
		conversionQuestion:
			"How much spice, stairs, humidity, and late-night walking can the traveler enjoy?",
	},
	{
		id: "port-and-porcelain-culture",
		title: "Port and porcelain culture",
		duration: "7-9 days",
		cities: ["quanzhou", "jingdezhen"],
		bestFor:
			"Design travelers, museum patrons, diaspora travelers, and people interested in trade, objects, craft, and global China.",
		routeLogic:
			"Use Quanzhou to explain maritime exchange and plural religion, then use Jingdezhen to show how Chinese material culture moved through the world.",
		cityOrder: [
			"Quanzhou: Maritime Silk Road, Hokkien roots, temples, food, Nanyin, zanhua, incense.",
			"Jingdezhen: clay, kilns, glaze, workshops, makers, porcelain taste, and global collecting.",
		],
		whyNotGeneric:
			"This route replaces famous-city sightseeing with a sharper story: how goods, belief, people, and objects made China international.",
		conversionQuestion:
			"Is the traveler more interested in diaspora memory, religious coexistence, maker studios, or collecting?",
	},
	{
		id: "tea-and-porcelain-slow-craft",
		title: "Tea and porcelain slow craft",
		duration: "8-11 days",
		cities: ["jingdezhen", "jingmai-mountain"],
		bestFor:
			"Creative professionals, tea drinkers, photographers, writers, and slow-luxury travelers.",
		routeLogic:
			"Begin with porcelain as object and process, then move to Jingmai where tea becomes forest, hospitality, and time.",
		cityOrder: [
			"Jingdezhen: material culture, studios, kilns, glaze, tools, and object judgment.",
			"Jingmai: ancient tea forest, village rhythm, hosted meals, cups, mist, and quiet.",
		],
		whyNotGeneric:
			"The route is built around use and touch: the cup, the leaf, the hand, the host, and the time needed to understand them.",
		conversionQuestion:
			"Does the traveler want maker access, tea buying context, photography time, or a quieter retreat ending?",
	},
	{
		id: "ritual-and-mountain-cultivation",
		title: "Ritual and mountain cultivation",
		duration: "6-8 days",
		cities: ["beijing", "wudang-mountain"],
		bestFor:
			"Travelers interested in architecture, Taoism, ritual, philosophy, martial culture, and the body as cultural lens.",
		routeLogic:
			"Use Beijing for state ritual and axial order, then move to Wudang for mountain Taoism, breath, practice, and sacred landscape.",
		cityOrder: [
			"Beijing: state order, palace sequence, altars, gates, and political space.",
			"Wudang: Taoist architecture, mountain paths, Taiji, early light, and internal cultivation.",
		],
		whyNotGeneric:
			"This is not a temple checklist. It contrasts two forms of Chinese order: capital ceremony and mountain practice.",
		conversionQuestion:
			"Does the traveler want intellectual history, light practice, serious Taiji context, or contemplative walking?",
	},
	{
		id: "hokkien-roots-and-living-culture",
		title: "Hokkien roots and living culture",
		duration: "5-8 days",
		cities: ["quanzhou", "chengdu"],
		bestFor:
			"Southeast Asian Chinese diaspora travelers who want ancestral memory plus an easy food-led city.",
		routeLogic:
			"Use Quanzhou for Hokkien roots, port memory, religion, and family resonance; use Chengdu afterward for softer food, pandas, and comfort.",
		cityOrder: [
			"Quanzhou: Hokkien origin, old streets, temples, food memory, Maritime Silk Road.",
			"Chengdu: pandas, Sichuan meals, tea houses, parks, and decompression.",
		],
		whyNotGeneric:
			"This route respects emotional heritage first, then protects comfort and pleasure so the trip does not become only ancestry work.",
		conversionQuestion:
			"Should Quanzhou be built around surname roots, temple memory, food, zanhua, Nanyin, or a lighter heritage introduction?",
	},
	{
		id: "visual-china-for-creators",
		title: "Visual China for creators",
		duration: "7-10 days",
		cities: ["chongqing", "jingmai-mountain", "beijing"],
		bestFor:
			"Photographers, filmmakers, writers, and travelers who want strong atmosphere rather than famous-name coverage.",
		routeLogic:
			"Open with Chongqing's 8D urban spectacle, decompress in Jingmai's tea forest, then end in Beijing with historical structure if international flights require it.",
		cityOrder: [
			"Chongqing: neon, fog, river, rail, stairs, and hotpot steam.",
			"Jingmai: mist, tea forest, village roofs, quiet hospitality, and slow mornings.",
			"Beijing: axis, hutongs, ritual architecture, and exit-city clarity.",
		],
		whyNotGeneric:
			"The route is built around atmosphere and visual contrast: cyberpunk city, ancient tea forest, and capital geometry.",
		conversionQuestion:
			"Does the traveler need a photo-led route, a creator schedule, or a more comfortable premium version with fewer rough edges?",
	},
	{
		id: "seven-city-founder-map",
		title: "Seven-city founder map",
		duration: "18-24 days",
		cities: [
			"beijing",
			"chengdu",
			"chongqing",
			"quanzhou",
			"jingdezhen",
			"jingmai-mountain",
			"wudang-mountain",
		],
		bestFor:
			"Long-stay cultural travelers, researchers, creators, or prospective clients testing the full Deeper China idea.",
		routeLogic:
			"Treat each city as a different China: capital order, food ease, urban intensity, maritime memory, porcelain craft, tea ecology, and Taoist mountain cultivation.",
		cityOrder: [
			"Beijing: historical grammar.",
			"Chengdu: food and emotional ease.",
			"Chongqing: 8D visual intensity.",
			"Quanzhou: port memory and Hokkien roots.",
			"Jingdezhen: porcelain and maker culture.",
			"Jingmai: tea forest and slow hospitality.",
			"Wudang: Taoist mountain and body practice.",
		],
		whyNotGeneric:
			"This is not a grand tour of famous landmarks. It is a thesis route proving that China can be read through systems, materials, appetite, belief, and landscape.",
		conversionQuestion:
			"Which three city identities matter most to the traveler: history, food, visuals, roots, craft, tea, or spiritual practice?",
	},
] satisfies RouteCombination[];
