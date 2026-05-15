import type { DestinationSlug } from "@/lib/destination-positioning";

export type DestinationItineraryBlueprint = {
	duration: "3 days" | "5 days" | "7 days";
	title: string;
	bestFor: string;
	routeLogic: string;
	days: string[];
	conversionPrompt: string;
};

export const destinationItineraryBlueprints = {
	beijing: [
		{
			duration: "3 days",
			title: "Capital grammar for first-time China travelers",
			bestFor:
				"First-time visitors who need Beijing to explain imperial order without exhausting the trip.",
			routeLogic:
				"Start human-scale, move into ceremonial scale, then choose one deeper anchor instead of racing across the city.",
			days: [
				"Hutong soft landing, courtyard texture, local breakfast or noodles, and a northern dinner that explains Beijing as lived city.",
				"Central Axis and palace-space reading: gates, thresholds, courts, ceremonial movement, and why scale was political.",
				"Great Wall, Temple of Heaven, or a museum day selected by traveler profile: landscape defense, ritual order, or object history.",
			],
			conversionPrompt:
				"Ask the concierge to choose the third-day anchor based on whether the traveler cares more about architecture, ritual, photography, or history.",
		},
		{
			duration: "5 days",
			title: "Beijing with enough time to breathe",
			bestFor:
				"Culture-led couples, families, and older travelers who want depth but still need good pacing.",
			routeLogic:
				"Separate Beijing into neighborhood, axis, wall, ritual, and contemporary memory so the city does not become one heavy monument block.",
			days: [
				"Arrival, hotel area orientation, hutong walk, and a simple food route with no major museum pressure.",
				"Forbidden City or Central Axis route with contextual interpretation and a quiet courtyard meal afterward.",
				"Great Wall day planned for crowd avoidance, photography rhythm, and recovery time.",
				"Temple of Heaven, Lama Temple, or Confucian learning route paired with tea, calligraphy, or market texture.",
				"798, museum, diplomatic quarter, or slower neighborhood day depending on whether the traveler wants modern China or older Beijing.",
			],
			conversionPrompt:
				"Ask the concierge to balance wall logistics, palace tickets, walking tolerance, and one private expert-led hutong route.",
		},
		{
			duration: "7 days",
			title: "Beijing as the opening chapter of China",
			bestFor:
				"Travelers using Beijing as the foundation before Chengdu, Chongqing, Jingdezhen, Wudang, or Quanzhou.",
			routeLogic:
				"Use a full week to build historical grammar, then convert that understanding into a stronger multi-city route.",
			days: [
				"Arrival and local-scale Beijing: hutongs, neighborhood rhythm, simple meal, sleep recovery.",
				"Central Axis and palace reading with clear explanation of imperial space.",
				"Temple and ritual day: Temple of Heaven, altar logic, seasonal order, and ceremony.",
				"Great Wall or Ming Tombs route with landscape and defense framing.",
				"Museum or object-history day, chosen around art, archaeology, diplomacy, or family interest.",
				"Modern Beijing contrast: 798, contemporary neighborhoods, or urban planning conversation.",
				"Route handoff day: decide whether the next city should be food-soft Chengdu, visual Chongqing, craft Jingdezhen, Taoist Wudang, port Quanzhou, or tea-slow Jingmai.",
			],
			conversionPrompt:
				"Use /chat to turn Beijing into the first chapter of a two- or three-city China route instead of treating it as a standalone checklist.",
		},
	],
	chengdu: [
		{
			duration: "3 days",
			title: "Pandas, food, and the Chengdu rhythm",
			bestFor:
				"Families, food-first travelers, and first-timers who want China to feel warm and manageable.",
			routeLogic:
				"Use pandas as emotional entry, then let meals, parks, tea, and markets explain why Chengdu is loved.",
			days: [
				"Early panda visit, gentle lunch, snack walk, and a controlled Sichuan dinner calibrated for spice tolerance.",
				"Market ingredients, tea-house sitting, park life, and a slower neighborhood food route.",
				"Cooking class, Sichuan opera, Dujiangyan, or a countryside/craft extension depending on traveler type.",
			],
			conversionPrompt:
				"Ask the concierge to design a Chengdu route around spice tolerance, panda timing, family comfort, and one serious food evening.",
		},
		{
			duration: "5 days",
			title: "Food-first Chengdu with local ease",
			bestFor:
				"Travelers who understand culture through eating, sitting, conversation, and daily life.",
			routeLogic:
				"Make meals the route structure, not an afterthought; each day should have one flavor lesson and one slow-life moment.",
			days: [
				"Arrival, neighborhood orientation, simple noodles or snacks, and tea-house decompression.",
				"Pandas early, then lunch, park life, and an introductory hotpot or chuanchuan night.",
				"Market-to-table day: ingredients, cooking, ordering logic, and a food street without turning it into a tourist crawl.",
				"Dujiangyan, Qingcheng Mountain, or a soft countryside day if the traveler wants history and landscape.",
				"Flexible day for opera, massage, craft, cafe neighborhoods, or a food expert session before moving to Chongqing or Beijing.",
			],
			conversionPrompt:
				"Use /chat to decide whether Chengdu should stay soft and food-led or become the first half of a Chengdu-Chongqing contrast route.",
		},
		{
			duration: "7 days",
			title: "Sichuan soft landing and deeper appetite",
			bestFor:
				"Food travelers, families, and repeat visitors who want Chengdu as a base rather than a two-night stop.",
			routeLogic:
				"Build from emotional icons to deeper Sichuan: pandas, tea, spice, water systems, mountain edge, performance, and social ease.",
			days: [
				"Arrival and soft landing: tea, park, simple local meal.",
				"Pandas and first flavor map: noodles, snacks, hotpot logic.",
				"Market, cooking, and ordering day with a local food specialist.",
				"Dujiangyan and Qingcheng-style landscape/history day, paced for comfort.",
				"Tea-house culture, mahjong observation, bookshop/cafe neighborhoods, and slow social rhythm.",
				"Optional Leshan, countryside, craft, or wellness day depending on energy.",
				"Final Chengdu food review and handoff: either Chongqing for intensity or another culture city for contrast.",
			],
			conversionPrompt:
				"Ask the concierge to build a Sichuan week around heat level, panda priority, family needs, and whether Chongqing should be added.",
		},
	],
	chongqing: [
		{
			duration: "3 days",
			title: "The cinematic 8D mountain city",
			bestFor:
				"Visual travelers, creators, younger premium guests, and repeat China visitors who want urban intensity.",
			routeLogic:
				"Do not chase isolated viral stops. Build a physical sequence through levels, rails, bridges, stairs, river fog, and night food.",
			days: [
				"Vertical orientation: rail, stairs, river edge, viewpoints, and a route that makes the city's levels understandable.",
				"Night city sequence: bridges, skyline, old streets, hotpot steam, and controlled late-evening movement.",
				"Dazu, wartime memory, or deeper neighborhood day depending on whether the traveler wants culture, history, or more city texture.",
			],
			conversionPrompt:
				"Ask /chat to design a Chongqing night route that avoids random viral hopping and sequences viewpoints, transit, and hotpot properly.",
		},
		{
			duration: "5 days",
			title: "Chongqing beyond the viral reel",
			bestFor:
				"Travelers who like atmosphere but still need cultural depth, food, and slower recovery blocks.",
			routeLogic:
				"Alternate intense visual movement with deeper context so the city becomes readable, not just overwhelming.",
			days: [
				"Arrival and first vertical walk: rail, hillside streets, river orientation.",
				"Full 8D city day: Liziba-style transit moment, bridges, stairs, elevators, market texture, and night view.",
				"Hotpot and food structure day: spice, ordering, broth, neighborhood meals, and late-night rhythm.",
				"Dazu Rock Carvings or wartime Chongqing layer for historical depth.",
				"Slow city day: old neighborhoods, river ferry, cafe/tea pause, and final night photography.",
			],
			conversionPrompt:
				"Use the concierge to filter mobility, humidity tolerance, food heat level, and photography priorities before locking the route.",
		},
		{
			duration: "7 days",
			title: "Chongqing as urban spectacle and river culture",
			bestFor:
				"Photographers, city obsessives, food travelers, and guests who want China to feel visually unfamiliar.",
			routeLogic:
				"Extend beyond downtown spectacle into rock carvings, river memory, wartime layers, food, and neighborhood adaptation to topography.",
			days: [
				"Arrival and base orientation around one accessible neighborhood.",
				"Transit and levels day: rail, stairs, bridges, elevators, and street-to-roof transitions.",
				"Night route day: river reflections, skyline, cliffside buildings, and hotpot.",
				"Dazu Rock Carvings or heritage excursion for contrast with urban intensity.",
				"Wartime and river-history day to explain the city's strategic memory.",
				"Food and neighborhood day focused on local meals beyond hotpot.",
				"Flexible creator route: sunrise, fog, ferry, final viewpoint, and Chengdu or Zhangjiajie-style onward decision.",
			],
			conversionPrompt:
				"Ask /chat to decide whether a 7-day Chongqing route should stay urban or pair with Chengdu for emotional contrast.",
		},
	],
	quanzhou: [
		{
			duration: "3 days",
			title: "Maritime Silk Road and Hokkien memory",
			bestFor:
				"Southeast Asian Chinese diaspora, UNESCO travelers, and culture travelers who prefer layered cities over famous skylines.",
			routeLogic:
				"Read Quanzhou as a port civilization: trade, worship, migration, food, and old streets all have to be connected.",
			days: [
				"Old city and port orientation: UNESCO components, street texture, food, and Zayton/Maritime Silk Road context.",
				"Plural religion route: mosque, temples, shrines, churches, and ancestor-hall logic where relevant.",
				"Living culture day: zanhua, Nanyin, incense, tea, food memory, or Dehua/Anxi extension depending on profile.",
			],
			conversionPrompt:
				"Ask the concierge to adapt Quanzhou by ancestry, religion interest, food memory, and whether the traveler has Hokkien family roots.",
		},
		{
			duration: "5 days",
			title: "Quanzhou as connected China",
			bestFor:
				"Travelers from the Philippines, Malaysia, Singapore, Indonesia, Thailand, the Middle East, Europe, and heritage-focused North America.",
			routeLogic:
				"Give the city time to move from world heritage to family memory, craft, food, and sensory culture.",
			days: [
				"Arrival and old-city introduction: lanes, food, temples, and port vocabulary.",
				"UNESCO and maritime route: trade, officials, sailors, goods, language, and port-city logic.",
				"Religious coexistence day with interpretation for Islam, Buddhism, folk belief, Christianity, and ancestor practice.",
				"Living-culture day: zanhua, Nanyin, tea, incense, or food craft.",
				"Anxi tea, Dehua porcelain, coastal village, or family-root route depending on traveler identity.",
			],
			conversionPrompt:
				"Use /chat to choose between diaspora-root, UNESCO-depth, halal-aware, food-led, or craft-led Quanzhou versions.",
		},
		{
			duration: "7 days",
			title: "Quanzhou plus craft and ancestral routes",
			bestFor:
				"High-value cultural travelers who want a less obvious China story with strong expert interpretation.",
			routeLogic:
				"Build a full Fujian cultural chapter around port memory, Hokkien roots, tea, porcelain, incense, women-led zanhua, and music.",
			days: [
				"Old city arrival, food orientation, and first port-memory walk.",
				"UNESCO core route with maritime trade interpretation.",
				"Multi-faith route and Hokkien community memory.",
				"Zanhua, Nanyin, local food, and evening street culture.",
				"Anxi Tieguanyin tea day with mountain, processing, and tasting context.",
				"Dehua porcelain or Yongchun incense day for craft and material culture.",
				"Coastal village, ancestral hall, or custom family-root day before moving to Xiamen, Jingdezhen, or Beijing.",
			],
			conversionPrompt:
				"Ask the concierge to build a Quanzhou route around surname roots, language background, religious needs, and craft interests.",
		},
	],
	jingdezhen: [
		{
			duration: "3 days",
			title: "Porcelain as process, not shopping",
			bestFor:
				"Design travelers, artists, collectors, museum visitors, and culture travelers who like material stories.",
			routeLogic:
				"Teach the traveler how to look at porcelain before asking them to buy or make anything.",
			days: [
				"Kiln and museum context: clay, fire, glaze, labor, court taste, and global porcelain history.",
				"Studio and workshop day with maker conversations, tools, glaze tests, and market reading.",
				"Hands-on making, collector's eye session, or contemporary studio route depending on traveler interest.",
			],
			conversionPrompt:
				"Ask /chat to decide whether the traveler needs a maker-led, collector-led, design-led, or family-friendly Jingdezhen route.",
		},
		{
			duration: "5 days",
			title: "Jingdezhen for makers and collectors",
			bestFor:
				"People who want to understand craft ecosystems, not just visit a famous ceramics city.",
			routeLogic:
				"Move from historical authority to working process, then into contemporary studios, markets, and object judgment.",
			days: [
				"Arrival and porcelain grammar: what makes Jingdezhen important and how to recognize quality.",
				"Museum, kiln, and imperial-production context.",
				"Working studio day: forming, carving, glazing, firing risk, and maker economics.",
				"Market and collector route with guidance on taste, price logic, and what not to buy blindly.",
				"Hands-on, design studio, or countryside/material-source day depending on the traveler.",
			],
			conversionPrompt:
				"Use the concierge to plan appointments around studio access, market days, shipment needs, and whether the traveler wants to buy.",
		},
		{
			duration: "7 days",
			title: "Porcelain, tea, and design culture",
			bestFor:
				"Creative professionals and repeat China travelers who want a craft-intensive week.",
			routeLogic:
				"Give enough time for process, failure, repetition, collecting, contemporary design, and a possible tea or architecture pairing.",
			days: [
				"Orientation and porcelain history.",
				"Kiln, museum, and imperial system day.",
				"Workshop process day with hands and tools.",
				"Studio visits and contemporary maker district.",
				"Market, collecting, and shipping-practicality day.",
				"Hands-on class or private maker session with feedback.",
				"Pairing decision: continue to Jingmai for tea, Beijing for museums, or Quanzhou for maritime craft routes.",
			],
			conversionPrompt:
				"Ask /chat to build a craft week with appointment timing, object-buying rules, and the best onward city pairing.",
		},
	],
	"jingmai-mountain": [
		{
			duration: "3 days",
			title: "Ancient tea forest slow landing",
			bestFor:
				"Tea lovers, photographers, slow-luxury travelers, and people who need decompression after major cities.",
			routeLogic:
				"Protect quiet time. Jingmai fails if it is treated as a fast scenic stop.",
			days: [
				"Arrive slowly, settle into village rhythm, simple meal, and first tea without overprogramming.",
				"Ancient tea forest walk, ecology explanation, household tea session, and hosted meal.",
				"Mist morning, village observation, photography, second tasting, and departure buffer.",
			],
			conversionPrompt:
				"Ask the concierge to decide whether Jingmai should be a quiet ending, a tea-focused core, or a visual retreat after Chongqing or Beijing.",
		},
		{
			duration: "5 days",
			title: "Tea landscape and village continuity",
			bestFor:
				"Travelers willing to trade convenience for atmosphere, hospitality, and landscape depth.",
			routeLogic:
				"Use repeated tea sessions and weather changes to make tea feel like ecology, family, and time.",
			days: [
				"Arrival buffer and village orientation.",
				"Tea forest, ecology, cultivation, and tasting basics.",
				"Household hospitality, processing context, and comparison tasting.",
				"Neighboring village or viewpoint day, adjusted for weather and road conditions.",
				"Quiet morning, final tea session, and route handoff to city or airport.",
			],
			conversionPrompt:
				"Use /chat to balance road time, comfort expectations, photography, tea seriousness, and whether private hosting is needed.",
		},
		{
			duration: "7 days",
			title: "A contemplative tea week",
			bestFor:
				"Repeat China visitors, writers, photographers, tea buyers, and travelers building a slow China route.",
			routeLogic:
				"Make slowness the product: weather, cups, paths, hosts, village rhythms, and the difference between tea as beverage and tea as landscape.",
			days: [
				"Arrival and rest with no heavy program.",
				"Tea forest and ecological reading.",
				"Village life, hosted meal, and household tea practice.",
				"Processing, storage, taste comparison, and buyer-awareness session if relevant.",
				"Weather-buffer day for mist, photography, walking, or road delays.",
				"Neighboring village, market, or regional cultural extension.",
				"Quiet close, final tea, and onward decision to Chengdu, Jingdezhen, or Beijing.",
			],
			conversionPrompt:
				"Ask the concierge to build a Jingmai week only if the traveler values stillness, tea, hosting, and mountain logistics.",
		},
	],
	"wudang-mountain": [
		{
			duration: "3 days",
			title: "Taoist mountain and Taiji entry",
			bestFor:
				"Travelers interested in Taoism, martial culture, philosophy, wellness-adjacent travel, and mountain atmosphere.",
			routeLogic:
				"Combine sacred architecture, early light, walking, and a short practice session so Taoism becomes physical, not abstract.",
			days: [
				"Arrival, temple orientation, sacred mountain vocabulary, and early rest.",
				"Morning route through mountain architecture plus Taiji or breath practice with context.",
				"Reflective second route, quieter halls, weather time, and departure buffer.",
			],
			conversionPrompt:
				"Ask /chat to adapt Wudang around walking ability, practice interest, early-start tolerance, and whether the traveler wants philosophy or photography.",
		},
		{
			duration: "5 days",
			title: "Wudang without turning it into performance",
			bestFor:
				"Meaning-seeking travelers and repeat China visitors who want a slower spiritual register.",
			routeLogic:
				"Give enough time for mist, courtyards, stairs, fatigue, silence, and practice rather than rushing peak photos.",
			days: [
				"Arrival and base orientation with light temple context.",
				"Main mountain sequence: gates, halls, courtyards, and spatial meaning.",
				"Taiji/internal practice session, breath, posture, and Taoist body logic.",
				"Secondary walking route, quiet photography, and flexible weather buffer.",
				"Reflection day and onward pairing with Beijing, Chengdu, or Jingdezhen.",
			],
			conversionPrompt:
				"Use the concierge to avoid overclaiming martial arts and instead build an honest Taoist mountain route.",
		},
		{
			duration: "7 days",
			title: "Taoist practice, mountain weather, and stillness",
			bestFor:
				"Travelers who want a deeper retreat-like China segment, not only a scenic stop.",
			routeLogic:
				"Structure a week around repeated practice, architecture, walking, rest, and philosophical interpretation.",
			days: [
				"Arrival and quiet acclimatization.",
				"Main sacred architecture route.",
				"Introductory Taiji or internal practice with teacher context.",
				"Mountain walking and secondary temple day.",
				"Weather-buffer day for clouds, light, fatigue, or slower observation.",
				"Second practice or philosophy session tied to what the traveler has already seen.",
				"Departure reflection and route handoff to Beijing for ritual scale or Jingdezhen for material culture.",
			],
			conversionPrompt:
				"Ask /chat whether the traveler is suited for a full Wudang week or only needs a 3-day mountain chapter.",
		},
	],
} satisfies Record<DestinationSlug, DestinationItineraryBlueprint[]>;
