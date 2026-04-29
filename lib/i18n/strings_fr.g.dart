///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsFr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppFr app = _TranslationsAppFr._(_root);
	@override late final _TranslationsNavigationFr navigation = _TranslationsNavigationFr._(_root);
	@override late final _TranslationsCatalogFr catalog = _TranslationsCatalogFr._(_root);
	@override late final _TranslationsCommonFr common = _TranslationsCommonFr._(_root);
	@override late final _TranslationsLanguageFr language = _TranslationsLanguageFr._(_root);
	@override late final _TranslationsArchiveFeedFr archiveFeed = _TranslationsArchiveFeedFr._(_root);
	@override late final _TranslationsFilmsFr films = _TranslationsFilmsFr._(_root);
	@override late final _TranslationsNewsFeedFr newsFeed = _TranslationsNewsFeedFr._(_root);
	@override late final _TranslationsBioFr bio = _TranslationsBioFr._(_root);
	@override late final _TranslationsContactsFr contacts = _TranslationsContactsFr._(_root);
}

// Path: app
class _TranslationsAppFr extends TranslationsAppRu {
	_TranslationsAppFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'KISHCHANKA.ART';
	@override String get brandTagline => 'Collection des Beaux-Arts';
	@override String get logoMark => 'KA';
}

// Path: navigation
class _TranslationsNavigationFr extends TranslationsNavigationRu {
	_TranslationsNavigationFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get aboutAuthor => 'A propos de l\'auteur';
	@override String get news => 'Actualites';
	@override String get catalogOfWorks => 'Catalogue des oeuvres';
	@override String get films => 'Films';
	@override String get archive => 'Archive';
	@override String get contacts => 'Contacts';
}

// Path: catalog
class _TranslationsCatalogFr extends TranslationsCatalogRu {
	_TranslationsCatalogFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get workPrefix => 'Oeuvre';
	@override String get errorTitle => 'Echec du chargement des peintures';
	@override String errorWithDetails({required Object message}) => 'Echec du chargement des peintures. ${message}';
	@override late final _TranslationsCatalogDecadeFr decade = _TranslationsCatalogDecadeFr._(_root);
	@override late final _TranslationsCatalogPaintingNamesFr paintingNames = _TranslationsCatalogPaintingNamesFr._(_root);
	@override late final _TranslationsCatalogPaintingMediumsFr paintingMediums = _TranslationsCatalogPaintingMediumsFr._(_root);
}

// Path: common
class _TranslationsCommonFr extends TranslationsCommonRu {
	_TranslationsCommonFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get pageNotFound => 'Page introuvable';
	@override String get viewCatalog => 'VOIR LE CATALOGUE';
	@override String get learnMore => 'EN SAVOIR PLUS';
	@override late final _TranslationsCommonVideoFr video = _TranslationsCommonVideoFr._(_root);
}

// Path: language
class _TranslationsLanguageFr extends TranslationsLanguageRu {
	_TranslationsLanguageFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Langue';
	@override String get russian => 'Russe';
	@override String get english => 'Anglais';
	@override String get spanish => 'Espagnol';
	@override String get french => 'Francais';
	@override String get german => 'Allemand';
	@override String get belarusian => 'Bielorusse';
}

// Path: archiveFeed
class _TranslationsArchiveFeedFr extends TranslationsArchiveFeedRu {
	_TranslationsArchiveFeedFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Archives et publications';
	@override String get latestLabel => 'Derniere publication';
	@override String get moreLabel => 'Actualites et references';
	@override String get openArticle => 'Ouvrir l\'article';
	@override String get sourceLabel => 'Source';
	@override String yearLabel({required Object year}) => '${year}';
	@override late final _TranslationsArchiveFeedItemsFr items = _TranslationsArchiveFeedItemsFr._(_root);
}

// Path: films
class _TranslationsFilmsFr extends TranslationsFilmsRu {
	_TranslationsFilmsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Films & documentaires';
	@override String get subtitle => 'Archives video sur A. Kichtchenko';
	@override String get latestLabel => 'Film en vedette';
	@override String get sourceLabel => 'Source';
	@override String get instagramTitle => 'Instagram';
	@override String get instagramSubtitle => 'Videos courtes et stories';
	@override late final _TranslationsFilmsWatchOnFr watchOn = _TranslationsFilmsWatchOnFr._(_root);
	@override late final _TranslationsFilmsItemsFr items = _TranslationsFilmsItemsFr._(_root);
}

// Path: newsFeed
class _TranslationsNewsFeedFr extends TranslationsNewsFeedRu {
	_TranslationsNewsFeedFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Actualites';
	@override String get subtitle => 'Publications, expositions et evenements';
	@override String get emptyState => 'Pas encore d\'actualites. Revenez bientot.';
	@override String get errorTitle => 'Impossible de charger les actualites';
	@override String get retry => 'Reessayer';
	@override String get back => 'Retour aux actualites';
	@override String get sourceLabel => 'Source';
	@override String get readTimeLabel => 'Temps de lecture';
	@override String readTimeValue({required Object minutes}) => '${minutes} min';
	@override String get viewsLabel => 'Vues';
	@override String get publishedLabel => 'Publie';
}

// Path: bio
class _TranslationsBioFr extends TranslationsBioRu {
	_TranslationsBioFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get heroTitle => 'ART À L\'ÉCHELLE COSMIQUE';
	@override String get heroSubtitle => 'Un art qui efface les frontières entre le terrestre et l\'éternel. Artiste du Peuple de la République du Bélarus, créateur de la plus grande tapisserie du monde «La Tapisserie du Siècle».';
	@override String get heroBrandName => 'Alexandre Mikhaïlovitch Kichtchanka';
	@override String get name => 'Alexandre Mikhaïlovitch Kichtchanka (1933–1997)';
	@override String get tagline => 'Peintre. Philosophe. Monumentaliste. Fondateur du Réalisme Universel.';
	@override String get intro => 'Alexandre Kichtchanka est une figure de dimension renaissante dans l\'art du XXe siècle. Un homme qui réussit à transformer le fil souple de la tapisserie en une déclaration architecturale puissante, et les murs des villes en livres ouverts de significations philosophiques. Son oeuvre est un pont entre l\'archaïque et le cosmos, entre la douleur de la terre et la lumière de galaxies lointaines.';
	@override late final _TranslationsBioFeatureFr feature = _TranslationsBioFeatureFr._(_root);
	@override late final _TranslationsBioUniversalRealismFr universalRealism = _TranslationsBioUniversalRealismFr._(_root);
	@override late final _TranslationsBioTapestryFr tapestry = _TranslationsBioTapestryFr._(_root);
	@override late final _TranslationsBioChernobylFr chernobyl = _TranslationsBioChernobylFr._(_root);
	@override late final _TranslationsBioMosaicFr mosaic = _TranslationsBioMosaicFr._(_root);
	@override late final _TranslationsBioLegacyFr legacy = _TranslationsBioLegacyFr._(_root);
	@override String get quote => 'L\'art est un phénomène divin. Lui seul a le pouvoir d\'arrêter le temps. L\'art peut percer le mystère de l\'avenir et restaurer aussi le passé perdu.';
	@override String get quoteAuthor => '— Alexandre Kichtchanka';
	@override String get wikipediaLinkLabel => 'LIRE SUR WIKIPÉDIA';
}

// Path: contacts
class _TranslationsContactsFr extends TranslationsContactsRu {
	_TranslationsContactsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Contacts';
	@override String get tagline => 'Contactez l\'atelier.';
	@override String get phoneSectionLabel => 'Téléphone';
	@override String get phoneSectionHint => 'Appels et WhatsApp';
	@override String get instagramSectionLabel => 'Instagram';
	@override String get instagramHandle => '@kishchenko.art';
	@override String get vkSectionLabel => 'VK';
	@override String get vkHandle => 'aleksandrkishchenko';
	@override String get vkScanQrHint => 'Scannez le QR pour ouvrir VK';
	@override String get studioSectionTitle => 'Atelier de l\'auteur';
	@override String get studioAddress => 'Minsk, 44 rue Sourganov — 7ᵉ étage';
	@override String get openInOsm => 'OUVRIR DANS OPENSTREETMAP';
	@override String get mapAttribution => '© Contributeurs OpenStreetMap';
}

// Path: catalog.decade
class _TranslationsCatalogDecadeFr extends TranslationsCatalogDecadeRu {
	_TranslationsCatalogDecadeFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get all => 'Toutes';
	@override String get sixties => 'Années 60';
	@override String get seventies => 'Années 70';
	@override String get eighties => 'Années 80';
	@override String get nineties => 'Années 90';
}

// Path: catalog.paintingNames
class _TranslationsCatalogPaintingNamesFr extends TranslationsCatalogPaintingNamesRu {
	_TranslationsCatalogPaintingNamesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get id1958_1 => 'Périphérie. Vieux moulin';
	@override String get id1958_2 => 'Angelina';
	@override String get id1958_3 => 'La Toilette';
	@override String get id1959_1 => 'Portrait de femme';
	@override String get id1960_1 => 'Composition №1';
	@override String get id1960_2 => 'Portrait de femme dans les tons verts';
	@override String get id1960_3 => 'Première neige';
	@override String get id1960_4 => 'Femme dans un fauteuil';
	@override String get id1960_5 => 'Portrait du peintre Vladimir Ourichtchenko';
	@override String get id1960_6 => 'Fille au ruban';
	@override String get id1960_7 => 'Portrait de femme';
	@override String get id1960_8 => 'Portrait de femme';
	@override String get id1960_9 => 'L\'Attente';
	@override String get id1962_1 => 'Nordique (Femme du nord)';
	@override String get id1965_1 => 'Portrait de femme';
	@override String get id1965_2 => 'Garçon de cirque';
	@override String get id1965_3 => 'Tentation';
	@override String get id1967_1 => 'Zoïa Litvinova';
	@override String get id1967_2 => 'Deux vies';
	@override String get id1968_1 => 'Nature morte aux poires';
	@override String get id1969_1 => 'Ange';
	@override String get id1970_1 => 'L\'Institutrice';
	@override String get id1970_2 => 'Le dernier de Sébastopol';
	@override String get id1972_1 => 'Portrait de Genia Moussinskaïa';
	@override String get id1974_1 => 'Jeune fille en costume russe';
	@override String get id1975_1 => 'Le Premier-né';
	@override String get id1976_1 => 'Jeune fille en rouge et or (Raisins verts)';
	@override String get id1979_1 => 'Mère et enfant';
	@override String get id1979_2 => 'Natacha';
	@override String get id1979_3 => 'L\'Assassinat de la famille Gromov. Action 1943. Taman.';
	@override String get id1979_4 => 'Esquisse pour l\'œuvre "La Douleur du poète"';
	@override String get id1979_5 => 'Joie. Maternité';
	@override String get id1980_1 => 'Fragment pour le tableau "Miel"';
	@override String get id1980_2 => 'Portrait de maman';
	@override String get id1980_3 => 'Nina';
	@override String get id1980_4 => 'Natacha Martchenko';
	@override String get id1980_5 => 'Natacha';
	@override String get id1981_1 => 'Réflexion';
	@override String get id1981_2 => 'Portrait d\'Elena Obraztsova';
	@override String get id1982_1 => 'Autoportrait';
	@override String get id1982_2 => 'Adam et Ève';
	@override String get id1982_3 => 'Profanation du temple';
	@override String get id1982_4 => 'Obscurantistes';
	@override String get id1982_5 => 'Tournesols';
	@override String get id1982_6 => 'Paysage';
	@override String get id1983_1 => 'Madone';
	@override String get id1983_2 => 'Complot (Le Serment des francs-maçons)';
	@override String get id1983_3 => 'Nina';
	@override String get id1983_4 => 'Portrait de Maria Bieșu';
	@override String get id1983_5 => 'L\'Appel de la mer';
	@override String get id1983_6 => 'Pleurs';
	@override String get id1983_7 => 'Natacha';
	@override String get id1984_1 => 'Nina';
	@override String get id1984_2 => 'Nina';
	@override String get id1985_1 => 'Oncle Vania';
	@override String get id1985_2 => 'Fille au chapeau rouge';
	@override String get id1985_3 => 'Figure féminine. Natacha Tatarenko';
	@override String get id1985_4 => 'Portrait d\'homme';
	@override String get id1985_5 => 'Douche d\'été';
	@override String get id1986_1 => 'Portrait de fille';
	@override String get id1986_2 => 'Portrait du chef opérateur A. Abadovski';
	@override String get id1986_3 => 'Derniers jours de septembre';
	@override String get id1986_4 => 'Portrait de Bouchtchik';
	@override String get id1986_5 => 'Portrait de Natacha Martchenko';
	@override String get id1987_1 => 'Il vivra. Tchernobyl';
	@override String get id1987_2 => 'Portrait de femme';
	@override String get id1988_1 => 'Portrait de Macha';
	@override String get id1988_2 => 'Tête d\'homme';
	@override String get id1988_3 => 'Profil';
	@override String get id1988_4 => 'La Marcheuse';
	@override String get id1989_1 => 'Au bord du Don';
	@override String get id1989_2 => 'Matin';
	@override String get id1989_3 => 'Portrait de la peintre Tamara Kirtchina';
	@override String get id1989_4 => 'Nu dans l\'espace musique';
	@override String get id1989_5 => 'La Marcheuse (L\'Univers)';
	@override String get id1989_6 => 'Nina';
	@override String get id1989_7 => 'Le frère et la sœur Ielkine';
	@override String get id1989_8 => 'Nina';
	@override String get id1989_9 => 'Nu';
	@override String get id1990_1 => 'Dans l\'espace (Nu)';
	@override String get id1990_2 => 'Dons des planètes';
	@override String get id1990_3 => 'Zoïa';
	@override String get id1990_4 => 'Portrait d\'homme';
	@override String get id1990_5 => 'Sur le balcon';
	@override String get id1991_1 => 'Fille au miel (L\'Univers)';
	@override String get id1991_2 => 'Rêve';
	@override String get id1991_3 => 'L\'Éternelle';
	@override String get id1992_1 => 'Portrait au coquillage marin';
	@override String get id1992_2 => 'Satyre et Nymphe';
	@override String get id1992_3 => 'Garçon au coq';
	@override String get id1992_4 => 'Nina et Maxime';
	@override String get id1992_5 => 'Moujik russe';
	@override String get id1992_6 => 'Portrait de Franz Koch';
	@override String get id1992_7 => 'Nina';
	@override String get id1992_8 => 'Olga';
	@override String get id1992_9 => 'Ne fais pas de bêtises, Maxime !';
	@override String get id1992_10 => 'Tapisserie "Tournesols"';
	@override String get id1993_1 => 'L\'Éternel';
	@override String get id1993_2 => 'Portrait de la sculptrice Lena Kharaberiouch';
	@override String get id1993_3 => 'L\'Apothicaire';
	@override String get id1993_4 => 'Olia';
	@override String get id1993_5 => 'Mère et enfant';
	@override String get id1993_6 => 'Christ';
	@override String get id1993_7 => 'Natacha';
	@override String get id1993_8 => 'Portrait d\'une inconnue';
	@override String get id1993_9 => 'Roman';
	@override String get id1994_1 => 'Sous la constellation du Lion';
	@override String get id1994_2 => 'Portrait de Zoïa';
	@override String get id1994_3 => 'Cour abandonnée';
	@override String get id1994_4 => 'Natacha';
	@override String get id1994_5 => 'Chanson';
	@override String get id1994_6 => 'Fille à la nature morte aux pommes';
	@override String get id1994_7 => 'Celle qui crie';
	@override String get id1994_8 => 'Natacha';
	@override String get id1994_9 => 'Bacchanale';
	@override String get id1995_1 => 'Petit rêveur';
	@override String get id1995_2 => 'Ma Patrie';
	@override String get id1995_3 => 'Nu';
	@override String get id1995_4 => 'Olga Koltakova';
	@override String get id1995_5 => 'Tamara Kirtchina de dos';
	@override String get id1995_6 => 'Olia';
	@override String get id1995_7 => 'Tristesse';
	@override String get id1995_8 => 'Portrait de fille';
	@override String get id1995_9 => 'L\'Univers';
	@override String get id1995_10 => 'Liocha';
	@override String get id1995_11 => 'Portrait de Rostikov';
	@override String get id1995_12 => 'La critique d\'art Nadia';
	@override String get id1995_13 => 'Mélodie';
	@override String get id1995_14 => 'Tania';
	@override String get id1995_15 => 'Esquisse pour le tableau «Portrait de Nina»';
	@override String get id1995_16 => 'Nature morte';
	@override String get id1995_17 => 'Tapisserie "Mer" ("Vague")';
	@override String get id1996_1 => 'Nature morte aux pommes';
	@override String get id1996_2 => 'Nu';
	@override String get id1996_3 => 'Maxime avec une pastèque';
	@override String get id1996_4 => 'Hymne (Extase)';
	@override String get id1996_5 => 'Nina';
	@override String get id1996_6 => 'Inna';
	@override String get id1996_7 => 'Alla Astakhovitch';
	@override String get id1996_8 => 'Lena';
	@override String get id1996_9 => 'Portrait de femme (Nina №1)';
	@override String get id1996_10 => 'L\'Univers';
	@override String get id1996_11 => 'Naviguant dans une barque';
	@override String get id1996_12 => 'Portrait de femme au châle';
	@override String get id1996_13 => 'Maman';
	@override String get id1996_14 => 'Philarète de Minsk';
	@override String get id1996_15 => 'Nature morte dans l\'espace';
	@override String get id1996_16 => 'Portrait de Koutchinski';
	@override String get id1996_17 => 'Portrait de femme';
	@override String get id1996_18 => 'Mon Univers';
	@override String get id1997_1 => 'Ivan';
	@override String get id1997_2 => 'Portrait de l\'architecte Vladimir Salazkine';
	@override String get id1997_3 => 'La Guerre des mondes (dernière œuvre)';
	@override String get id1997_4 => 'Autoportrait';
	@override String get id1997_5 => 'Été à Bogoutchar';
	@override String get id1997_6 => 'Deux veuves';
	@override String get idunknown_1 => 'Crue';
	@override String get idunknown_2 => 'Portrait de femme';
	@override String get idunknown_3 => 'Épines bleues';
	@override String get idunknown_4 => 'Nina';
	@override String get idunknown_5 => 'Nina';
}

// Path: catalog.paintingMediums
class _TranslationsCatalogPaintingMediumsFr extends TranslationsCatalogPaintingMediumsRu {
	_TranslationsCatalogPaintingMediumsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get canvasOil => 'Toile, huile';
	@override String get hardboardOil => 'Isorel, huile';
	@override String get cardboard => 'Carton';
	@override String get woolLinenWeaving => 'Laine, lin, tissage';
}

// Path: common.video
class _TranslationsCommonVideoFr extends TranslationsCommonVideoRu {
	_TranslationsCommonVideoFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get loadError => 'Echec du chargement du flux vidéo';
	@override String get openExternally => 'Ouvrir en externe';
}

// Path: archiveFeed.items
class _TranslationsArchiveFeedItemsFr extends TranslationsArchiveFeedItemsRu {
	_TranslationsArchiveFeedItemsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsArchiveFeedItemsBoguchar2026Fr boguchar2026 = _TranslationsArchiveFeedItemsBoguchar2026Fr._(_root);
	@override late final _TranslationsArchiveFeedItemsPriorbankChtobyChuvstvovatFr priorbankChtobyChuvstvovat = _TranslationsArchiveFeedItemsPriorbankChtobyChuvstvovatFr._(_root);
	@override late final _TranslationsArchiveFeedItemsNitiSudbyFr nitiSudby = _TranslationsArchiveFeedItemsNitiSudbyFr._(_root);
	@override late final _TranslationsArchiveFeedItemsBoguchar2024Fr boguchar2024 = _TranslationsArchiveFeedItemsBoguchar2024Fr._(_root);
	@override late final _TranslationsArchiveFeedItemsBelgazprombankKraskiPobedyFr belgazprombankKraskiPobedy = _TranslationsArchiveFeedItemsBelgazprombankKraskiPobedyFr._(_root);
	@override late final _TranslationsArchiveFeedItemsNebaZiamljaFr nebaZiamlja = _TranslationsArchiveFeedItemsNebaZiamljaFr._(_root);
}

// Path: films.watchOn
class _TranslationsFilmsWatchOnFr extends TranslationsFilmsWatchOnRu {
	_TranslationsFilmsWatchOnFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get youtube => 'Voir sur YouTube';
	@override String get googleDrive => 'Voir sur Google Drive';
	@override String get instagram => 'Ouvrir sur Instagram';
}

// Path: films.items
class _TranslationsFilmsItemsFr extends TranslationsFilmsItemsRu {
	_TranslationsFilmsItemsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsFilmsItemsIspovedVremeniFr ispovedVremeni = _TranslationsFilmsItemsIspovedVremeniFr._(_root);
	@override late final _TranslationsFilmsItemsAleksandrKishchenkoFr aleksandrKishchenko = _TranslationsFilmsItemsAleksandrKishchenkoFr._(_root);
	@override late final _TranslationsFilmsItemsVoronezhKramskoyExhibitionFr voronezhKramskoyExhibition = _TranslationsFilmsItemsVoronezhKramskoyExhibitionFr._(_root);
	@override late final _TranslationsFilmsItemsMastersOfSovietArt1988Fr mastersOfSovietArt1988 = _TranslationsFilmsItemsMastersOfSovietArt1988Fr._(_root);
	@override late final _TranslationsFilmsItemsBogucharLectureFr bogucharLecture = _TranslationsFilmsItemsBogucharLectureFr._(_root);
	@override late final _TranslationsFilmsItemsCulturalCodesTapestriesFr culturalCodesTapestries = _TranslationsFilmsItemsCulturalCodesTapestriesFr._(_root);
	@override late final _TranslationsFilmsItemsTapestryOfCenturyMinskFr tapestryOfCenturyMinsk = _TranslationsFilmsItemsTapestryOfCenturyMinskFr._(_root);
	@override late final _TranslationsFilmsItemsChernobylTapestryFactsFr chernobylTapestryFacts = _TranslationsFilmsItemsChernobylTapestryFactsFr._(_root);
	@override late final _TranslationsFilmsItemsKishchenkoReel1Fr kishchenkoReel1 = _TranslationsFilmsItemsKishchenkoReel1Fr._(_root);
}

// Path: bio.feature
class _TranslationsBioFeatureFr extends TranslationsBioFeatureRu {
	_TranslationsBioFeatureFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'HÉRITAGE D\'ENVERGURE MONDIALE';
	@override String get body => 'Cette collection réunit les oeuvres d\'un maître exceptionnel dont l\'art a changé à jamais la perception de la peinture monumentale et de la tapisserie. Des mosaïques grandioses devenues le code visuel de Minsk jusqu\'à la célèbre Tapisserie du Siècle et à l\'oeuvre Tchernobyl qui orne le siège des Nations Unies à New York. Chaque oeuvre de Kichtchanka est un traité philosophique sur le lien des époques, le cosmos et l\'esprit humain indestructible.';
	@override String get cta => 'EXPLORER LA COLLECTION';
	@override String get worksValue => '500+';
	@override String get worksLabel => 'Oeuvres d\'art à travers le monde';
	@override String get panelsValue => '6+';
	@override String get panelsLabel => 'Panneaux monumentaux à Minsk';
	@override String get guinnessValue => '1';
	@override String get guinnessLabel => 'Record Guinness dans l\'art';
}

// Path: bio.universalRealism
class _TranslationsBioUniversalRealismFr extends TranslationsBioUniversalRealismRu {
	_TranslationsBioUniversalRealismFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fondateur du Réalisme Universel';
	@override String get body => 'Kichtchanka ne se contentait pas de représenter la réalité — il créait un nouveau système de coordonnées, qu\'il appelait le Réalisme Universel. Au coeur de sa méthode réside la conviction que l\'artiste est un tisserand du temps, tenu de relier le passé et l\'avenir. Son art dépassa les frontières nationales, opérant avec les catégories du drame humain mondial. Pour Kichtchanka, l\'homme est un demi-dieu dont les actes résonnent à l\'échelle de l\'Univers. Dans ses oeuvres, les ombres deviennent des formes autonomes, et la couleur une musique cosmique soumise à un ordre supérieur strict.';
}

// Path: bio.tapestry
class _TranslationsBioTapestryFr extends TranslationsBioTapestryRu {
	_TranslationsBioTapestryFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'La Tapisserie du Siècle: Le Sommet du Tissage Mondial';
	@override String get intro => 'Alexandre Kichtchanka est entré dans l\'histoire en tant qu\'auteur de la plus grande tapisserie du monde, officiellement inscrite dans le Livre Guinness des records.';
	@override String get scaleLabel => 'Dimensions';
	@override String get scale => 'Une oeuvre mesurant 19 × 14 mètres (environ 300 m²), pesant plus d\'une tonne.';
	@override String get conceptLabel => 'Concept';
	@override String get concept => 'Une trame grandiose de l\'histoire, où s\'entrecroisent les destins de 80 personnalités emblématiques — du Christ et de la Madone à Churchill, Castro et Gorbatchev.';
	@override String get meaningLabel => 'Signification';
	@override String get meaning => 'Cette oeuvre est un temple, au centre duquel se déroule l\'éternel conflit entre création et destruction. Elle a été reconnue patrimoine national de la Biélorussie.';
}

// Path: bio.chernobyl
class _TranslationsBioChernobylFr extends TranslationsBioChernobylRu {
	_TranslationsBioChernobylFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tchernobyl: La Voix d\'une Nation dans les Salles de l\'ONU';
	@override String get body => 'L\'une des oeuvres les plus bouleversantes du maître est la tapisserie Tchernobyl (1991). Offerte aux Nations Unies, elle orne encore aujourd\'hui le siège de l\'ONU à New York. Quand le monde vit cette oeuvre, le Secrétaire général de l\'ONU Javier Pérez de Cuéllar la compara à la Guernica de Picasso. Pour Kichtchanka, cette tapisserie n\'était pas seulement un mémorial à la tragédie, mais les yeux de la Biélorussie — un avertissement planétaire sur la fragilité de la vie, tissé par les mains de grandes tisserandes biélorusses.';
}

// Path: bio.mosaic
class _TranslationsBioMosaicFr extends TranslationsBioMosaicRu {
	_TranslationsBioMosaicFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Le Visage de la Ville: Les Mosaïques Vostok';
	@override String get intro => 'Kichtchanka a forgé le code visuel du Minsk moderne. Ses célèbres mosaïques sur les immeubles d\'habitation du quartier Vostok-1 sont devenues la carte de visite de la capitale.';
	@override String get panelsLabel => 'Quatre oeuvres monumentales';
	@override String get panels => 'Ville-guerrière, Ville de la Science, Ville de la Culture et Ville-bâtisseuse.';
	@override String get panelsMeaning => 'Ces oeuvres ont transformé une construction typique en espace artistique, où le triomphe de l\'esprit humain est célébré à travers la smalt et la pierre.';
}

// Path: bio.legacy
class _TranslationsBioLegacyFr extends TranslationsBioLegacyRu {
	_TranslationsBioLegacyFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Héritage';
	@override String get body => 'Alexandre Kichtchanka a laissé derrière lui non seulement des toiles conservées à la Galerie Tretiakov et dans des collections privées de dirigeants mondiaux (B. Clinton, F. Mitterrand), mais aussi toute une école de tapisserie monumentale biélorusse. Le Combinat des arts décoratifs et appliqués de Borisov, où furent créées ses grandes tapisseries, porte aujourd\'hui son nom.';
}

// Path: archiveFeed.items.boguchar2026
class _TranslationsArchiveFeedItemsBoguchar2026Fr extends TranslationsArchiveFeedItemsBoguchar2026Ru {
	_TranslationsArchiveFeedItemsBoguchar2026Fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Visite guidee «L\'histoire de la vie de M. A. Kichtchenko»';
	@override String get excerpt => 'Le 19 fevrier 2026, le musee de Boguchar a accueilli une visite guidee destinee aux eleves de l\'ecole du village de Diatchenkovo (mouvement «Pervyh»), dediee a la decouverte de la vie et de l\'oeuvre du celebre artiste Alexandre Mikhailovitch Kichtchenko.';
}

// Path: archiveFeed.items.priorbankChtobyChuvstvovat
class _TranslationsArchiveFeedItemsPriorbankChtobyChuvstvovatFr extends TranslationsArchiveFeedItemsPriorbankChtobyChuvstvovatRu {
	_TranslationsArchiveFeedItemsPriorbankChtobyChuvstvovatFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Exposition «Pour ressentir» — la collection de la Priorbank';
	@override String get excerpt => 'La Priorbank presente pour la premiere fois au public sa collection d\'entreprise de peinture bielorusse des annees 1960 a 2000, constituee depuis plus de 30 ans. L\'exposition «Pour ressentir», au palais Roumiantsev-Paskevitch, se tient du 10 avril au 7 juin et reunit plus de 70 oeuvres uniques, parmi lesquelles trois tableaux d\'Alexandre Kichtchenko.';
}

// Path: archiveFeed.items.nitiSudby
class _TranslationsArchiveFeedItemsNitiSudbyFr extends TranslationsArchiveFeedItemsNitiSudbyRu {
	_TranslationsArchiveFeedItemsNitiSudbyFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Alexandre Kichtchenko. Les fils du destin';
	@override String get excerpt => 'Le musee a accueilli l\'inauguration solennelle de l\'exposition «Alexandre Kichtchenko. Les fils du destin» (12+), consacree a l\'oeuvre de l\'eminent artiste bielorusse, originaire du district de Boguchar dans la region de Voronej. L\'exposition est organisee a l\'occasion du 300e anniversaire du gouvernorat de Voronej et s\'inscrit dans le cadre des echanges culturels de la region avec la Republique du Belarus.';
}

// Path: archiveFeed.items.boguchar2024
class _TranslationsArchiveFeedItemsBoguchar2024Fr extends TranslationsArchiveFeedItemsBoguchar2024Ru {
	_TranslationsArchiveFeedItemsBoguchar2024Fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Visite guidee «L\'histoire de la vie de A. M. Kichtchenko»';
	@override String get excerpt => 'Alexandre Mikhailovitch Kichtchenko fut l\'une des figures les plus talentueuses de la region de Boguchar — artiste du peuple de la Republique du Belarus et citoyen d\'honneur du district de Boguchar. Membre de l\'Union des artistes de l\'URSS et laureat du Prix d\'Etat, il a laisse une empreinte marquante dans l\'histoire de l\'art.';
}

// Path: archiveFeed.items.belgazprombankKraskiPobedy
class _TranslationsArchiveFeedItemsBelgazprombankKraskiPobedyFr extends TranslationsArchiveFeedItemsBelgazprombankKraskiPobedyRu {
	_TranslationsArchiveFeedItemsBelgazprombankKraskiPobedyFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'La Belgazprombank invite a l\'exposition «Les couleurs de la Grande Victoire»';
	@override String get excerpt => '28 juin 2024. A la veille du 80e anniversaire de la liberation du Belarus de l\'occupation nazie allemande, le hall du siege de la Belgazprombank a accueilli solennellement l\'exposition thematique «Les couleurs de la Grande Victoire». Elle reunit des oeuvres d\'artistes bielorusses qui ont connu les horreurs de la guerre de premiere main — A. Kichtchenko, V. Protaseni, I. Stassevitch, N. Tchourabo, I. Rey, P. Daneliya et d\'autres.';
}

// Path: archiveFeed.items.nebaZiamlja
class _TranslationsArchiveFeedItemsNebaZiamljaFr extends TranslationsArchiveFeedItemsNebaZiamljaRu {
	_TranslationsArchiveFeedItemsNebaZiamljaFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Le ciel et la terre d\'Alexandre Kichtchenko';
	@override String get excerpt => 'Le 6 mai 2023, le Musee national d\'art de la Republique du Belarus inaugure l\'exposition «Le ciel et la terre d\'Alexandre Kichtchenko», consacree a l\'ampleur de sa pensee artistique et a l\'importance de l\'heritage du maitre.';
}

// Path: films.items.ispovedVremeni
class _TranslationsFilmsItemsIspovedVremeniFr extends TranslationsFilmsItemsIspovedVremeniRu {
	_TranslationsFilmsItemsIspovedVremeniFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'A. Kichtchenko. Confession du Temps';
	@override String get excerpt => 'Documentaire sur Alexandre Mikhailovitch Kichtchenko (1933–1997), Artiste du Peuple du Belarus et auteur de la plus grande tapisserie du monde. Realisation : V. Korolev ; prise de vues et montage : E. Milkovski.';
}

// Path: films.items.aleksandrKishchenko
class _TranslationsFilmsItemsAleksandrKishchenkoFr extends TranslationsFilmsItemsAleksandrKishchenkoRu {
	_TranslationsFilmsItemsAleksandrKishchenkoFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Alexandre Kichtchenko';
	@override String get excerpt => 'Portrait televise consacre a la vie et a l\'oeuvre d\'Alexandre Kichtchenko : les fresques monumentales de Minsk, la «Tapisserie du Siecle» et la philosophie du realisme universel du maitre.';
}

// Path: films.items.voronezhKramskoyExhibition
class _TranslationsFilmsItemsVoronezhKramskoyExhibitionFr extends TranslationsFilmsItemsVoronezhKramskoyExhibitionRu {
	_TranslationsFilmsItemsVoronezhKramskoyExhibitionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Exposition d\'A. M. Kichtchenko au Musee des beaux-arts I. N. Kramskoi de Voronej';
	@override String get excerpt => 'Reportage sur l\'exposition des oeuvres du celebre artiste bielorusse Alexandre Kichtchenko au Musee regional des beaux-arts I. N. Kramskoi de Voronej.';
}

// Path: films.items.mastersOfSovietArt1988
class _TranslationsFilmsItemsMastersOfSovietArt1988Fr extends TranslationsFilmsItemsMastersOfSovietArt1988Ru {
	_TranslationsFilmsItemsMastersOfSovietArt1988Fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'A. Kichtchenko. Serie «Maitres de l\'art sovietique». Album de 1988';
	@override String get excerpt => 'Apercu video de l\'album de 1988 de la serie «Maitres de l\'art sovietique», consacre a la peinture et aux oeuvres monumentales d\'Alexandre Kichtchenko.';
}

// Path: films.items.bogucharLecture
class _TranslationsFilmsItemsBogucharLectureFr extends TranslationsFilmsItemsBogucharLectureRu {
	_TranslationsFilmsItemsBogucharLectureFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Conference «Un compatriote de renommee mondiale». A. M. Kichtchenko. Musee de Boutchar';
	@override String get excerpt => 'Conference du musee d\'histoire locale de Boutchar consacree a Alexandre Mikhailovitch Kichtchenko, compatriote de renommee mondiale originaire du district de Boutchar.';
}

// Path: films.items.culturalCodesTapestries
class _TranslationsFilmsItemsCulturalCodesTapestriesFr extends TranslationsFilmsItemsCulturalCodesTapestriesRu {
	_TranslationsFilmsItemsCulturalCodesTapestriesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Codes culturels de la nation : Ou se trouvent aujourd\'hui les tapisseries de l\'Artiste du Peuple Kichtchenko ? Emission principale';
	@override String get excerpt => 'L\'emission «Emission principale», dans sa rubrique «Codes culturels de la nation», retrace l\'emplacement actuel des tapisseries de l\'Artiste du Peuple bielorusse Alexandre Kichtchenko.';
}

// Path: films.items.tapestryOfCenturyMinsk
class _TranslationsFilmsItemsTapestryOfCenturyMinskFr extends TranslationsFilmsItemsTapestryOfCenturyMinskRu {
	_TranslationsFilmsItemsTapestryOfCenturyMinskFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Preparation de «La Tapisserie du Siecle» pour l\'exposition a la Banque de developpement a Minsk';
	@override String get excerpt => 'Reportage en coulisses sur la preparation de l\'oeuvre «La Tapisserie du Siecle» d\'Alexandre Kichtchenko pour son exposition a la Banque de developpement a Minsk.';
}

// Path: films.items.chernobylTapestryFacts
class _TranslationsFilmsItemsChernobylTapestryFactsFr extends TranslationsFilmsItemsChernobylTapestryFactsRu {
	_TranslationsFilmsItemsChernobylTapestryFactsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Les tapisseries «Siecle» et «Tchernobyl». Faits interessants';
	@override String get excerpt => 'Video consacree aux tapisseries emblematiques d\'Alexandre Kichtchenko — «La Tapisserie du Siecle» et «Tchernobyl» : leur genese, leur symbolique et des anecdotes etonnantes.';
}

// Path: films.items.kishchenkoReel1
class _TranslationsFilmsItemsKishchenkoReel1Fr extends TranslationsFilmsItemsKishchenkoReel1Ru {
	_TranslationsFilmsItemsKishchenkoReel1Fr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'A. Kichtchenko sur Instagram';
	@override String get excerpt => 'Court extrait sur les oeuvres d\'Alexandre Kichtchenko issu des reseaux sociaux.';
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'KISHCHANKA.ART',
			'app.brandTagline' => 'Collection des Beaux-Arts',
			'app.logoMark' => 'KA',
			'navigation.aboutAuthor' => 'A propos de l\'auteur',
			'navigation.news' => 'Actualites',
			'navigation.catalogOfWorks' => 'Catalogue des oeuvres',
			'navigation.films' => 'Films',
			'navigation.archive' => 'Archive',
			'navigation.contacts' => 'Contacts',
			'catalog.workPrefix' => 'Oeuvre',
			'catalog.errorTitle' => 'Echec du chargement des peintures',
			'catalog.errorWithDetails' => ({required Object message}) => 'Echec du chargement des peintures. ${message}',
			'catalog.decade.all' => 'Toutes',
			'catalog.decade.sixties' => 'Années 60',
			'catalog.decade.seventies' => 'Années 70',
			'catalog.decade.eighties' => 'Années 80',
			'catalog.decade.nineties' => 'Années 90',
			'catalog.paintingNames.id1958_1' => 'Périphérie. Vieux moulin',
			'catalog.paintingNames.id1958_2' => 'Angelina',
			'catalog.paintingNames.id1958_3' => 'La Toilette',
			'catalog.paintingNames.id1959_1' => 'Portrait de femme',
			'catalog.paintingNames.id1960_1' => 'Composition №1',
			'catalog.paintingNames.id1960_2' => 'Portrait de femme dans les tons verts',
			'catalog.paintingNames.id1960_3' => 'Première neige',
			'catalog.paintingNames.id1960_4' => 'Femme dans un fauteuil',
			'catalog.paintingNames.id1960_5' => 'Portrait du peintre Vladimir Ourichtchenko',
			'catalog.paintingNames.id1960_6' => 'Fille au ruban',
			'catalog.paintingNames.id1960_7' => 'Portrait de femme',
			'catalog.paintingNames.id1960_8' => 'Portrait de femme',
			'catalog.paintingNames.id1960_9' => 'L\'Attente',
			'catalog.paintingNames.id1962_1' => 'Nordique (Femme du nord)',
			'catalog.paintingNames.id1965_1' => 'Portrait de femme',
			'catalog.paintingNames.id1965_2' => 'Garçon de cirque',
			'catalog.paintingNames.id1965_3' => 'Tentation',
			'catalog.paintingNames.id1967_1' => 'Zoïa Litvinova',
			'catalog.paintingNames.id1967_2' => 'Deux vies',
			'catalog.paintingNames.id1968_1' => 'Nature morte aux poires',
			'catalog.paintingNames.id1969_1' => 'Ange',
			'catalog.paintingNames.id1970_1' => 'L\'Institutrice',
			'catalog.paintingNames.id1970_2' => 'Le dernier de Sébastopol',
			'catalog.paintingNames.id1972_1' => 'Portrait de Genia Moussinskaïa',
			'catalog.paintingNames.id1974_1' => 'Jeune fille en costume russe',
			'catalog.paintingNames.id1975_1' => 'Le Premier-né',
			'catalog.paintingNames.id1976_1' => 'Jeune fille en rouge et or (Raisins verts)',
			'catalog.paintingNames.id1979_1' => 'Mère et enfant',
			'catalog.paintingNames.id1979_2' => 'Natacha',
			'catalog.paintingNames.id1979_3' => 'L\'Assassinat de la famille Gromov. Action 1943. Taman.',
			'catalog.paintingNames.id1979_4' => 'Esquisse pour l\'œuvre "La Douleur du poète"',
			'catalog.paintingNames.id1979_5' => 'Joie. Maternité',
			'catalog.paintingNames.id1980_1' => 'Fragment pour le tableau "Miel"',
			'catalog.paintingNames.id1980_2' => 'Portrait de maman',
			'catalog.paintingNames.id1980_3' => 'Nina',
			'catalog.paintingNames.id1980_4' => 'Natacha Martchenko',
			'catalog.paintingNames.id1980_5' => 'Natacha',
			'catalog.paintingNames.id1981_1' => 'Réflexion',
			'catalog.paintingNames.id1981_2' => 'Portrait d\'Elena Obraztsova',
			'catalog.paintingNames.id1982_1' => 'Autoportrait',
			'catalog.paintingNames.id1982_2' => 'Adam et Ève',
			'catalog.paintingNames.id1982_3' => 'Profanation du temple',
			'catalog.paintingNames.id1982_4' => 'Obscurantistes',
			'catalog.paintingNames.id1982_5' => 'Tournesols',
			'catalog.paintingNames.id1982_6' => 'Paysage',
			'catalog.paintingNames.id1983_1' => 'Madone',
			'catalog.paintingNames.id1983_2' => 'Complot (Le Serment des francs-maçons)',
			'catalog.paintingNames.id1983_3' => 'Nina',
			'catalog.paintingNames.id1983_4' => 'Portrait de Maria Bieșu',
			'catalog.paintingNames.id1983_5' => 'L\'Appel de la mer',
			'catalog.paintingNames.id1983_6' => 'Pleurs',
			'catalog.paintingNames.id1983_7' => 'Natacha',
			'catalog.paintingNames.id1984_1' => 'Nina',
			'catalog.paintingNames.id1984_2' => 'Nina',
			'catalog.paintingNames.id1985_1' => 'Oncle Vania',
			'catalog.paintingNames.id1985_2' => 'Fille au chapeau rouge',
			'catalog.paintingNames.id1985_3' => 'Figure féminine. Natacha Tatarenko',
			'catalog.paintingNames.id1985_4' => 'Portrait d\'homme',
			'catalog.paintingNames.id1985_5' => 'Douche d\'été',
			'catalog.paintingNames.id1986_1' => 'Portrait de fille',
			'catalog.paintingNames.id1986_2' => 'Portrait du chef opérateur A. Abadovski',
			'catalog.paintingNames.id1986_3' => 'Derniers jours de septembre',
			'catalog.paintingNames.id1986_4' => 'Portrait de Bouchtchik',
			'catalog.paintingNames.id1986_5' => 'Portrait de Natacha Martchenko',
			'catalog.paintingNames.id1987_1' => 'Il vivra. Tchernobyl',
			'catalog.paintingNames.id1987_2' => 'Portrait de femme',
			'catalog.paintingNames.id1988_1' => 'Portrait de Macha',
			'catalog.paintingNames.id1988_2' => 'Tête d\'homme',
			'catalog.paintingNames.id1988_3' => 'Profil',
			'catalog.paintingNames.id1988_4' => 'La Marcheuse',
			'catalog.paintingNames.id1989_1' => 'Au bord du Don',
			'catalog.paintingNames.id1989_2' => 'Matin',
			'catalog.paintingNames.id1989_3' => 'Portrait de la peintre Tamara Kirtchina',
			'catalog.paintingNames.id1989_4' => 'Nu dans l\'espace musique',
			'catalog.paintingNames.id1989_5' => 'La Marcheuse (L\'Univers)',
			'catalog.paintingNames.id1989_6' => 'Nina',
			'catalog.paintingNames.id1989_7' => 'Le frère et la sœur Ielkine',
			'catalog.paintingNames.id1989_8' => 'Nina',
			'catalog.paintingNames.id1989_9' => 'Nu',
			'catalog.paintingNames.id1990_1' => 'Dans l\'espace (Nu)',
			'catalog.paintingNames.id1990_2' => 'Dons des planètes',
			'catalog.paintingNames.id1990_3' => 'Zoïa',
			'catalog.paintingNames.id1990_4' => 'Portrait d\'homme',
			'catalog.paintingNames.id1990_5' => 'Sur le balcon',
			'catalog.paintingNames.id1991_1' => 'Fille au miel (L\'Univers)',
			'catalog.paintingNames.id1991_2' => 'Rêve',
			'catalog.paintingNames.id1991_3' => 'L\'Éternelle',
			'catalog.paintingNames.id1992_1' => 'Portrait au coquillage marin',
			'catalog.paintingNames.id1992_2' => 'Satyre et Nymphe',
			'catalog.paintingNames.id1992_3' => 'Garçon au coq',
			'catalog.paintingNames.id1992_4' => 'Nina et Maxime',
			'catalog.paintingNames.id1992_5' => 'Moujik russe',
			'catalog.paintingNames.id1992_6' => 'Portrait de Franz Koch',
			'catalog.paintingNames.id1992_7' => 'Nina',
			'catalog.paintingNames.id1992_8' => 'Olga',
			'catalog.paintingNames.id1992_9' => 'Ne fais pas de bêtises, Maxime !',
			'catalog.paintingNames.id1992_10' => 'Tapisserie "Tournesols"',
			'catalog.paintingNames.id1993_1' => 'L\'Éternel',
			'catalog.paintingNames.id1993_2' => 'Portrait de la sculptrice Lena Kharaberiouch',
			'catalog.paintingNames.id1993_3' => 'L\'Apothicaire',
			'catalog.paintingNames.id1993_4' => 'Olia',
			'catalog.paintingNames.id1993_5' => 'Mère et enfant',
			'catalog.paintingNames.id1993_6' => 'Christ',
			'catalog.paintingNames.id1993_7' => 'Natacha',
			'catalog.paintingNames.id1993_8' => 'Portrait d\'une inconnue',
			'catalog.paintingNames.id1993_9' => 'Roman',
			'catalog.paintingNames.id1994_1' => 'Sous la constellation du Lion',
			'catalog.paintingNames.id1994_2' => 'Portrait de Zoïa',
			'catalog.paintingNames.id1994_3' => 'Cour abandonnée',
			'catalog.paintingNames.id1994_4' => 'Natacha',
			'catalog.paintingNames.id1994_5' => 'Chanson',
			'catalog.paintingNames.id1994_6' => 'Fille à la nature morte aux pommes',
			'catalog.paintingNames.id1994_7' => 'Celle qui crie',
			'catalog.paintingNames.id1994_8' => 'Natacha',
			'catalog.paintingNames.id1994_9' => 'Bacchanale',
			'catalog.paintingNames.id1995_1' => 'Petit rêveur',
			'catalog.paintingNames.id1995_2' => 'Ma Patrie',
			'catalog.paintingNames.id1995_3' => 'Nu',
			'catalog.paintingNames.id1995_4' => 'Olga Koltakova',
			'catalog.paintingNames.id1995_5' => 'Tamara Kirtchina de dos',
			'catalog.paintingNames.id1995_6' => 'Olia',
			'catalog.paintingNames.id1995_7' => 'Tristesse',
			'catalog.paintingNames.id1995_8' => 'Portrait de fille',
			'catalog.paintingNames.id1995_9' => 'L\'Univers',
			'catalog.paintingNames.id1995_10' => 'Liocha',
			'catalog.paintingNames.id1995_11' => 'Portrait de Rostikov',
			'catalog.paintingNames.id1995_12' => 'La critique d\'art Nadia',
			'catalog.paintingNames.id1995_13' => 'Mélodie',
			'catalog.paintingNames.id1995_14' => 'Tania',
			'catalog.paintingNames.id1995_15' => 'Esquisse pour le tableau «Portrait de Nina»',
			'catalog.paintingNames.id1995_16' => 'Nature morte',
			'catalog.paintingNames.id1995_17' => 'Tapisserie "Mer" ("Vague")',
			'catalog.paintingNames.id1996_1' => 'Nature morte aux pommes',
			'catalog.paintingNames.id1996_2' => 'Nu',
			'catalog.paintingNames.id1996_3' => 'Maxime avec une pastèque',
			'catalog.paintingNames.id1996_4' => 'Hymne (Extase)',
			'catalog.paintingNames.id1996_5' => 'Nina',
			'catalog.paintingNames.id1996_6' => 'Inna',
			'catalog.paintingNames.id1996_7' => 'Alla Astakhovitch',
			'catalog.paintingNames.id1996_8' => 'Lena',
			'catalog.paintingNames.id1996_9' => 'Portrait de femme (Nina №1)',
			'catalog.paintingNames.id1996_10' => 'L\'Univers',
			'catalog.paintingNames.id1996_11' => 'Naviguant dans une barque',
			'catalog.paintingNames.id1996_12' => 'Portrait de femme au châle',
			'catalog.paintingNames.id1996_13' => 'Maman',
			'catalog.paintingNames.id1996_14' => 'Philarète de Minsk',
			'catalog.paintingNames.id1996_15' => 'Nature morte dans l\'espace',
			'catalog.paintingNames.id1996_16' => 'Portrait de Koutchinski',
			'catalog.paintingNames.id1996_17' => 'Portrait de femme',
			'catalog.paintingNames.id1996_18' => 'Mon Univers',
			'catalog.paintingNames.id1997_1' => 'Ivan',
			'catalog.paintingNames.id1997_2' => 'Portrait de l\'architecte Vladimir Salazkine',
			'catalog.paintingNames.id1997_3' => 'La Guerre des mondes (dernière œuvre)',
			'catalog.paintingNames.id1997_4' => 'Autoportrait',
			'catalog.paintingNames.id1997_5' => 'Été à Bogoutchar',
			'catalog.paintingNames.id1997_6' => 'Deux veuves',
			'catalog.paintingNames.idunknown_1' => 'Crue',
			'catalog.paintingNames.idunknown_2' => 'Portrait de femme',
			'catalog.paintingNames.idunknown_3' => 'Épines bleues',
			'catalog.paintingNames.idunknown_4' => 'Nina',
			'catalog.paintingNames.idunknown_5' => 'Nina',
			'catalog.paintingMediums.canvasOil' => 'Toile, huile',
			'catalog.paintingMediums.hardboardOil' => 'Isorel, huile',
			'catalog.paintingMediums.cardboard' => 'Carton',
			'catalog.paintingMediums.woolLinenWeaving' => 'Laine, lin, tissage',
			'common.pageNotFound' => 'Page introuvable',
			'common.viewCatalog' => 'VOIR LE CATALOGUE',
			'common.learnMore' => 'EN SAVOIR PLUS',
			'common.video.loadError' => 'Echec du chargement du flux vidéo',
			'common.video.openExternally' => 'Ouvrir en externe',
			'language.label' => 'Langue',
			'language.russian' => 'Russe',
			'language.english' => 'Anglais',
			'language.spanish' => 'Espagnol',
			'language.french' => 'Francais',
			'language.german' => 'Allemand',
			'language.belarusian' => 'Bielorusse',
			'archiveFeed.title' => 'Archives et publications',
			'archiveFeed.latestLabel' => 'Derniere publication',
			'archiveFeed.moreLabel' => 'Actualites et references',
			'archiveFeed.openArticle' => 'Ouvrir l\'article',
			'archiveFeed.sourceLabel' => 'Source',
			'archiveFeed.yearLabel' => ({required Object year}) => '${year}',
			'archiveFeed.items.boguchar2026.title' => 'Visite guidee «L\'histoire de la vie de M. A. Kichtchenko»',
			'archiveFeed.items.boguchar2026.excerpt' => 'Le 19 fevrier 2026, le musee de Boguchar a accueilli une visite guidee destinee aux eleves de l\'ecole du village de Diatchenkovo (mouvement «Pervyh»), dediee a la decouverte de la vie et de l\'oeuvre du celebre artiste Alexandre Mikhailovitch Kichtchenko.',
			'archiveFeed.items.priorbankChtobyChuvstvovat.title' => 'Exposition «Pour ressentir» — la collection de la Priorbank',
			'archiveFeed.items.priorbankChtobyChuvstvovat.excerpt' => 'La Priorbank presente pour la premiere fois au public sa collection d\'entreprise de peinture bielorusse des annees 1960 a 2000, constituee depuis plus de 30 ans. L\'exposition «Pour ressentir», au palais Roumiantsev-Paskevitch, se tient du 10 avril au 7 juin et reunit plus de 70 oeuvres uniques, parmi lesquelles trois tableaux d\'Alexandre Kichtchenko.',
			'archiveFeed.items.nitiSudby.title' => 'Alexandre Kichtchenko. Les fils du destin',
			'archiveFeed.items.nitiSudby.excerpt' => 'Le musee a accueilli l\'inauguration solennelle de l\'exposition «Alexandre Kichtchenko. Les fils du destin» (12+), consacree a l\'oeuvre de l\'eminent artiste bielorusse, originaire du district de Boguchar dans la region de Voronej. L\'exposition est organisee a l\'occasion du 300e anniversaire du gouvernorat de Voronej et s\'inscrit dans le cadre des echanges culturels de la region avec la Republique du Belarus.',
			'archiveFeed.items.boguchar2024.title' => 'Visite guidee «L\'histoire de la vie de A. M. Kichtchenko»',
			'archiveFeed.items.boguchar2024.excerpt' => 'Alexandre Mikhailovitch Kichtchenko fut l\'une des figures les plus talentueuses de la region de Boguchar — artiste du peuple de la Republique du Belarus et citoyen d\'honneur du district de Boguchar. Membre de l\'Union des artistes de l\'URSS et laureat du Prix d\'Etat, il a laisse une empreinte marquante dans l\'histoire de l\'art.',
			'archiveFeed.items.belgazprombankKraskiPobedy.title' => 'La Belgazprombank invite a l\'exposition «Les couleurs de la Grande Victoire»',
			'archiveFeed.items.belgazprombankKraskiPobedy.excerpt' => '28 juin 2024. A la veille du 80e anniversaire de la liberation du Belarus de l\'occupation nazie allemande, le hall du siege de la Belgazprombank a accueilli solennellement l\'exposition thematique «Les couleurs de la Grande Victoire». Elle reunit des oeuvres d\'artistes bielorusses qui ont connu les horreurs de la guerre de premiere main — A. Kichtchenko, V. Protaseni, I. Stassevitch, N. Tchourabo, I. Rey, P. Daneliya et d\'autres.',
			'archiveFeed.items.nebaZiamlja.title' => 'Le ciel et la terre d\'Alexandre Kichtchenko',
			'archiveFeed.items.nebaZiamlja.excerpt' => 'Le 6 mai 2023, le Musee national d\'art de la Republique du Belarus inaugure l\'exposition «Le ciel et la terre d\'Alexandre Kichtchenko», consacree a l\'ampleur de sa pensee artistique et a l\'importance de l\'heritage du maitre.',
			'films.title' => 'Films & documentaires',
			'films.subtitle' => 'Archives video sur A. Kichtchenko',
			'films.latestLabel' => 'Film en vedette',
			'films.sourceLabel' => 'Source',
			'films.instagramTitle' => 'Instagram',
			'films.instagramSubtitle' => 'Videos courtes et stories',
			'films.watchOn.youtube' => 'Voir sur YouTube',
			'films.watchOn.googleDrive' => 'Voir sur Google Drive',
			'films.watchOn.instagram' => 'Ouvrir sur Instagram',
			'films.items.ispovedVremeni.title' => 'A. Kichtchenko. Confession du Temps',
			'films.items.ispovedVremeni.excerpt' => 'Documentaire sur Alexandre Mikhailovitch Kichtchenko (1933–1997), Artiste du Peuple du Belarus et auteur de la plus grande tapisserie du monde. Realisation : V. Korolev ; prise de vues et montage : E. Milkovski.',
			'films.items.aleksandrKishchenko.title' => 'Alexandre Kichtchenko',
			'films.items.aleksandrKishchenko.excerpt' => 'Portrait televise consacre a la vie et a l\'oeuvre d\'Alexandre Kichtchenko : les fresques monumentales de Minsk, la «Tapisserie du Siecle» et la philosophie du realisme universel du maitre.',
			'films.items.voronezhKramskoyExhibition.title' => 'Exposition d\'A. M. Kichtchenko au Musee des beaux-arts I. N. Kramskoi de Voronej',
			'films.items.voronezhKramskoyExhibition.excerpt' => 'Reportage sur l\'exposition des oeuvres du celebre artiste bielorusse Alexandre Kichtchenko au Musee regional des beaux-arts I. N. Kramskoi de Voronej.',
			'films.items.mastersOfSovietArt1988.title' => 'A. Kichtchenko. Serie «Maitres de l\'art sovietique». Album de 1988',
			'films.items.mastersOfSovietArt1988.excerpt' => 'Apercu video de l\'album de 1988 de la serie «Maitres de l\'art sovietique», consacre a la peinture et aux oeuvres monumentales d\'Alexandre Kichtchenko.',
			'films.items.bogucharLecture.title' => 'Conference «Un compatriote de renommee mondiale». A. M. Kichtchenko. Musee de Boutchar',
			'films.items.bogucharLecture.excerpt' => 'Conference du musee d\'histoire locale de Boutchar consacree a Alexandre Mikhailovitch Kichtchenko, compatriote de renommee mondiale originaire du district de Boutchar.',
			'films.items.culturalCodesTapestries.title' => 'Codes culturels de la nation : Ou se trouvent aujourd\'hui les tapisseries de l\'Artiste du Peuple Kichtchenko ? Emission principale',
			'films.items.culturalCodesTapestries.excerpt' => 'L\'emission «Emission principale», dans sa rubrique «Codes culturels de la nation», retrace l\'emplacement actuel des tapisseries de l\'Artiste du Peuple bielorusse Alexandre Kichtchenko.',
			'films.items.tapestryOfCenturyMinsk.title' => 'Preparation de «La Tapisserie du Siecle» pour l\'exposition a la Banque de developpement a Minsk',
			'films.items.tapestryOfCenturyMinsk.excerpt' => 'Reportage en coulisses sur la preparation de l\'oeuvre «La Tapisserie du Siecle» d\'Alexandre Kichtchenko pour son exposition a la Banque de developpement a Minsk.',
			'films.items.chernobylTapestryFacts.title' => 'Les tapisseries «Siecle» et «Tchernobyl». Faits interessants',
			'films.items.chernobylTapestryFacts.excerpt' => 'Video consacree aux tapisseries emblematiques d\'Alexandre Kichtchenko — «La Tapisserie du Siecle» et «Tchernobyl» : leur genese, leur symbolique et des anecdotes etonnantes.',
			'films.items.kishchenkoReel1.title' => 'A. Kichtchenko sur Instagram',
			'films.items.kishchenkoReel1.excerpt' => 'Court extrait sur les oeuvres d\'Alexandre Kichtchenko issu des reseaux sociaux.',
			'newsFeed.title' => 'Actualites',
			'newsFeed.subtitle' => 'Publications, expositions et evenements',
			'newsFeed.emptyState' => 'Pas encore d\'actualites. Revenez bientot.',
			'newsFeed.errorTitle' => 'Impossible de charger les actualites',
			'newsFeed.retry' => 'Reessayer',
			'newsFeed.back' => 'Retour aux actualites',
			'newsFeed.sourceLabel' => 'Source',
			'newsFeed.readTimeLabel' => 'Temps de lecture',
			'newsFeed.readTimeValue' => ({required Object minutes}) => '${minutes} min',
			'newsFeed.viewsLabel' => 'Vues',
			'newsFeed.publishedLabel' => 'Publie',
			'bio.heroTitle' => 'ART À L\'ÉCHELLE COSMIQUE',
			'bio.heroSubtitle' => 'Un art qui efface les frontières entre le terrestre et l\'éternel. Artiste du Peuple de la République du Bélarus, créateur de la plus grande tapisserie du monde «La Tapisserie du Siècle».',
			'bio.heroBrandName' => 'Alexandre Mikhaïlovitch Kichtchanka',
			'bio.name' => 'Alexandre Mikhaïlovitch Kichtchanka (1933–1997)',
			'bio.tagline' => 'Peintre. Philosophe. Monumentaliste. Fondateur du Réalisme Universel.',
			'bio.intro' => 'Alexandre Kichtchanka est une figure de dimension renaissante dans l\'art du XXe siècle. Un homme qui réussit à transformer le fil souple de la tapisserie en une déclaration architecturale puissante, et les murs des villes en livres ouverts de significations philosophiques. Son oeuvre est un pont entre l\'archaïque et le cosmos, entre la douleur de la terre et la lumière de galaxies lointaines.',
			'bio.feature.title' => 'HÉRITAGE D\'ENVERGURE MONDIALE',
			'bio.feature.body' => 'Cette collection réunit les oeuvres d\'un maître exceptionnel dont l\'art a changé à jamais la perception de la peinture monumentale et de la tapisserie. Des mosaïques grandioses devenues le code visuel de Minsk jusqu\'à la célèbre Tapisserie du Siècle et à l\'oeuvre Tchernobyl qui orne le siège des Nations Unies à New York. Chaque oeuvre de Kichtchanka est un traité philosophique sur le lien des époques, le cosmos et l\'esprit humain indestructible.',
			'bio.feature.cta' => 'EXPLORER LA COLLECTION',
			'bio.feature.worksValue' => '500+',
			'bio.feature.worksLabel' => 'Oeuvres d\'art à travers le monde',
			'bio.feature.panelsValue' => '6+',
			'bio.feature.panelsLabel' => 'Panneaux monumentaux à Minsk',
			'bio.feature.guinnessValue' => '1',
			'bio.feature.guinnessLabel' => 'Record Guinness dans l\'art',
			'bio.universalRealism.title' => 'Fondateur du Réalisme Universel',
			'bio.universalRealism.body' => 'Kichtchanka ne se contentait pas de représenter la réalité — il créait un nouveau système de coordonnées, qu\'il appelait le Réalisme Universel. Au coeur de sa méthode réside la conviction que l\'artiste est un tisserand du temps, tenu de relier le passé et l\'avenir. Son art dépassa les frontières nationales, opérant avec les catégories du drame humain mondial. Pour Kichtchanka, l\'homme est un demi-dieu dont les actes résonnent à l\'échelle de l\'Univers. Dans ses oeuvres, les ombres deviennent des formes autonomes, et la couleur une musique cosmique soumise à un ordre supérieur strict.',
			'bio.tapestry.title' => 'La Tapisserie du Siècle: Le Sommet du Tissage Mondial',
			'bio.tapestry.intro' => 'Alexandre Kichtchanka est entré dans l\'histoire en tant qu\'auteur de la plus grande tapisserie du monde, officiellement inscrite dans le Livre Guinness des records.',
			'bio.tapestry.scaleLabel' => 'Dimensions',
			'bio.tapestry.scale' => 'Une oeuvre mesurant 19 × 14 mètres (environ 300 m²), pesant plus d\'une tonne.',
			'bio.tapestry.conceptLabel' => 'Concept',
			'bio.tapestry.concept' => 'Une trame grandiose de l\'histoire, où s\'entrecroisent les destins de 80 personnalités emblématiques — du Christ et de la Madone à Churchill, Castro et Gorbatchev.',
			'bio.tapestry.meaningLabel' => 'Signification',
			'bio.tapestry.meaning' => 'Cette oeuvre est un temple, au centre duquel se déroule l\'éternel conflit entre création et destruction. Elle a été reconnue patrimoine national de la Biélorussie.',
			'bio.chernobyl.title' => 'Tchernobyl: La Voix d\'une Nation dans les Salles de l\'ONU',
			'bio.chernobyl.body' => 'L\'une des oeuvres les plus bouleversantes du maître est la tapisserie Tchernobyl (1991). Offerte aux Nations Unies, elle orne encore aujourd\'hui le siège de l\'ONU à New York. Quand le monde vit cette oeuvre, le Secrétaire général de l\'ONU Javier Pérez de Cuéllar la compara à la Guernica de Picasso. Pour Kichtchanka, cette tapisserie n\'était pas seulement un mémorial à la tragédie, mais les yeux de la Biélorussie — un avertissement planétaire sur la fragilité de la vie, tissé par les mains de grandes tisserandes biélorusses.',
			'bio.mosaic.title' => 'Le Visage de la Ville: Les Mosaïques Vostok',
			'bio.mosaic.intro' => 'Kichtchanka a forgé le code visuel du Minsk moderne. Ses célèbres mosaïques sur les immeubles d\'habitation du quartier Vostok-1 sont devenues la carte de visite de la capitale.',
			'bio.mosaic.panelsLabel' => 'Quatre oeuvres monumentales',
			'bio.mosaic.panels' => 'Ville-guerrière, Ville de la Science, Ville de la Culture et Ville-bâtisseuse.',
			'bio.mosaic.panelsMeaning' => 'Ces oeuvres ont transformé une construction typique en espace artistique, où le triomphe de l\'esprit humain est célébré à travers la smalt et la pierre.',
			'bio.legacy.title' => 'Héritage',
			'bio.legacy.body' => 'Alexandre Kichtchanka a laissé derrière lui non seulement des toiles conservées à la Galerie Tretiakov et dans des collections privées de dirigeants mondiaux (B. Clinton, F. Mitterrand), mais aussi toute une école de tapisserie monumentale biélorusse. Le Combinat des arts décoratifs et appliqués de Borisov, où furent créées ses grandes tapisseries, porte aujourd\'hui son nom.',
			'bio.quote' => 'L\'art est un phénomène divin. Lui seul a le pouvoir d\'arrêter le temps. L\'art peut percer le mystère de l\'avenir et restaurer aussi le passé perdu.',
			'bio.quoteAuthor' => '— Alexandre Kichtchanka',
			'bio.wikipediaLinkLabel' => 'LIRE SUR WIKIPÉDIA',
			'contacts.title' => 'Contacts',
			'contacts.tagline' => 'Contactez l\'atelier.',
			'contacts.phoneSectionLabel' => 'Téléphone',
			'contacts.phoneSectionHint' => 'Appels et WhatsApp',
			'contacts.instagramSectionLabel' => 'Instagram',
			'contacts.instagramHandle' => '@kishchenko.art',
			'contacts.vkSectionLabel' => 'VK',
			'contacts.vkHandle' => 'aleksandrkishchenko',
			'contacts.vkScanQrHint' => 'Scannez le QR pour ouvrir VK',
			'contacts.studioSectionTitle' => 'Atelier de l\'auteur',
			'contacts.studioAddress' => 'Minsk, 44 rue Sourganov — 7ᵉ étage',
			'contacts.openInOsm' => 'OUVRIR DANS OPENSTREETMAP',
			'contacts.mapAttribution' => '© Contributeurs OpenStreetMap',
			_ => null,
		};
	}
}
