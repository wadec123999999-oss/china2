import { cityShowcase } from "@/lib/city-showcase";

export type DestinationSlug = (typeof cityShowcase)[number]["slug"];

export type DestinationPositioning = {
	signatureHook: string;
	whyVisit: string;
	coreSellPoints: Array<{
		title: string;
		body: string;
	}>;
	bestFor: string[];
	doNotSellAs: string;
	routeSeeds: Array<{
		title: string;
		duration: string;
		body: string;
	}>;
	faq: Array<{
		question: string;
		answer: string;
	}>;
};

export const destinationPositioningBySlug = {
	beijing: {
		signatureHook:
			"China's capital is strongest when it is read as a city of order, ritual, power, and ordinary courtyard life.",
		whyVisit:
			"Beijing gives foreign travelers a clear way to understand how imperial authority, ceremonial space, socialist memory, and neighborhood texture coexist. The value is not only the Forbidden City or the Great Wall. It is the contrast between monumental axes and human-scale hutongs, between state ritual and small daily habits.",
		coreSellPoints: [
			{
				title: "Imperial order and the Central Axis",
				body: "Use palace space, gates, altars, and axial planning to explain how power was staged, not just where emperors lived.",
			},
			{
				title: "Hutongs and courtyard life",
				body: "Slow walks, local markets, and courtyard conversations make the capital feel lived-in rather than only monumental.",
			},
			{
				title: "A strong first-China orientation",
				body: "Beijing works well as the first city for travelers who need historical grammar before moving into craft, tea, or regional culture.",
			},
		],
		bestFor: [
			"First-time visitors who want historical context",
			"Architecture and urban planning travelers",
			"Culture-led families or private small groups",
			"Museum, history, and diplomacy-minded guests",
		],
		doNotSellAs:
			"Do not frame Beijing as a checklist of famous sights. The premium version is about reading power, space, ritual, and neighborhood life with context.",
		routeSeeds: [
			{
				title: "Capital Order",
				duration: "3 days",
				body: "Central Axis, Forbidden City context, altar culture, hutong walks, and one carefully paced Great Wall day.",
			},
			{
				title: "Courtyard Beijing",
				duration: "4 days",
				body: "Hutongs, courtyard meals, local markets, temple routes, and slower neighborhood interpretation.",
			},
			{
				title: "Beijing as Prologue",
				duration: "2-3 days",
				body: "Use Beijing to establish China's historical frame before continuing to Jingdezhen, Quanzhou, Wudang, or Chengdu.",
			},
		],
		faq: [
			{
				question: "Why should a culture-focused traveler start in Beijing?",
				answer:
					"It gives the clearest opening frame for Chinese history, space, hierarchy, ritual, and urban continuity.",
			},
			{
				question: "How do we avoid making Beijing feel generic?",
				answer:
					"Reduce checklist pressure and build the route around contrasts: axis and alley, palace and courtyard, ceremony and daily life.",
			},
		],
	},
	chengdu: {
		signatureHook:
			"Chengdu is the easiest major Chinese city for foreigners to love through food, pandas, tea houses, and an unhurried social rhythm.",
		whyVisit:
			"Chengdu should lead with Sichuan food and pandas because those are the strongest emotional entry points for most foreign visitors. The deeper sell is that food, tea, parks, conversation, and neighborhood ease reveal a relaxed but culturally dense version of urban China.",
		coreSellPoints: [
			{
				title: "Sichuan food as culture",
				body: "Hotpot, snacks, market flavor, peppercorn aroma, and local dining habits turn meals into the main cultural route.",
			},
			{
				title: "Pandas as emotional gateway",
				body: "Pandas create immediate desire, especially for families and first-time visitors, then the trip can deepen into local life.",
			},
			{
				title: "Tea-house pace",
				body: "Parks, tea houses, mahjong, and long afternoons make Chengdu feel approachable, social, and human.",
			},
		],
		bestFor: [
			"Food-first travelers",
			"Families and couples",
			"Travelers who want China to feel relaxed, not overwhelming",
			"Guests pairing pandas with Sichuan culture",
		],
		doNotSellAs:
			"Do not reduce Chengdu to spicy food alone. Food and pandas should open the door, but the premium story is local ease, tea-house rhythm, and Sichuan social life.",
		routeSeeds: [
			{
				title: "Food and Panda First",
				duration: "3 days",
				body: "Panda base early morning, neighborhood snacks, hotpot, tea house, and a market-led flavor walk.",
			},
			{
				title: "Slow Chengdu",
				duration: "4 days",
				body: "Parks, teahouses, old streets, Sichuan opera, food neighborhoods, and one gentle countryside or craft extension.",
			},
			{
				title: "Chengdu and Chongqing Contrast",
				duration: "5-6 days",
				body: "Pair Chengdu's softness and food culture with Chongqing's 8D visual intensity and river-city drama.",
			},
		],
		faq: [
			{
				question: "Is Chengdu only about pandas?",
				answer:
					"No. Pandas are the strongest hook, but the memorable trip comes from food, tea houses, parks, and local social rhythm.",
			},
			{
				question: "Who is Chengdu best for?",
				answer:
					"Travelers who want culture through appetite, comfort, and daily life rather than only monuments.",
			},
		],
	},
	chongqing: {
		signatureHook:
			"Chongqing is China's most cinematic 8D mountain city: cyberpunk-feeling nights, impossible levels, hotpot heat, rivers, bridges, and vertical daily life.",
		whyVisit:
			"Chongqing should be sold as a sensory urban experience that feels unlike flat-grid cities. Foreign travelers remember the way trains, bridges, stairs, riverbanks, cliffside buildings, neon, fog, and hotpot combine into a city that feels almost fictional but is fully lived-in.",
		coreSellPoints: [
			{
				title: "Cyberpunk-feeling 8D geography",
				body: "Layered roads, monorails, cliffside buildings, river crossings, and sudden elevation changes create the city's strongest visual identity.",
			},
			{
				title: "Night city and river drama",
				body: "Neon, humidity, bridges, ferries, and high viewpoints make Chongqing especially strong for evening routes and photography.",
			},
			{
				title: "Hotpot and mountain-city appetite",
				body: "Food is not decoration here. Heat, noise, late meals, and communal dining match the city's physical intensity.",
			},
		],
		bestFor: [
			"Visual travelers and photographers",
			"Young premium travelers who want atmosphere",
			"Food and nightlife-led guests",
			"Visitors who want a city that feels different from Beijing or Shanghai",
		],
		doNotSellAs:
			"Do not present Chongqing as just another food city or a list of viral photo spots. The sell is the lived 8D geography plus night movement, appetite, and river-city scale.",
		routeSeeds: [
			{
				title: "8D City Immersion",
				duration: "2-3 days",
				body: "Layered transit, old stairs, river crossings, high viewpoints, neon night walks, and one proper hotpot evening.",
			},
			{
				title: "Cyberpunk Chongqing",
				duration: "3 days",
				body: "Focus on visual rhythm: monorail moments, bridges, elevated streets, fog, nightscape, and dense local neighborhoods.",
			},
			{
				title: "Sichuan Basin Pairing",
				duration: "5-6 days",
				body: "Contrast Chengdu's ease and pandas with Chongqing's vertical drama, hotpot, and urban intensity.",
			},
		],
		faq: [
			{
				question: "Why is Chongqing called an 8D city?",
				answer:
					"Because roads, rails, buildings, riverbanks, and walkways stack across multiple levels, making navigation feel vertical and cinematic.",
			},
			{
				question: "Is Chongqing suitable for luxury cultural travel?",
				answer:
					"Yes, if the route is curated around atmosphere, viewpoints, local food, and urban interpretation rather than generic viral stops.",
			},
		],
	},
	quanzhou: {
		signatureHook:
			"Quanzhou is a world-class Maritime Silk Road port where UNESCO heritage, plural religions, Hokkien memory, food, and craft still overlap in the streets.",
		whyVisit:
			"Quanzhou is strongest for travelers who want China connected to the wider world. Its value is not beach tourism. It is the rare combination of Song-Yuan maritime trade, temples, mosques, ancestral memory, overseas Chinese ties, foodways, and living craft traditions.",
		coreSellPoints: [
			{
				title: "Maritime Silk Road and UNESCO heritage",
				body: "Quanzhou explains China as a global port civilization, not an isolated inland empire.",
			},
			{
				title: "Plural religions and coexistence",
				body: "Mosques, temples, shrines, churches, and trade memory give the city unusual interpretive depth for foreign visitors.",
			},
			{
				title: "Hokkien diaspora and living food culture",
				body: "For Southeast Asian travelers especially, Quanzhou can feel like an origin story for family memory, language, worship, and flavor.",
			},
		],
		bestFor: [
			"Southeast Asian Hokkien and diaspora travelers",
			"UNESCO and maritime history travelers",
			"Religion, food, and old-city walkers",
			"Travelers seeking depth beyond famous first-tier cities",
		],
		doNotSellAs:
			"Do not sell Quanzhou as a generic coastal city. The premium story is port memory, religious plurality, Hokkien identity, food, and hand-made heritage.",
		routeSeeds: [
			{
				title: "Maritime World City",
				duration: "3 days",
				body: "Old port memory, UNESCO components, religious sites, street food, and a slow old-city route.",
			},
			{
				title: "Hokkien Roots",
				duration: "4 days",
				body: "Ancestral halls, temple culture, food memory, diaspora interpretation, and optional clan or village extensions.",
			},
			{
				title: "Craft and Ritual Quanzhou",
				duration: "5 days",
				body: "Zanhua, Nanyin, incense, tea, ceramics, local markets, and religious landscapes shaped into an immersive route.",
			},
		],
		faq: [
			{
				question: "Which foreign markets are most naturally attracted to Quanzhou?",
				answer:
					"Philippines, Malaysia, Singapore, Indonesia, and Thailand are especially strong because of Hokkien, diaspora, food, and temple connections.",
			},
			{
				question: "What makes Quanzhou different from Xiamen?",
				answer:
					"Xiamen is easier and more polished; Quanzhou is deeper for maritime heritage, religious plurality, old streets, and living traditions.",
			},
		],
	},
	jingdezhen: {
		signatureHook:
			"Jingdezhen is not only a porcelain museum city; it is a living craft ecosystem where clay, kiln, glaze, studio, and global design still meet.",
		whyVisit:
			"Jingdezhen gives foreign travelers a tactile way into Chinese culture. Instead of only viewing heritage, they can understand material, process, labor, failure, beauty, and global trade through porcelain. It is especially strong for design-minded and craft-minded guests.",
		coreSellPoints: [
			{
				title: "World porcelain capital",
				body: "The city's global significance is easy to explain: porcelain from here shaped taste, trade, collecting, and design across continents.",
			},
			{
				title: "Living studios and kilns",
				body: "The best route should include makers, workshops, firing culture, and contemporary craft, not only museums.",
			},
			{
				title: "High-value craft experience",
				body: "Jingdezhen is ideal for travelers who want to learn by seeing hands, tools, material choices, and process.",
			},
		],
		bestFor: [
			"Design, craft, and architecture travelers",
			"Museum and collector audiences",
			"Artists, students, and creative professionals",
			"Travelers who prefer process over sightseeing",
		],
		doNotSellAs:
			"Do not frame Jingdezhen as a shopping stop. The premium value is the craft ecosystem: kilns, studios, makers, materials, and global porcelain history.",
		routeSeeds: [
			{
				title: "Porcelain Deep Dive",
				duration: "3 days",
				body: "Historic kilns, museum context, studio visits, market texture, and one hands-on making or glazing session.",
			},
			{
				title: "Designer Jingdezhen",
				duration: "4 days",
				body: "Contemporary studios, independent makers, material research, old kiln districts, and curated collecting guidance.",
			},
			{
				title: "Porcelain and Capital Contrast",
				duration: "6-7 days",
				body: "Pair Beijing's imperial order with Jingdezhen's material culture to show power, taste, trade, and craft.",
			},
		],
		faq: [
			{
				question: "Why would a foreign traveler go to Jingdezhen?",
				answer:
					"Because it turns Chinese culture into something physical and understandable through clay, firing, craft, and global porcelain history.",
			},
			{
				question: "Is Jingdezhen only for collectors?",
				answer:
					"No. It is also strong for designers, families, students, artists, and travelers who want hands-on cultural experience.",
			},
		],
	},
	"jingmai-mountain": {
		signatureHook:
			"Jingmai is a slow tea mountain world where ancient tea forests, villages, ecology, and ritual create a quieter, more contemplative China route.",
		whyVisit:
			"Jingmai should be developed as a high-aesthetic slow travel destination, not a conventional attraction cluster. Its power comes from tea landscapes, mountain air, village continuity, ethnic culture, ecology, and the emotional shift that happens when the trip slows down.",
		coreSellPoints: [
			{
				title: "Ancient tea forest landscape",
				body: "Tea is not just a drink here. It is a landscape, livelihood, ritual, ecology, and way to read time.",
			},
			{
				title: "Slow mountain travel",
				body: "The appeal is pace reduction: mist, mornings, tea, walking, village stays, and distance from mass tourism.",
			},
			{
				title: "A strong premium retreat angle",
				body: "Jingmai fits travelers seeking silence, beauty, wellness-adjacent culture, and reflective travel without making it generic wellness tourism.",
			},
		],
		bestFor: [
			"Tea travelers and nature-focused guests",
			"Slow travel and retreat-style visitors",
			"Photographers and high-aesthetic travelers",
			"Repeat China visitors seeking less obvious routes",
		],
		doNotSellAs:
			"Do not sell Jingmai as a fast sightseeing stop. The value depends on slowness, weather, tea ritual, mountain texture, and local interpretation.",
		routeSeeds: [
			{
				title: "Tea Forest Stay",
				duration: "3 days",
				body: "Village base, tea forest walks, tea tasting, mountain mornings, and conversations around ecology and craft.",
			},
			{
				title: "Slow Yunnan Tea Route",
				duration: "5 days",
				body: "Jingmai with nearby tea landscapes, village rhythm, light hiking, and careful lodge pacing.",
			},
			{
				title: "Tea and Craft China",
				duration: "7 days",
				body: "Pair Jingmai's tea ecology with Jingdezhen's porcelain process for a material culture route.",
			},
		],
		faq: [
			{
				question: "Why is Jingmai worth including?",
				answer:
					"It adds quiet, ecology, tea culture, and emotional contrast to an itinerary that might otherwise be too city-heavy.",
			},
			{
				question: "Who should not choose Jingmai?",
				answer:
					"Travelers who want fast logistics, dense nightlife, or a simple checklist route may find it too slow.",
			},
		],
	},
	"wudang-mountain": {
		signatureHook:
			"Wudang Mountain is a Taoist sacred landscape where architecture, mountain paths, Taiji, breath, and internal practice give the trip spiritual weight.",
		whyVisit:
			"Wudang should be positioned around Taoist culture and Taiji, not just mountain scenery. For foreign travelers, it offers an unusually coherent combination of sacred architecture, philosophy, martial tradition, body practice, early light, and reflective travel.",
		coreSellPoints: [
			{
				title: "Taoist sacred mountain",
				body: "Temples, palaces, paths, and mountain orientation create a strong philosophical landscape, not just a scenic one.",
			},
			{
				title: "Taiji and internal practice",
				body: "Short, well-contextualized practice sessions can make the destination memorable without pretending to be a training camp.",
			},
			{
				title: "Architecture and atmosphere",
				body: "Wudang's appeal is strongest in early light, temple routes, clouds, silence, and the feeling of movement through a sacred mountain system.",
			},
		],
		bestFor: [
			"Taoism, philosophy, and martial culture travelers",
			"Guests seeking reflective mountain travel",
			"Wellness-adjacent travelers who want real culture",
			"Repeat China visitors looking beyond standard routes",
		],
		doNotSellAs:
			"Do not sell Wudang as generic scenery or kung fu performance. The premium route needs Taoist context, Taiji literacy, mountain pacing, and quiet.",
		routeSeeds: [
			{
				title: "Taoist Mountain Primer",
				duration: "2-3 days",
				body: "Temple sequence, mountain routes, Taoist interpretation, early morning light, and a short Taiji introduction.",
			},
			{
				title: "Practice and Stillness",
				duration: "4 days",
				body: "Slow temple walking, private contextual practice, philosophy-led interpretation, and unhurried mountain time.",
			},
			{
				title: "Wudang and Beijing",
				duration: "6-7 days",
				body: "Contrast Beijing's state ritual and axial order with Wudang's mountain spirituality and internal cultivation.",
			},
		],
		faq: [
			{
				question: "Is Wudang mainly for martial arts fans?",
				answer:
					"No. Martial culture matters, but the deeper appeal is Taoist mountain culture, architecture, philosophy, and embodied practice.",
			},
			{
				question: "How should Wudang be paced?",
				answer:
					"Slowly. The route should leave space for light, weather, walking, breathing, and interpretation rather than packing too many stops.",
			},
		],
	},
} satisfies Record<DestinationSlug, DestinationPositioning>;
