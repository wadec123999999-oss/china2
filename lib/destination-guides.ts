import type { DestinationSlug } from "@/lib/destination-positioning";

export type DestinationGuide = {
	visualCaption: string;
	editorialLead: string;
	notGeneric: {
		title: string;
		body: string;
	};
	readTheCity: Array<{
		title: string;
		body: string;
	}>;
	signatureDays: Array<{
		title: string;
		body: string;
	}>;
	travelerFit: Array<{
		title: string;
		body: string;
	}>;
	planningSignals: Array<{
		title: string;
		body: string;
	}>;
	sourceAnchors: Array<{
		label: string;
		url: string;
	}>;
};

export const destinationGuides = {
	beijing: {
		visualCaption:
			"Generated city image direction: gates, courtyard texture, a long ceremonial axis, and small human movement inside monumental scale.",
		editorialLead:
			"Beijing should be read as a grammar of power. The city is strongest when the route explains how gates, walls, axes, altars, hutongs, meals, and neighborhood habits still give form to Chinese history.",
		notGeneric: {
			title: "Beyond the palace checklist",
			body: "A normal Beijing guide starts with the Forbidden City and the Great Wall. A better route asks what those places teach: how authority was staged, why distance mattered, how ordinary courtyard life softened the capital, and why a first-time China trip needs a historical opening chapter.",
		},
		readTheCity: [
			{
				title: "Axis and approach",
				body: "Use the Central Axis to explain sequence: gate, threshold, court, altar, view line, and controlled movement through space.",
			},
			{
				title: "Hutongs as counterweight",
				body: "Hutongs prevent Beijing from becoming only a city of state power. They show breakfast, doors, bicycles, courtyard memory, and the human scale behind the capital.",
			},
			{
				title: "Ritual, not only sightseeing",
				body: "Temples and altars help travelers understand seasonal order, cosmology, ceremony, and the symbolic logic behind imperial Beijing.",
			},
		],
		signatureDays: [
			{
				title: "Day 1: Courtyard soft landing",
				body: "A hutong walk, slow northern meal, and neighborhood orientation before the heavy monuments begin.",
			},
			{
				title: "Day 2: Central Axis reading",
				body: "A structured palace and axis day focused on power, approach, gates, and ceremonial space.",
			},
			{
				title: "Day 3: Wall, altar, or museum",
				body: "Choose one anchor according to the traveler: landscape defense, ritual order, or object-based history.",
			},
		],
		travelerFit: [
			{
				title: "Best first-China city",
				body: "Strong for travelers who need a clear frame before moving into craft, food, tea, mountain, or port cultures.",
			},
			{
				title: "Strong for architecture travelers",
				body: "Good for people who care about axes, typologies, preservation, state planning, and how cities express hierarchy.",
			},
			{
				title: "Not for fast comfort only",
				body: "Travelers who want soft leisure, resort time, or food-first travel may only need Beijing as a short prologue.",
			},
		],
		planningSignals: [
			{
				title: "Do not overload arrival day",
				body: "Jet-lagged travelers understand Beijing better with one neighborhood, one meal, and one clear orientation.",
			},
			{
				title: "Cluster the city",
				body: "Beijing is large. Cross-city zigzags weaken the day and drain energy needed for interpretation.",
			},
			{
				title: "Ask about history tolerance",
				body: "Some travelers want deep context; others need lighter stories, food, and neighborhood texture.",
			},
		],
		sourceAnchors: [
			{
				label: "UNESCO: Beijing Central Axis",
				url: "https://whc.unesco.org/en/list/1714/",
			},
			{
				label: "Visit Beijing: Hutong culture",
				url: "https://english.visitbeijing.com.cn/article/47OMs0rcAFo",
			},
		],
	},
	chengdu: {
		visualCaption:
			"Generated city image direction: tea-house tables, market flavor, soft park life, panda warmth, and Sichuan color without tourist cliche.",
		editorialLead:
			"Chengdu is the easiest city in this portfolio for many foreign travelers to feel. Pandas and food open the door, but the deeper city is about appetite, sitting, talking, tea, parks, and the confidence of daily life.",
		notGeneric: {
			title: "Food and pandas are the hook, not the whole product",
			body: "A generic guide lists panda bases, hotpot, and old streets. A stronger Chengdu route uses pandas as emotional entry, then lets food, tea houses, markets, and slow social rhythm explain why the city is loved.",
		},
		readTheCity: [
			{
				title: "Food as social structure",
				body: "Spice, peppercorn, shared tables, late meals, snacks, and markets show how Chengdu organizes pleasure and conversation.",
			},
			{
				title: "Tea-house time",
				body: "A tea house is not a break between attractions. It is where the city's pace becomes visible.",
			},
			{
				title: "Soft urban China",
				body: "Chengdu helps nervous first-timers feel that Chinese cities can be relaxed, legible, and emotionally easy.",
			},
		],
		signatureDays: [
			{
				title: "Day 1: Panda and flavor entry",
				body: "Early panda visit, simple snack sequence, and one confident Sichuan dinner with heat level controlled.",
			},
			{
				title: "Day 2: Market, park, tea",
				body: "Ingredients, neighborhood food, tea-house sitting, and local park life instead of a packed attraction list.",
			},
			{
				title: "Day 3: Opera or countryside extension",
				body: "Add performance, cooking, craft, or a softer countryside day depending on the traveler.",
			},
		],
		travelerFit: [
			{
				title: "Best for families",
				body: "Children have pandas; adults have food, tea, parks, and enough cultural depth to avoid a theme-park feeling.",
			},
			{
				title: "Best for food-first guests",
				body: "Good for travelers who understand a destination through appetite, markets, and ordering well.",
			},
			{
				title: "Not the most monumental city",
				body: "Guests seeking imperial scale, UNESCO port memory, or extreme urban visuals should pair Chengdu with another city.",
			},
		],
		planningSignals: [
			{
				title: "Ask spice tolerance early",
				body: "The route changes if a traveler wants full mala intensity, moderate heat, or cautious ordering.",
			},
			{
				title: "Anchor days around meals",
				body: "Meals are route infrastructure in Chengdu, not optional stops after sightseeing.",
			},
			{
				title: "Pair with Chongqing carefully",
				body: "Chengdu works well before Chongqing: softness first, intensity second.",
			},
		],
		sourceAnchors: [
			{
				label: "UNESCO Creative Cities: Chengdu",
				url: "https://www.unesco.org/en/creative-cities/chengdu",
			},
			{
				label: "UNESCO: Chengdu City of Gastronomy",
				url: "https://unesdoc.unesco.org/ark:/48223/pf0000192047",
			},
		],
	},
	chongqing: {
		visualCaption:
			"Generated city image direction: layered roads, river fog, lit bridges, monorail movement, hotpot steam, and night-time vertical density.",
		editorialLead:
			"Chongqing is a city you understand by moving through it. Its value is not a list of viral photo spots but the feeling of stacked geography, night movement, heat, river scale, and daily life adapted to slopes.",
		notGeneric: {
			title: "The 8D city is not just a meme",
			body: "A normal guide sends travelers to Liziba, Hongya Cave, and hotpot. A stronger route treats elevators, rails, bridges, stairs, ferries, and viewpoints as a continuous urban reading.",
		},
		readTheCity: [
			{
				title: "Navigation as culture",
				body: "Streets emerge at roof level, rail lines cut through buildings, and bridges become daily habits. Movement is the attraction.",
			},
			{
				title: "Night reveals the city",
				body: "Fog, neon, river reflections, cliffside buildings, and hotpot steam make Chongqing stronger after dark.",
			},
			{
				title: "Heat matches geography",
				body: "Hotpot belongs to the city physically: dense, communal, late, noisy, humid, and direct.",
			},
		],
		signatureDays: [
			{
				title: "Day 1: Vertical orientation",
				body: "Use rail, stairs, bridges, and overlooks to make the city physically legible.",
			},
			{
				title: "Day 2: Night and hotpot",
				body: "Sequence river views, elevated movement, neighborhood walking, and a serious hotpot evening.",
			},
			{
				title: "Day 3: Depth or contrast",
				body: "Choose Dazu, wartime memory, river culture, or a softer neighborhood day if the traveler wants more than spectacle.",
			},
		],
		travelerFit: [
			{
				title: "Best for visual travelers",
				body: "Strong for photographers, creators, younger premium guests, and repeat China visitors who want atmosphere.",
			},
			{
				title: "Good Chengdu contrast",
				body: "Works well after Chengdu because it changes the emotional register from ease to intensity.",
			},
			{
				title: "Filter mobility",
				body: "Travelers who dislike stairs, humidity, crowds, or late nights need a softened route.",
			},
		],
		planningSignals: [
			{
				title: "Stay overnight",
				body: "A day trip misses the city's core identity. Chongqing needs at least one night, ideally two or three.",
			},
			{
				title: "Do not chase only viral spots",
				body: "The route should build transitions between levels, not jump between isolated photo locations.",
			},
			{
				title: "Use hotpot after movement",
				body: "Hotpot lands better after the traveler has already felt the city's physical pressure.",
			},
		],
		sourceAnchors: [
			{
				label: "CNN Travel: Chongqing cyberpunk city",
				url: "https://www.cnn.com/travel/chongqing-china-tourism-cyberpunk-city-intl-hnk",
			},
			{
				label: "UNESCO: Dazu Rock Carvings",
				url: "https://whc.unesco.org/en/list/912",
			},
		],
	},
	quanzhou: {
		visualCaption:
			"Generated city image direction: old port streets, incense, temple roofs, stone lanes, Hokkien memory, and Maritime Silk Road atmosphere.",
		editorialLead:
			"Quanzhou is the clearest way in this set to show China as connected to the wider world. Its value is port memory, plural religion, Hokkien roots, food, craft, and old streets that still hold layers of exchange.",
		notGeneric: {
			title: "Not a generic coastal city",
			body: "A normal guide may compare Quanzhou with Xiamen or list temples. A better route explains why Zayton mattered, how religions coexisted, and why Southeast Asian Chinese travelers may feel family memory here.",
		},
		readTheCity: [
			{
				title: "Maritime Silk Road city",
				body: "Quanzhou explains China as a port civilization: merchants, sailors, worship, goods, language, and migration.",
			},
			{
				title: "Religious coexistence",
				body: "Mosques, temples, shrines, churches, and ancestor halls make the city unusually rich for foreign interpretation.",
			},
			{
				title: "Hokkien origin story",
				body: "For many Southeast Asian Chinese travelers, Quanzhou can connect surnames, food, dialect, temples, and migration memory.",
			},
		],
		signatureDays: [
			{
				title: "Day 1: Port and old-city orientation",
				body: "UNESCO components, old streets, maritime memory, and food as the first frame.",
			},
			{
				title: "Day 2: Religion and exchange",
				body: "A walking route through plural faiths, trade memory, and layered civic life.",
			},
			{
				title: "Day 3: Living culture",
				body: "Zanhua, Nanyin, food, craft, incense, tea, or porcelain depending on the traveler's profile.",
			},
		],
		travelerFit: [
			{
				title: "Best for Southeast Asian diaspora",
				body: "Especially strong for Filipino, Malaysian, Singaporean, Indonesian, and Thai Chinese travelers with Hokkien connections.",
			},
			{
				title: "Strong for UNESCO travelers",
				body: "Good for people interested in medieval trade, religious coexistence, and non-obvious heritage cities.",
			},
			{
				title: "Needs interpretation",
				body: "Travelers looking for skyline spectacle or resort comfort may not immediately understand why Quanzhou matters.",
			},
		],
		planningSignals: [
			{
				title: "Ask about ancestry",
				body: "Surname, dialect, temple, family food memory, and ancestral county can reshape the route.",
			},
			{
				title: "Do not rush it",
				body: "Quanzhou's power comes from repeated streets, meals, evening atmosphere, and context.",
			},
			{
				title: "Pair with craft routes",
				body: "Anxi tea, Dehua porcelain, incense, and Nanyin can turn heritage into sensory travel.",
			},
		],
		sourceAnchors: [
			{
				label: "UNESCO World Heritage: Quanzhou",
				url: "https://whc.unesco.org/en/list/1561/",
			},
			{
				label: "UNESCO Digital Library: Quanzhou as world emporium",
				url: "https://unesdoc.unesco.org/ark:/48223/pf0000394185",
			},
		],
	},
	jingdezhen: {
		visualCaption:
			"Generated city image direction: hands on clay, kiln glow, porcelain whites, studio tables, glaze tests, and a quiet maker district.",
		editorialLead:
			"Jingdezhen is where Chinese culture becomes physical. The city is strongest when travelers meet clay, fire, glaze, risk, tools, studio practice, and global porcelain history rather than treating it as a shopping stop.",
		notGeneric: {
			title: "Not a ceramics mall",
			body: "A generic guide sends visitors to buy cups and try a workshop. A stronger route teaches how to look: material, firing, glaze, labor, taste, quality, and why porcelain changed global design.",
		},
		readTheCity: [
			{
				title: "Process over product",
				body: "The best visit shows failure, timing, heat, and hands before it shows finished objects.",
			},
			{
				title: "Global porcelain memory",
				body: "Jingdezhen connects local clay to royal courts, trade, collecting, imitation, taste, and museum histories across continents.",
			},
			{
				title: "Living studios",
				body: "Contemporary makers keep the city active; the route should include working spaces, not only museums.",
			},
		],
		signatureDays: [
			{
				title: "Day 1: Kiln and museum context",
				body: "Give the traveler the historical and technical frame before hands-on activity.",
			},
			{
				title: "Day 2: Studio and process",
				body: "Meet makers, see tools, understand glaze choices, and handle work with guidance.",
			},
			{
				title: "Day 3: Making or collecting",
				body: "Choose a hands-on session, a collector's eye route, or a contemporary maker neighborhood.",
			},
		],
		travelerFit: [
			{
				title: "Best for design travelers",
				body: "Strong for designers, architects, artists, collectors, museum patrons, and creative students.",
			},
			{
				title: "Good for object-led culture",
				body: "Works for travelers who prefer understanding culture through making and material decisions.",
			},
			{
				title: "Too niche for some first-timers",
				body: "Travelers with no interest in craft may need Beijing, Chengdu, or Chongqing first.",
			},
		],
		planningSignals: [
			{
				title: "Appointments matter",
				body: "Studio schedules, kiln timing, maker availability, and market days shape the real route.",
			},
			{
				title: "Avoid shopping-first copy",
				body: "Shopping can follow understanding, but should not be the reason the city exists in the route.",
			},
			{
				title: "Pair with tea",
				body: "Jingdezhen and Jingmai make a strong tea-and-porcelain material culture journey.",
			},
		],
		sourceAnchors: [
			{
				label: "UNESCO Creative Cities: Jingdezhen",
				url: "https://www.unesco.org/en/creative-cities/jingdezhen",
			},
			{
				label: "UNESCO Tentative List: Imperial Kiln Sites",
				url: "https://whc.unesco.org/en/tentativelists/6265/",
			},
		],
	},
	"jingmai-mountain": {
		visualCaption:
			"Generated city image direction: ancient tea forest, mist, village roofs, quiet paths, cups, hands, and mountain morning light.",
		editorialLead:
			"Jingmai is a slow tea landscape, not a quick scenic stop. Its meaning comes from ancient tea forests, village continuity, ecology, hospitality, and the discipline of letting the itinerary slow down.",
		notGeneric: {
			title: "Tea as landscape, not beverage",
			body: "A generic guide treats Jingmai as a tea tasting. A stronger route explains tea as forest, family, ritual, ecology, village governance, and a way of reading time.",
		},
		readTheCity: [
			{
				title: "Ancient tea forest",
				body: "Tea trees, forest ecology, village life, and understorey cultivation form the core of the destination.",
			},
			{
				title: "Hosted hospitality",
				body: "Meals and tea sessions should feel relational, not transactional. Hosting is part of the cultural experience.",
			},
			{
				title: "Quiet as value",
				body: "Mist, weather, slow mornings, and unstructured time are not empty space. They are the product.",
			},
		],
		signatureDays: [
			{
				title: "Day 1: Arrive slowly",
				body: "Do not force sightseeing. Settle into the village and adjust to mountain rhythm.",
			},
			{
				title: "Day 2: Forest and tea",
				body: "Walk the tea forest, taste with context, and connect leaf, ecology, household, and hospitality.",
			},
			{
				title: "Day 3: Weather and village time",
				body: "Protect a morning for mist, conversation, photos, and unstructured observation.",
			},
		],
		travelerFit: [
			{
				title: "Best for slow-luxury travelers",
				body: "Good for tea lovers, photographers, repeat China visitors, and people seeking decompression.",
			},
			{
				title: "Strong for aesthetics",
				body: "Appeals to travelers who choose a destination by atmosphere, texture, and quiet rather than famous sights.",
			},
			{
				title: "Filter patience",
				body: "Guests wanting nightlife, fast transfers, shopping, or dense sightseeing are weak fits.",
			},
		],
		planningSignals: [
			{
				title: "Buffer logistics",
				body: "Mountain roads, weather, and slower hospitality require time in the schedule.",
			},
			{
				title: "Ask about comfort tradeoffs",
				body: "The traveler must accept less convenience in exchange for stronger atmosphere.",
			},
			{
				title: "Use after a city",
				body: "Jingmai works well as decompression after Beijing, Chengdu, or Chongqing.",
			},
		],
		sourceAnchors: [
			{
				label: "UNESCO World Heritage: Jingmai Mountain",
				url: "https://whc.unesco.org/en/list/1665/",
			},
			{
				label: "WildChina: Jingmai Mountain",
				url: "https://wildchina.com/2023/11/chinas-newest-unesco-site-jingmai-mountain/",
			},
		],
	},
	"wudang-mountain": {
		visualCaption:
			"Generated city image direction: Taoist roofs in mist, mountain stairs, early light, quiet courtyards, and slow Taiji posture.",
		editorialLead:
			"Wudang should be approached as a Taoist mountain system. Its power comes from architecture, paths, clouds, breath, posture, silence, and the way philosophy becomes physical through movement.",
		notGeneric: {
			title: "Beyond kung-fu fantasy",
			body: "A generic guide sells temples and martial arts performance. A deeper Wudang route explains sacred architecture, internal practice, body awareness, and why the mountain's pace matters.",
		},
		readTheCity: [
			{
				title: "Sacred mountain sequence",
				body: "Gates, paths, courtyards, halls, peaks, and weather create a philosophical landscape.",
			},
			{
				title: "Taiji as interpretation",
				body: "A short practice session can make Taoist ideas legible through breath, weight, attention, and posture.",
			},
			{
				title: "Atmosphere over performance",
				body: "Early light, clouds, wet stone, and quiet walking are central, not decorative.",
			},
		],
		signatureDays: [
			{
				title: "Day 1: Temple orientation",
				body: "Introduce Taoist space, mountain pacing, and the difference between scenery and sacred structure.",
			},
			{
				title: "Day 2: Practice and ascent",
				body: "Combine an early route with a short Taiji or breath session and enough time for stillness.",
			},
			{
				title: "Day 3: Reflective route",
				body: "Leave space for weather, walking, and a quieter second reading of the mountain.",
			},
		],
		travelerFit: [
			{
				title: "Best for meaning-seeking travelers",
				body: "Strong for Taoism, philosophy, martial culture, and wellness-adjacent guests who want specificity.",
			},
			{
				title: "Good for repeat China visitors",
				body: "Wudang shifts the trip from cities and food into practice, silence, and mountain architecture.",
			},
			{
				title: "Filter mobility",
				body: "Stairs, early starts, and weather matter. The route must match the traveler's body.",
			},
		],
		planningSignals: [
			{
				title: "Start early",
				body: "Late starts weaken Wudang. Morning light and thinner crowds are part of the route.",
			},
			{
				title: "Ask practice interest",
				body: "Some travelers want real Taiji context; others only need a gentle cultural introduction.",
			},
			{
				title: "Pair with Beijing",
				body: "Beijing and Wudang create a strong contrast between state ritual and mountain cultivation.",
			},
		],
		sourceAnchors: [
			{
				label: "UNESCO World Heritage: Wudang Mountains",
				url: "https://whc.unesco.org/en/list/705/",
			},
			{
				label: "Hubei Foreign Affairs Office: Wudang Mountain",
				url: "https://www.fohb.gov.cn/info/2022-08/20220817112700_299.html",
			},
		],
	},
} satisfies Record<DestinationSlug, DestinationGuide>;
