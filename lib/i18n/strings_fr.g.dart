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
	@override late final _TranslationsBioFr bio = _TranslationsBioFr._(_root);
}

// Path: app
class _TranslationsAppFr extends TranslationsAppRu {
	_TranslationsAppFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'KISHCHANKA.ART';
}

// Path: navigation
class _TranslationsNavigationFr extends TranslationsNavigationRu {
	_TranslationsNavigationFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get aboutAuthor => 'A propos de l\'auteur';
	@override String get news => 'Actualites';
	@override String get catalogOfWorks => 'Catalogue des oeuvres';
	@override String get archive => 'Archive';
	@override String get contacts => 'Contacts';
}

// Path: catalog
class _TranslationsCatalogFr extends TranslationsCatalogRu {
	_TranslationsCatalogFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get workPrefix => 'Oeuvre';
	@override late final _TranslationsCatalogPaintingNamesFr paintingNames = _TranslationsCatalogPaintingNamesFr._(_root);
}

// Path: common
class _TranslationsCommonFr extends TranslationsCommonRu {
	_TranslationsCommonFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get pageNotFound => 'Page introuvable';
	@override String get viewCatalog => 'VOIR LE CATALOGUE';
	@override String get learnMore => 'EN SAVOIR PLUS';
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

// Path: bio
class _TranslationsBioFr extends TranslationsBioRu {
	_TranslationsBioFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get heroTitle => 'ART À L\'ÉCHELLE COSMIQUE';
	@override String get heroSubtitle => 'Un art qui efface les frontières entre le terrestre et l\'éternel. Artiste du Peuple de la République du Bélarus, créateur de la plus grande tapisserie du monde «La Tapisserie du Siècle».';
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

// Path: bio.feature
class _TranslationsBioFeatureFr extends TranslationsBioFeatureRu {
	_TranslationsBioFeatureFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'HÉRITAGE D\'ENVERGURE MONDIALE';
	@override String get body => 'Cette collection réunit les oeuvres d\'un maître exceptionnel dont l\'art a changé à jamais la perception de la peinture monumentale et de la tapisserie. Des mosaïques grandioses devenues le code visuel de Minsk jusqu\'à la célèbre Tapisserie du Siècle et à l\'oeuvre Tchernobyl qui orne le siège des Nations Unies à New York. Chaque oeuvre de Kichtchanka est un traité philosophique sur le lien des époques, le cosmos et l\'esprit humain indestructible.';
	@override String get cta => 'EXPLORER LA COLLECTION';
	@override String get worksValue => '200+';
	@override String get worksLabel => 'Oeuvres d\'art';
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

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'KISHCHANKA.ART',
			'navigation.aboutAuthor' => 'A propos de l\'auteur',
			'navigation.news' => 'Actualites',
			'navigation.catalogOfWorks' => 'Catalogue des oeuvres',
			'navigation.archive' => 'Archive',
			'navigation.contacts' => 'Contacts',
			'catalog.workPrefix' => 'Oeuvre',
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
			'common.pageNotFound' => 'Page introuvable',
			'common.viewCatalog' => 'VOIR LE CATALOGUE',
			'common.learnMore' => 'EN SAVOIR PLUS',
			'language.label' => 'Langue',
			'language.russian' => 'Russe',
			'language.english' => 'Anglais',
			'language.spanish' => 'Espagnol',
			'language.french' => 'Francais',
			'language.german' => 'Allemand',
			'language.belarusian' => 'Bielorusse',
			'bio.heroTitle' => 'ART À L\'ÉCHELLE COSMIQUE',
			'bio.heroSubtitle' => 'Un art qui efface les frontières entre le terrestre et l\'éternel. Artiste du Peuple de la République du Bélarus, créateur de la plus grande tapisserie du monde «La Tapisserie du Siècle».',
			'bio.name' => 'Alexandre Mikhaïlovitch Kichtchanka (1933–1997)',
			'bio.tagline' => 'Peintre. Philosophe. Monumentaliste. Fondateur du Réalisme Universel.',
			'bio.intro' => 'Alexandre Kichtchanka est une figure de dimension renaissante dans l\'art du XXe siècle. Un homme qui réussit à transformer le fil souple de la tapisserie en une déclaration architecturale puissante, et les murs des villes en livres ouverts de significations philosophiques. Son oeuvre est un pont entre l\'archaïque et le cosmos, entre la douleur de la terre et la lumière de galaxies lointaines.',
			'bio.feature.title' => 'HÉRITAGE D\'ENVERGURE MONDIALE',
			'bio.feature.body' => 'Cette collection réunit les oeuvres d\'un maître exceptionnel dont l\'art a changé à jamais la perception de la peinture monumentale et de la tapisserie. Des mosaïques grandioses devenues le code visuel de Minsk jusqu\'à la célèbre Tapisserie du Siècle et à l\'oeuvre Tchernobyl qui orne le siège des Nations Unies à New York. Chaque oeuvre de Kichtchanka est un traité philosophique sur le lien des époques, le cosmos et l\'esprit humain indestructible.',
			'bio.feature.cta' => 'EXPLORER LA COLLECTION',
			'bio.feature.worksValue' => '200+',
			'bio.feature.worksLabel' => 'Oeuvres d\'art',
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
			_ => null,
		};
	}
}
