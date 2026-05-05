import type { Category, City } from "@/lib/constants";
import { searchDestinationRag } from "@/lib/destination-rag";
import { destinationPositioningBySlug } from "@/lib/destination-positioning";
import { formatCategory, formatCity } from "@/lib/format";
import type { ExpertProfile } from "@/lib/mock-data";
import { createSupabaseAdminClient } from "@/lib/supabase/admin";
import { getServerSupabaseEnv } from "@/lib/supabase/env";

export type ConciergeKnowledge = {
	source: "supabase" | "static" | "none";
	notes: string[];
	experts: ExpertProfile[];
	itineraryHints: Array<{
		title: string;
		summary: string;
		city: string;
		days: number;
	}>;
	themeLabels: string[];
	audienceLabels: string[];
};

type DestinationAudienceFitRow = {
	destination_slug: string;
	audience_slug: string;
	fit_score: number;
	rationale: string;
	best_entry_angle: string;
	trip_length_hint: string | null;
	caution_note: string | null;
};

type DestinationComparisonRow = {
	left_destination_slug: string;
	right_destination_slug: string;
	audience_slug: string | null;
	comparison_question: string;
	short_answer: string;
	why_left: string;
	why_right: string;
	deciding_factor: string;
};

type ExpertRow = {
	display_name: string;
	city: string;
	categories: string[];
	headline: string;
	bio_en: string;
	languages: string[];
	hourly_rate_cents: number;
};

type ThemeRow = {
	slug: string;
	title: string;
	category: string;
	summary: string;
	default_priority: number;
};

type CardRow = {
	id: string;
	title: string;
	category: string;
	summary: string;
	visitor_hook: string;
	why_it_matters: string;
	best_for: string[];
	not_best_for: string[];
	source_urls: string[];
	appeal_score: number;
	destination_slug: string;
	theme_slug: string | null;
};

type AudienceFitRow = {
	knowledge_card_id: string;
	audience_slug: string;
	fit_score: number;
	rationale: string;
};

type ModuleRow = {
	slug: string;
	title: string;
	duration_hours: number;
	pace: "slow" | "balanced" | "immersive";
	summary: string;
	why_this_sequence: string;
	best_for: string[];
	conversion_cta: string;
	destination_slug: string;
};

type PositioningRow = {
	destination_slug: string;
	signature_hook: string;
	why_visit: string;
	sell_points: string[];
	best_for: string[];
	avoid_framing: string[];
	conversion_pitch: string;
};

type SellPointRow = {
	destination_slug: string;
	sort_order: number;
	title: string;
	body: string;
};

type RouteSeedRow = {
	destination_slug: string;
	sort_order: number;
	title: string;
	duration: string;
	body: string;
};

type FaqRow = {
	destination_slug: string;
	sort_order: number;
	question: string;
	answer: string;
};

function isCity(value: string): value is City {
	return [
		"beijing",
		"chengdu",
		"chongqing",
		"jingdezhen",
		"quanzhou",
		"jingmai_mountain",
		"wudang_mountain",
	].includes(value);
}

function isCategory(value: string): value is Category {
	return [
		"porcelain",
		"tea",
		"sichuan_food",
		"kung_fu",
		"calligraphy",
		"tcm",
		"photography",
		"maritime_silk_road",
	].includes(value);
}

function slugifyName(value: string) {
	return value
		.toLowerCase()
		.replace(/[^a-z0-9]+/g, "-")
		.replace(/^-+|-+$/g, "");
}

function mapExpertRow(row: ExpertRow): ExpertProfile | null {
	if (!isCity(row.city)) return null;

	const categories = row.categories.filter(isCategory);

	return {
		id: `supabase-${slugifyName(row.display_name)}`,
		slug: slugifyName(row.display_name),
		name: row.display_name,
		city: row.city,
		categories,
		headline: row.headline,
		bio: row.bio_en,
		languages: row.languages.map(
			(language) => language.charAt(0).toUpperCase() + language.slice(1),
		),
		hourlyRateCents: row.hourly_rate_cents,
		halfDayRateCents: row.hourly_rate_cents * 3,
		fullDayRateCents: row.hourly_rate_cents * 6,
		tags: categories.map((category) => formatCategory(category)),
		sampleSession: row.bio_en,
	};
}

function buildKeywordTokens(message: string) {
	return message
		.toLowerCase()
		.split(/[^a-z0-9]+/)
		.filter((token) => token.length >= 4);
}

function normalizeCitySlug(city: string) {
	return city.toLowerCase().replace(/\s+/g, "_");
}

function toStaticDestinationSlug(city: string) {
	const normalized = normalizeCitySlug(city);
	return normalized.replace(/_/g, "-") as keyof typeof destinationPositioningBySlug;
}

function formatStaticDestinationSlug(
	slug: keyof typeof destinationPositioningBySlug,
) {
	const databaseSlug = slug.replace(/-/g, "_");
	return isCity(databaseSlug) ? formatCity(databaseSlug) : slug.replace(/-/g, " ");
}

function buildStaticDestinationKnowledge({
	message,
	preferredCities,
}: {
	message: string;
	preferredCities: string[];
}): ConciergeKnowledge {
	const citySlugs = preferredCities
		.map(toStaticDestinationSlug)
		.filter((slug) => slug in destinationPositioningBySlug);

	if (citySlugs.length === 0) {
		return {
			source: "none",
			notes: [],
			experts: [],
			itineraryHints: [],
			themeLabels: [],
			audienceLabels: [],
		};
	}

	const rankedRecords = searchDestinationRag({
		message,
		preferredCities,
		limit: 10,
	});

	const notes =
		rankedRecords.length > 0
			? rankedRecords.map(
					(record) =>
						`${record.destination_name} ${record.content_type.replace(/_/g, " ")}: ${record.text}`,
				)
			: citySlugs.flatMap((slug) => {
					const positioning = destinationPositioningBySlug[slug];
					const cityLabel = formatStaticDestinationSlug(slug);
					return [
						`${cityLabel}: ${positioning.signatureHook} Why visit: ${positioning.whyVisit}`,
						...positioning.coreSellPoints
							.slice(0, 3)
							.map(
								(point) =>
									`${cityLabel} selling point: ${point.title}. ${point.body}`,
							),
						...positioning.faq
							.slice(0, 2)
							.map(
								(item) =>
									`${cityLabel} traveler FAQ: ${item.question} Answer direction: ${item.answer}`,
							),
					];
				});

	const itineraryHints = citySlugs.flatMap((slug) => {
		const positioning = destinationPositioningBySlug[slug];
		return positioning.routeSeeds.slice(0, 3).map((route) => ({
			title: route.title,
			city: formatStaticDestinationSlug(slug),
			days: Number.parseInt(route.duration, 10) || 1,
			summary: `${route.duration}: ${route.body}`,
		}));
	});

	const themeLabels = Array.from(
		new Set(
			rankedRecords.length > 0
				? rankedRecords
						.filter((record) => record.content_type === "sell_point")
						.map((record) => record.title)
				: citySlugs.flatMap((slug) =>
						destinationPositioningBySlug[slug].coreSellPoints.map(
							(point) => point.title,
						),
					),
		),
	).slice(0, 4);

	return {
		source: "static",
		notes: notes.slice(0, 12),
		experts: [],
		itineraryHints,
		themeLabels,
		audienceLabels: [],
	};
}

function shouldCompareCities(message: string, citySlugs: City[]) {
	const lowered = message.toLowerCase();
	return (
		citySlugs.length >= 2 ||
		lowered.includes(" or ") ||
		lowered.includes("vs") ||
		lowered.includes("versus") ||
		lowered.includes("compare") ||
		lowered.includes("better for")
	);
}

function rankCards({
	cards,
	themes,
	audienceFits,
	category,
	tokens,
}: {
	cards: CardRow[];
	themes: ThemeRow[];
	audienceFits: AudienceFitRow[];
	category?: Category;
	tokens: string[];
}) {
	const themeMap = new Map(themes.map((theme) => [theme.slug, theme]));

	return cards
		.map((card) => {
			let score = card.appeal_score * 10;
			const theme = card.theme_slug ? themeMap.get(card.theme_slug) : undefined;
			if (theme) {
				score += Math.max(0, 12 - theme.default_priority);
			}

			if (category) {
				const combined = [
					card.category,
					...(theme ? [theme.category] : []),
				].join(" ");
				if (combined.includes(category.replace(/_/g, " "))) {
					score += 18;
				}
			}

			const searchable = [
				card.title,
				card.summary,
				card.visitor_hook,
				card.why_it_matters,
				...(theme ? [theme.title, theme.summary] : []),
			]
				.join(" ")
				.toLowerCase();

			for (const token of tokens) {
				if (searchable.includes(token)) {
					score += 4;
				}
			}

			const fitSignals = audienceFits.filter(
				(fit) => fit.knowledge_card_id === card.id,
			);
			score += fitSignals.reduce((sum, fit) => sum + fit.fit_score * 3, 0);

			return {
				card,
				theme,
				score,
				fitSignals,
			};
		})
		.sort((a, b) => b.score - a.score);
}

export async function fetchConciergeKnowledge({
	message,
	preferredCities,
	category,
	audienceSlugs = [],
}: {
	message: string;
	preferredCities: string[];
	category?: Category;
	audienceSlugs?: string[];
}): Promise<ConciergeKnowledge> {
	const env = getServerSupabaseEnv();
	if (!env.success) {
		return buildStaticDestinationKnowledge({ message, preferredCities });
	}

	try {
		const supabase = createSupabaseAdminClient();
		const citySlugs = preferredCities.map(normalizeCitySlug).filter(isCity);
		const tokens = buildKeywordTokens(message);

		const destinationQuery = supabase
			.from("destinations")
			.select(
				"slug, name, category_focus, short_pitch, detail, highlights, pace_tags",
			)
			.limit(3);

		const expertQuery = supabase
			.from("experts")
			.select(
				"display_name, city, categories, headline, bio_en, languages, hourly_rate_cents",
			)
			.eq("status", "active")
			.limit(6);

		const itineraryQuery = supabase
			.from("sample_itineraries")
			.select("title, city, category, duration_days, summary, highlights")
			.limit(4);

		const themeQuery = supabase
			.from("destination_themes")
			.select("slug, title, category, summary, default_priority")
			.limit(24);

		const cardQuery = supabase
			.from("knowledge_cards")
			.select(
				"id, title, category, summary, visitor_hook, why_it_matters, best_for, not_best_for, source_urls, appeal_score, destination_slug, theme_slug",
			)
			.limit(64);

		const moduleQuery = supabase
			.from("itinerary_modules")
			.select(
				"slug, title, duration_hours, pace, summary, why_this_sequence, best_for, conversion_cta, destination_slug",
			)
			.limit(24);

		const positioningQuery = supabase
			.from("destination_positioning_briefs")
			.select(
				"destination_slug, signature_hook, why_visit, sell_points, best_for, avoid_framing, conversion_pitch",
			)
			.limit(12);

		const destinationPromise =
			citySlugs.length > 0
				? destinationQuery.in("slug", citySlugs)
				: destinationQuery;
		const expertPromise =
			citySlugs.length > 0 ? expertQuery.in("city", citySlugs) : expertQuery;
		const itineraryPromise =
			citySlugs.length > 0
				? itineraryQuery.in("city", citySlugs)
				: itineraryQuery;
		const themePromise =
			citySlugs.length > 0
				? themeQuery.in("destination_slug", citySlugs)
				: themeQuery;
		const cardPromise =
			citySlugs.length > 0
				? cardQuery.in("destination_slug", citySlugs)
				: cardQuery;
		const modulePromise =
			citySlugs.length > 0
				? moduleQuery.in("destination_slug", citySlugs)
				: moduleQuery;
		const positioningPromise =
			citySlugs.length > 0
				? positioningQuery.in("destination_slug", citySlugs)
				: positioningQuery;

		const [
			{ data: destinationRows, error: destinationError },
			{ data: expertRows, error: expertError },
			{ data: itineraryRows, error: itineraryError },
			{ data: themeRows, error: themeError },
			{ data: cardRows, error: cardError },
			{ data: moduleRows, error: moduleError },
			{ data: positioningRows, error: positioningError },
		] = await Promise.all([
			destinationPromise,
			expertPromise,
			itineraryPromise,
			themePromise,
			cardPromise,
			modulePromise,
			positioningPromise,
		]);

		if (
			destinationError ||
			expertError ||
			itineraryError ||
			themeError ||
			cardError ||
			moduleError ||
			positioningError
		) {
			return buildStaticDestinationKnowledge({ message, preferredCities });
		}

		const knowledgeCardIds = (cardRows ?? []).map((row) => row.id);
		let audienceFitRows: AudienceFitRow[] = [];
		let destinationAudienceFits: DestinationAudienceFitRow[] = [];
		let destinationComparisons: DestinationComparisonRow[] = [];
		let sellPointRows: SellPointRow[] = [];
		let routeSeedRows: RouteSeedRow[] = [];
		let faqRows: FaqRow[] = [];

		if (audienceSlugs.length > 0 && knowledgeCardIds.length > 0) {
			const { data } = await supabase
				.from("knowledge_card_audiences")
				.select("knowledge_card_id, audience_slug, fit_score, rationale")
				.in("knowledge_card_id", knowledgeCardIds)
				.in("audience_slug", audienceSlugs);
			audienceFitRows = (data ?? []) as AudienceFitRow[];
		}

		if (citySlugs.length > 0 && audienceSlugs.length > 0) {
			const { data } = await supabase
				.from("destination_audience_fits")
				.select(
					"destination_slug, audience_slug, fit_score, rationale, best_entry_angle, trip_length_hint, caution_note",
				)
				.in("destination_slug", citySlugs)
				.in("audience_slug", audienceSlugs);
			destinationAudienceFits = (data ?? []) as DestinationAudienceFitRow[];
		}

		if (shouldCompareCities(message, citySlugs) && citySlugs.length >= 2) {
			const comparisonQuery = supabase
				.from("destination_comparisons")
				.select(
					"left_destination_slug, right_destination_slug, audience_slug, comparison_question, short_answer, why_left, why_right, deciding_factor",
				)
				.or(
					`and(left_destination_slug.eq.${citySlugs[0]},right_destination_slug.eq.${citySlugs[1]}),and(left_destination_slug.eq.${citySlugs[1]},right_destination_slug.eq.${citySlugs[0]})`,
				)
				.limit(4);

			const comparisonResult =
				audienceSlugs.length > 0
					? await comparisonQuery.in("audience_slug", audienceSlugs)
					: await comparisonQuery;

			destinationComparisons = (comparisonResult.data ??
				[]) as DestinationComparisonRow[];
		}

		try {
			const sellPointQuery = supabase
				.from("destination_sell_point_cards")
				.select("destination_slug, sort_order, title, body")
				.order("sort_order", { ascending: true })
				.limit(24);
			const routeSeedQuery = supabase
				.from("destination_route_seeds")
				.select("destination_slug, sort_order, title, duration, body")
				.order("sort_order", { ascending: true })
				.limit(24);
			const faqQuery = supabase
				.from("destination_faqs")
				.select("destination_slug, sort_order, question, answer")
				.order("sort_order", { ascending: true })
				.limit(20);

			const [sellPointResult, routeSeedResult, faqResult] = await Promise.all([
				citySlugs.length > 0
					? sellPointQuery.in("destination_slug", citySlugs)
					: sellPointQuery,
				citySlugs.length > 0
					? routeSeedQuery.in("destination_slug", citySlugs)
					: routeSeedQuery,
				citySlugs.length > 0 ? faqQuery.in("destination_slug", citySlugs) : faqQuery,
			]);

			if (!sellPointResult.error) {
				sellPointRows = (sellPointResult.data ?? []) as SellPointRow[];
			}
			if (!routeSeedResult.error) {
				routeSeedRows = (routeSeedResult.data ?? []) as RouteSeedRow[];
			}
			if (!faqResult.error) {
				faqRows = (faqResult.data ?? []) as FaqRow[];
			}
		} catch {
			// These tables are additive V1 decision-support data. Ignore them until the migration is applied.
		}

		const destinationNotes = (destinationRows ?? [])
			.filter(
				(row) =>
					!category ||
					row.category_focus.includes(category) ||
					row.highlights.some((highlight: string) =>
						tokens.some((token) => highlight.toLowerCase().includes(token)),
					),
			)
			.map(
				(row) =>
					`${row.name}: ${row.short_pitch} Highlights: ${row.highlights.slice(0, 3).join(", ")}.`,
			);

		const positioningNotes = ((positioningRows ?? []) as PositioningRow[]).map(
			(row) => {
				const cityLabel = isCity(row.destination_slug)
					? formatCity(row.destination_slug)
					: row.destination_slug;
				return `${cityLabel}: ${row.signature_hook}. Why visit: ${row.why_visit} Sell points: ${row.sell_points.slice(0, 4).join(", ")}. Best for: ${row.best_for.slice(0, 3).join(", ")}.`;
			},
		);

		const experts = (expertRows ?? [])
			.map(mapExpertRow)
			.filter((row): row is ExpertProfile => Boolean(row));

		const rankedCards = rankCards({
			cards: (cardRows ?? []) as CardRow[],
			themes: (themeRows ?? []) as ThemeRow[],
			audienceFits: audienceFitRows,
			category,
			tokens,
		});

		const topCards = rankedCards.slice(0, 4);
		const themeLabels = Array.from(
			new Set(topCards.map((item) => item.theme?.title).filter(Boolean)),
		) as string[];
		const audienceLabels = Array.from(
			new Set(
				topCards.flatMap((item) =>
					item.fitSignals.map((fit) => fit.audience_slug.replace(/_/g, " ")),
				),
			),
		);

		const cardNotes = topCards.map(({ card, theme, fitSignals }) => {
			const audienceLabel =
				fitSignals.length > 0
					? ` Best for: ${fitSignals
							.map((fit) => fit.audience_slug.replace(/_/g, " "))
							.join(", ")}.`
					: "";
			return `${card.title}: ${card.visitor_hook} Why it matters: ${card.why_it_matters}.${theme ? ` Theme: ${theme.title}.` : ""}${audienceLabel}`;
		});

		const destinationFitNotes = destinationAudienceFits
			.sort((a, b) => b.fit_score - a.fit_score)
			.slice(0, 4)
			.map((fit) => {
				const cityLabel = isCity(fit.destination_slug)
					? formatCity(fit.destination_slug)
					: fit.destination_slug;
				const audienceLabel = fit.audience_slug.replace(/_/g, " ");
				const caution = fit.caution_note ? ` Caution: ${fit.caution_note}` : "";
				return `${cityLabel} fit for ${audienceLabel}: ${fit.rationale} Best angle: ${fit.best_entry_angle}.${fit.trip_length_hint ? ` Trip length: ${fit.trip_length_hint}.` : ""}${caution}`;
			});

		const comparisonNotes = destinationComparisons
			.slice(0, 3)
			.map((comparison) => {
				const leftCity = isCity(comparison.left_destination_slug)
					? formatCity(comparison.left_destination_slug)
					: comparison.left_destination_slug;
				const rightCity = isCity(comparison.right_destination_slug)
					? formatCity(comparison.right_destination_slug)
					: comparison.right_destination_slug;
				return `${comparison.comparison_question} Short answer: ${comparison.short_answer} ${leftCity}: ${comparison.why_left} ${rightCity}: ${comparison.why_right} Deciding factor: ${comparison.deciding_factor}`;
			});

		const sellPointNotes = sellPointRows.slice(0, 6).map((point) => {
			const cityLabel = isCity(point.destination_slug)
				? formatCity(point.destination_slug)
				: point.destination_slug;
			return `${cityLabel} selling point: ${point.title}. ${point.body}`;
		});

		const faqNotes = faqRows.slice(0, 4).map((faq) => {
			const cityLabel = isCity(faq.destination_slug)
				? formatCity(faq.destination_slug)
				: faq.destination_slug;
			return `${cityLabel} traveler FAQ: ${faq.question} Answer direction: ${faq.answer}`;
		});

		const rankedModules = ((moduleRows ?? []) as ModuleRow[])
			.map((module) => {
				let score = 0;
				if (
					tokens.some((token) => module.summary.toLowerCase().includes(token))
				) {
					score += 12;
				}
				score += module.best_for.some((item) =>
					audienceLabels.some((label) => item.toLowerCase().includes(label)),
				)
					? 10
					: 0;
				if (
					category &&
					module.summary.toLowerCase().includes(category.replace(/_/g, " "))
				) {
					score += 10;
				}
				return { module, score };
			})
			.sort((a, b) => b.score - a.score)
			.slice(0, 3);

		const itineraryHints = (itineraryRows ?? [])
			.filter(
				(row) =>
					!category ||
					row.category === category ||
					row.highlights.some((highlight: string) =>
						tokens.some((token) => highlight.toLowerCase().includes(token)),
					),
			)
			.map((row) => ({
				title: row.title,
				city: isCity(row.city) ? formatCity(row.city) : row.city,
				days: row.duration_days,
				summary: row.summary,
			}));

		for (const { module } of rankedModules) {
			itineraryHints.push({
				title: module.title,
				city: isCity(module.destination_slug)
					? formatCity(module.destination_slug)
					: module.destination_slug,
				days: Math.max(1, Math.round(module.duration_hours / 6)),
				summary: `${module.summary} ${module.why_this_sequence}`,
			});
		}

		for (const route of routeSeedRows.slice(0, 4)) {
			itineraryHints.push({
				title: route.title,
				city: isCity(route.destination_slug)
					? formatCity(route.destination_slug)
					: route.destination_slug,
				days: Number.parseInt(route.duration, 10) || 1,
				summary: `${route.duration}: ${route.body}`,
			});
		}

		const itineraryNotes = itineraryHints.map(
			(item) =>
				`${item.title} (${item.city}, ${item.days} days): ${item.summary}`,
		);

		const expertNotes = experts.map(
			(expert) =>
				`${formatCity(expert.city)} managed expert context: ${expert.headline}`,
		);

		const notes = [
			...positioningNotes,
			...comparisonNotes,
			...destinationFitNotes,
			...sellPointNotes,
			...destinationNotes,
			...cardNotes,
			...faqNotes,
			...itineraryNotes,
			...expertNotes,
		].slice(0, 12);

		if (
			notes.length === 0 &&
			experts.length === 0 &&
			itineraryHints.length === 0
		) {
			return buildStaticDestinationKnowledge({ message, preferredCities });
		}

		return {
			source: "supabase",
			notes,
			experts,
			itineraryHints,
			themeLabels,
			audienceLabels,
		};
	} catch {
		return buildStaticDestinationKnowledge({ message, preferredCities });
	}
}
