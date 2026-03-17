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
class TranslationsEn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppEn app = _TranslationsAppEn._(_root);
	@override late final _TranslationsNavigationEn navigation = _TranslationsNavigationEn._(_root);
	@override late final _TranslationsCatalogEn catalog = _TranslationsCatalogEn._(_root);
	@override late final _TranslationsCommonEn common = _TranslationsCommonEn._(_root);
	@override late final _TranslationsLanguageEn language = _TranslationsLanguageEn._(_root);
	@override late final _TranslationsBioEn bio = _TranslationsBioEn._(_root);
}

// Path: app
class _TranslationsAppEn extends TranslationsAppRu {
	_TranslationsAppEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'KISHCHANKA.ART';
}

// Path: navigation
class _TranslationsNavigationEn extends TranslationsNavigationRu {
	_TranslationsNavigationEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get aboutAuthor => 'About author';
	@override String get news => 'News';
	@override String get catalogOfWorks => 'Catalog of works';
	@override String get archive => 'Archive';
	@override String get contacts => 'Contacts';
}

// Path: catalog
class _TranslationsCatalogEn extends TranslationsCatalogRu {
	_TranslationsCatalogEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get workPrefix => 'Work';
	@override late final _TranslationsCatalogPaintingNamesEn paintingNames = _TranslationsCatalogPaintingNamesEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonRu {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get pageNotFound => 'Page not found';
	@override String get viewCatalog => 'VIEW CATALOG';
	@override String get learnMore => 'LEARN MORE';
}

// Path: language
class _TranslationsLanguageEn extends TranslationsLanguageRu {
	_TranslationsLanguageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'Language';
	@override String get russian => 'Russian';
	@override String get english => 'English';
	@override String get spanish => 'Spanish';
	@override String get french => 'French';
	@override String get german => 'German';
	@override String get belarusian => 'Belarusian';
}

// Path: bio
class _TranslationsBioEn extends TranslationsBioRu {
	_TranslationsBioEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get heroTitle => 'ART OF COSMIC SCALE';
	@override String get heroSubtitle => 'Art that erases boundaries between the earthly and the eternal. People\'s Artist of the Republic of Belarus, creator of the world\'s largest tapestry "The Tapestry of the Century".';
	@override String get name => 'Alexander Mikhailovich Kishchanka (1933–1997)';
	@override String get tagline => 'Painter. Philosopher. Monumentalist. Founder of Universal Realism.';
	@override String get intro => 'Alexander Kishchanka is a figure of Renaissance stature in 20th-century art. A man who transformed the soft thread of tapestry into a powerful architectural statement, and city walls into open books of philosophical meaning. His work is a bridge between the archaic and the cosmic, between the pain of the earth and the light of distant galaxies.';
	@override late final _TranslationsBioFeatureEn feature = _TranslationsBioFeatureEn._(_root);
	@override late final _TranslationsBioUniversalRealismEn universalRealism = _TranslationsBioUniversalRealismEn._(_root);
	@override late final _TranslationsBioTapestryEn tapestry = _TranslationsBioTapestryEn._(_root);
	@override late final _TranslationsBioChernobylEn chernobyl = _TranslationsBioChernobylEn._(_root);
	@override late final _TranslationsBioMosaicEn mosaic = _TranslationsBioMosaicEn._(_root);
	@override late final _TranslationsBioLegacyEn legacy = _TranslationsBioLegacyEn._(_root);
	@override String get quote => 'Art is a divine phenomenon. Only it is given the power to stop time. Art can unravel the mystery of the future and also restore the lost past.';
	@override String get quoteAuthor => '— Alexander Kishchanka';
}

// Path: catalog.paintingNames
class _TranslationsCatalogPaintingNamesEn extends TranslationsCatalogPaintingNamesRu {
	_TranslationsCatalogPaintingNamesEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get id1958_1 => 'Outskirts. The Old Mill';
	@override String get id1958_2 => 'Angelina';
	@override String get id1958_3 => 'Toilette';
	@override String get id1959_1 => 'Female Portrait';
	@override String get id1960_1 => 'Composition No. 1';
	@override String get id1960_2 => 'Female Portrait in Green Tones';
	@override String get id1960_3 => 'First Snow';
	@override String get id1960_4 => 'Woman in an Armchair';
	@override String get id1960_5 => 'Portrait of Artist Vladimir Urishchenko';
	@override String get id1960_6 => 'Girl with a Bow';
	@override String get id1960_7 => 'Female Portrait';
	@override String get id1960_8 => 'Female Portrait';
	@override String get id1960_9 => 'Expectation';
	@override String get id1962_1 => 'Northern Woman (Woman from the North)';
	@override String get id1965_1 => 'Female Portrait';
	@override String get id1965_2 => 'Circus Boy';
	@override String get id1965_3 => 'Temptation';
	@override String get id1967_1 => 'Zoya Litvinova';
	@override String get id1967_2 => 'Two Lives';
	@override String get id1968_1 => 'Still Life with Pears';
	@override String get id1969_1 => 'Angel';
	@override String get id1970_1 => 'The Teacher';
	@override String get id1970_2 => 'The Last Sevastopolian';
	@override String get id1972_1 => 'Portrait of Zhenya Musinskaya';
	@override String get id1974_1 => 'Girl in Russian Costume';
	@override String get id1975_1 => 'The Firstborn';
	@override String get id1976_1 => 'Girl in Red and Gold (Green Grapes)';
	@override String get id1979_1 => 'Mother with Child';
	@override String get id1979_2 => 'Natasha';
	@override String get id1979_3 => 'The Murder of the Gromov Family. Action 1943. Taman.';
	@override String get id1979_4 => 'Sketch for "The Poet\'s Pain"';
	@override String get id1979_5 => 'Joy. Motherhood';
	@override String get id1980_1 => 'Fragment for the Painting "Honey"';
	@override String get id1980_2 => 'Portrait of Mother';
	@override String get id1980_3 => 'Nina';
	@override String get id1980_4 => 'Natasha Marchenko';
	@override String get id1980_5 => 'Natasha';
	@override String get id1981_1 => 'Reverie';
	@override String get id1981_2 => 'Portrait of Elena Obraztsova';
	@override String get id1982_1 => 'Self-Portrait';
	@override String get id1982_2 => 'Adam and Eve';
	@override String get id1982_3 => 'Desecration of the Temple';
	@override String get id1982_4 => 'Obscurantists';
	@override String get id1982_5 => 'Sunflowers';
	@override String get id1982_6 => 'Landscape';
	@override String get id1983_1 => 'Madonna';
	@override String get id1983_2 => 'Conspiracy (The Freemasons\' Oath)';
	@override String get id1983_3 => 'Nina';
	@override String get id1983_4 => 'Portrait of Maria Bieshu';
	@override String get id1983_5 => 'The Call of the Sea';
	@override String get id1983_6 => 'Weeping';
	@override String get id1983_7 => 'Natasha';
	@override String get id1984_1 => 'Nina';
	@override String get id1984_2 => 'Nina';
	@override String get id1985_1 => 'Uncle Vanya';
	@override String get id1985_2 => 'Girl in a Red Hat';
	@override String get id1985_3 => 'Female Image. Natasha Tatarenko';
	@override String get id1985_4 => 'Male Portrait';
	@override String get id1985_5 => 'Summer Shower';
	@override String get id1986_1 => 'Portrait of a Girl';
	@override String get id1986_2 => 'Portrait of Cinematographer A. Abadovsky';
	@override String get id1986_3 => 'The Last Days of September';
	@override String get id1986_4 => 'Portrait of Bushchik';
	@override String get id1986_5 => 'Portrait of Natasha Marchenko';
	@override String get id1987_1 => 'He Will Live. Chernobyl';
	@override String get id1987_2 => 'Female Portrait';
	@override String get id1988_1 => 'Portrait of Masha';
	@override String get id1988_2 => 'Male Head';
	@override String get id1988_3 => 'Profile';
	@override String get id1988_4 => 'Walking Woman';
	@override String get id1989_1 => 'On the Banks of the Don';
	@override String get id1989_2 => 'Morning';
	@override String get id1989_3 => 'Portrait of the Artist Tamara Kirshchina';
	@override String get id1989_4 => 'Nude in the Space of Music';
	@override String get id1989_5 => 'Walking Woman (The Universe)';
	@override String get id1989_6 => 'Nina';
	@override String get id1989_7 => 'Brother and Sister Yelkiny';
	@override String get id1989_8 => 'Nina';
	@override String get id1989_9 => 'Nude';
	@override String get id1990_1 => 'In Space (Nude)';
	@override String get id1990_2 => 'Gifts of the Planets';
	@override String get id1990_3 => 'Zoya';
	@override String get id1990_4 => 'Male Portrait';
	@override String get id1990_5 => 'On the Balcony';
	@override String get id1991_1 => 'Girl with Honey (The Universe)';
	@override String get id1991_2 => 'Dream';
	@override String get id1991_3 => 'The Eternal';
	@override String get id1992_1 => 'Portrait with a Seashell';
	@override String get id1992_2 => 'Satyr and Nymph';
	@override String get id1992_3 => 'Boy with a Rooster';
	@override String get id1992_4 => 'Nina and Maxim';
	@override String get id1992_5 => 'Russian Peasant';
	@override String get id1992_6 => 'Portrait of Franz Koch';
	@override String get id1992_7 => 'Nina';
	@override String get id1992_8 => 'Olga';
	@override String get id1992_9 => 'Don\'t Misbehave, Maxim!';
	@override String get id1992_10 => 'Tapestry "Sunflowers"';
	@override String get id1993_1 => 'The Eternal';
	@override String get id1993_2 => 'Portrait of the Sculptor Lena Kharaberyush';
	@override String get id1993_3 => 'The Apothecary';
	@override String get id1993_4 => 'Olya';
	@override String get id1993_5 => 'Mother and Child';
	@override String get id1993_6 => 'Christ';
	@override String get id1993_7 => 'Natasha';
	@override String get id1993_8 => 'Portrait of an Unknown Woman';
	@override String get id1993_9 => 'Roman';
	@override String get id1994_1 => 'Under the Constellation of Leo';
	@override String get id1994_2 => 'Portrait of Zoya';
	@override String get id1994_3 => 'The Abandoned Courtyard';
	@override String get id1994_4 => 'Natasha';
	@override String get id1994_5 => 'Song';
	@override String get id1994_6 => 'Girl with a Still Life with Apples';
	@override String get id1994_7 => 'The Screaming Woman';
	@override String get id1994_8 => 'Natasha';
	@override String get id1994_9 => 'Bacchanalia';
	@override String get id1995_1 => 'Little Dreamer';
	@override String get id1995_2 => 'My Homeland';
	@override String get id1995_3 => 'Nude';
	@override String get id1995_4 => 'Olga Koltakova';
	@override String get id1995_5 => 'Tamara Kirshchina from Behind';
	@override String get id1995_6 => 'Olya';
	@override String get id1995_7 => 'Sadness';
	@override String get id1995_8 => 'Portrait of a Girl';
	@override String get id1995_9 => 'The Universe';
	@override String get id1995_10 => 'Lyosha';
	@override String get id1995_11 => 'Portrait of Rostikov';
	@override String get id1995_12 => 'Art Critic Nadya';
	@override String get id1995_13 => 'Melody';
	@override String get id1995_14 => 'Tanya';
	@override String get id1995_15 => 'Sketch for the Painting «Portrait of Nina»';
	@override String get id1995_16 => 'Still Life';
	@override String get id1995_17 => 'Tapestry "The Sea" ("The Wave")';
	@override String get id1996_1 => 'Still Life with Apples';
	@override String get id1996_2 => 'Nude';
	@override String get id1996_3 => 'Maxim with a Watermelon';
	@override String get id1996_4 => 'Hymn (Rapture)';
	@override String get id1996_5 => 'Nina';
	@override String get id1996_6 => 'Inna';
	@override String get id1996_7 => 'Alla Astakhovich';
	@override String get id1996_8 => 'Lena';
	@override String get id1996_9 => 'Female Portrait (Nina No. 1)';
	@override String get id1996_10 => 'Universe';
	@override String get id1996_11 => 'Floating in a Boat';
	@override String get id1996_12 => 'Female Portrait with a Shawl';
	@override String get id1996_13 => 'Mom';
	@override String get id1996_14 => 'Filaret of Minsk';
	@override String get id1996_15 => 'Still Life in Space';
	@override String get id1996_16 => 'Portrait of Kuchinsky';
	@override String get id1996_17 => 'Female Portrait';
	@override String get id1996_18 => 'My Universe';
	@override String get id1997_1 => 'Ivan';
	@override String get id1997_2 => 'Portrait of Architect Vladimir Salazkin';
	@override String get id1997_3 => 'War of the Worlds (Last Work)';
	@override String get id1997_4 => 'Self-Portrait';
	@override String get id1997_5 => 'Summer in Boguchar';
	@override String get id1997_6 => 'Two Widows';
	@override String get idunknown_1 => 'The Flood';
	@override String get idunknown_2 => 'Female Portrait';
	@override String get idunknown_3 => 'Blue Thorns';
	@override String get idunknown_4 => 'Nina';
	@override String get idunknown_5 => 'Nina';
}

// Path: bio.feature
class _TranslationsBioFeatureEn extends TranslationsBioFeatureRu {
	_TranslationsBioFeatureEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'LEGACY OF GLOBAL SCALE';
	@override String get body => 'This collection brings together works by an outstanding master whose art forever changed the understanding of monumental painting and tapestry. From the grand mosaics that became a visual code of Minsk to the celebrated Tapestry of the Century and the Chernobyl canvas displayed at United Nations Headquarters in New York, every work by Kishchanka is a philosophical treatise on the connection of times, the cosmos, and the indestructible human spirit.';
	@override String get cta => 'EXPLORE THE COLLECTION';
	@override String get worksValue => '200+';
	@override String get worksLabel => 'Works of Art';
	@override String get panelsValue => '6+';
	@override String get panelsLabel => 'Monumental panels in Minsk';
	@override String get guinnessValue => '1';
	@override String get guinnessLabel => 'Guinness art record';
}

// Path: bio.universalRealism
class _TranslationsBioUniversalRealismEn extends TranslationsBioUniversalRealismRu {
	_TranslationsBioUniversalRealismEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Founder of Universal Realism';
	@override String get body => 'Kishchanka did not merely depict reality — he created a new system of coordinates, which he called Universal Realism. At the heart of his method lies the conviction that the artist is a weaver of time, obligated to connect past and future. His art transcended national boundaries, operating in terms of global human drama. For Kishchanka, man is a demigod whose actions resonate on a universal scale. In his works, shadows become autonomous forms, and colour becomes cosmic music subject to a strict higher order.';
}

// Path: bio.tapestry
class _TranslationsBioTapestryEn extends TranslationsBioTapestryRu {
	_TranslationsBioTapestryEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tapestry of the Century: The Pinnacle of World Weaving';
	@override String get intro => 'Alexander Kishchanka entered history as the author of the world\'s largest tapestry, officially listed in the Guinness Book of Records.';
	@override String get scaleLabel => 'Scale';
	@override String get scale => 'A canvas measuring 19 × 14 metres (approx. 300 sq. m), weighing over a tonne.';
	@override String get conceptLabel => 'Concept';
	@override String get concept => 'A grandiose fabric of history, in which the destinies of 80 iconic figures are interwoven — from Christ and the Madonna to Churchill, Castro and Gorbachev.';
	@override String get meaningLabel => 'Significance';
	@override String get meaning => 'This work is a temple-piece, at the centre of which the eternal conflict between creation and destruction unfolds. It was recognised as a national treasure of Belarus.';
}

// Path: bio.chernobyl
class _TranslationsBioChernobylEn extends TranslationsBioChernobylRu {
	_TranslationsBioChernobylEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chernobyl: The Voice of a Nation in the Halls of the UN';
	@override String get body => 'One of the master\'s most emotionally powerful works was the tapestry Chernobyl (1991). Presented as a gift to the United Nations, it still adorns the UN headquarters in New York. When the world saw this work, UN Secretary-General Javier Pérez de Cuéllar compared it to Picasso\'s Guernica. For Kishchanka, this tapestry was not merely a memorial to the tragedy, but the eyes of Belarus — a planetary warning about the fragility of life, woven by the hands of great Belarusian craftswomen.';
}

// Path: bio.mosaic
class _TranslationsBioMosaicEn extends TranslationsBioMosaicRu {
	_TranslationsBioMosaicEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'The Face of the City: The Vostok Mosaic Panels';
	@override String get intro => 'Kishchanka shaped the visual identity of modern Minsk. His famous mosaics on residential high-rises in the Vostok-1 district became the hallmark of the capital.';
	@override String get panelsLabel => 'Four monumental works';
	@override String get panels => 'City-Warrior, City of Science, City of Culture, and City-Builder.';
	@override String get panelsMeaning => 'These works transformed standard housing blocks into an artistic space, where the triumph of the human spirit is celebrated through smalt and stone.';
}

// Path: bio.legacy
class _TranslationsBioLegacyEn extends TranslationsBioLegacyRu {
	_TranslationsBioLegacyEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Legacy';
	@override String get body => 'Alexander Kishchanka left behind not only canvases housed in the Tretyakov Gallery and private collections of world leaders (B. Clinton, F. Mitterrand), but an entire school of Belarusian monumental tapestry. The Borisov Decorative and Applied Arts Combine, where his great tapestries were created, now bears his name.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'KISHCHANKA.ART',
			'navigation.aboutAuthor' => 'About author',
			'navigation.news' => 'News',
			'navigation.catalogOfWorks' => 'Catalog of works',
			'navigation.archive' => 'Archive',
			'navigation.contacts' => 'Contacts',
			'catalog.workPrefix' => 'Work',
			'catalog.paintingNames.id1958_1' => 'Outskirts. The Old Mill',
			'catalog.paintingNames.id1958_2' => 'Angelina',
			'catalog.paintingNames.id1958_3' => 'Toilette',
			'catalog.paintingNames.id1959_1' => 'Female Portrait',
			'catalog.paintingNames.id1960_1' => 'Composition No. 1',
			'catalog.paintingNames.id1960_2' => 'Female Portrait in Green Tones',
			'catalog.paintingNames.id1960_3' => 'First Snow',
			'catalog.paintingNames.id1960_4' => 'Woman in an Armchair',
			'catalog.paintingNames.id1960_5' => 'Portrait of Artist Vladimir Urishchenko',
			'catalog.paintingNames.id1960_6' => 'Girl with a Bow',
			'catalog.paintingNames.id1960_7' => 'Female Portrait',
			'catalog.paintingNames.id1960_8' => 'Female Portrait',
			'catalog.paintingNames.id1960_9' => 'Expectation',
			'catalog.paintingNames.id1962_1' => 'Northern Woman (Woman from the North)',
			'catalog.paintingNames.id1965_1' => 'Female Portrait',
			'catalog.paintingNames.id1965_2' => 'Circus Boy',
			'catalog.paintingNames.id1965_3' => 'Temptation',
			'catalog.paintingNames.id1967_1' => 'Zoya Litvinova',
			'catalog.paintingNames.id1967_2' => 'Two Lives',
			'catalog.paintingNames.id1968_1' => 'Still Life with Pears',
			'catalog.paintingNames.id1969_1' => 'Angel',
			'catalog.paintingNames.id1970_1' => 'The Teacher',
			'catalog.paintingNames.id1970_2' => 'The Last Sevastopolian',
			'catalog.paintingNames.id1972_1' => 'Portrait of Zhenya Musinskaya',
			'catalog.paintingNames.id1974_1' => 'Girl in Russian Costume',
			'catalog.paintingNames.id1975_1' => 'The Firstborn',
			'catalog.paintingNames.id1976_1' => 'Girl in Red and Gold (Green Grapes)',
			'catalog.paintingNames.id1979_1' => 'Mother with Child',
			'catalog.paintingNames.id1979_2' => 'Natasha',
			'catalog.paintingNames.id1979_3' => 'The Murder of the Gromov Family. Action 1943. Taman.',
			'catalog.paintingNames.id1979_4' => 'Sketch for "The Poet\'s Pain"',
			'catalog.paintingNames.id1979_5' => 'Joy. Motherhood',
			'catalog.paintingNames.id1980_1' => 'Fragment for the Painting "Honey"',
			'catalog.paintingNames.id1980_2' => 'Portrait of Mother',
			'catalog.paintingNames.id1980_3' => 'Nina',
			'catalog.paintingNames.id1980_4' => 'Natasha Marchenko',
			'catalog.paintingNames.id1980_5' => 'Natasha',
			'catalog.paintingNames.id1981_1' => 'Reverie',
			'catalog.paintingNames.id1981_2' => 'Portrait of Elena Obraztsova',
			'catalog.paintingNames.id1982_1' => 'Self-Portrait',
			'catalog.paintingNames.id1982_2' => 'Adam and Eve',
			'catalog.paintingNames.id1982_3' => 'Desecration of the Temple',
			'catalog.paintingNames.id1982_4' => 'Obscurantists',
			'catalog.paintingNames.id1982_5' => 'Sunflowers',
			'catalog.paintingNames.id1982_6' => 'Landscape',
			'catalog.paintingNames.id1983_1' => 'Madonna',
			'catalog.paintingNames.id1983_2' => 'Conspiracy (The Freemasons\' Oath)',
			'catalog.paintingNames.id1983_3' => 'Nina',
			'catalog.paintingNames.id1983_4' => 'Portrait of Maria Bieshu',
			'catalog.paintingNames.id1983_5' => 'The Call of the Sea',
			'catalog.paintingNames.id1983_6' => 'Weeping',
			'catalog.paintingNames.id1983_7' => 'Natasha',
			'catalog.paintingNames.id1984_1' => 'Nina',
			'catalog.paintingNames.id1984_2' => 'Nina',
			'catalog.paintingNames.id1985_1' => 'Uncle Vanya',
			'catalog.paintingNames.id1985_2' => 'Girl in a Red Hat',
			'catalog.paintingNames.id1985_3' => 'Female Image. Natasha Tatarenko',
			'catalog.paintingNames.id1985_4' => 'Male Portrait',
			'catalog.paintingNames.id1985_5' => 'Summer Shower',
			'catalog.paintingNames.id1986_1' => 'Portrait of a Girl',
			'catalog.paintingNames.id1986_2' => 'Portrait of Cinematographer A. Abadovsky',
			'catalog.paintingNames.id1986_3' => 'The Last Days of September',
			'catalog.paintingNames.id1986_4' => 'Portrait of Bushchik',
			'catalog.paintingNames.id1986_5' => 'Portrait of Natasha Marchenko',
			'catalog.paintingNames.id1987_1' => 'He Will Live. Chernobyl',
			'catalog.paintingNames.id1987_2' => 'Female Portrait',
			'catalog.paintingNames.id1988_1' => 'Portrait of Masha',
			'catalog.paintingNames.id1988_2' => 'Male Head',
			'catalog.paintingNames.id1988_3' => 'Profile',
			'catalog.paintingNames.id1988_4' => 'Walking Woman',
			'catalog.paintingNames.id1989_1' => 'On the Banks of the Don',
			'catalog.paintingNames.id1989_2' => 'Morning',
			'catalog.paintingNames.id1989_3' => 'Portrait of the Artist Tamara Kirshchina',
			'catalog.paintingNames.id1989_4' => 'Nude in the Space of Music',
			'catalog.paintingNames.id1989_5' => 'Walking Woman (The Universe)',
			'catalog.paintingNames.id1989_6' => 'Nina',
			'catalog.paintingNames.id1989_7' => 'Brother and Sister Yelkiny',
			'catalog.paintingNames.id1989_8' => 'Nina',
			'catalog.paintingNames.id1989_9' => 'Nude',
			'catalog.paintingNames.id1990_1' => 'In Space (Nude)',
			'catalog.paintingNames.id1990_2' => 'Gifts of the Planets',
			'catalog.paintingNames.id1990_3' => 'Zoya',
			'catalog.paintingNames.id1990_4' => 'Male Portrait',
			'catalog.paintingNames.id1990_5' => 'On the Balcony',
			'catalog.paintingNames.id1991_1' => 'Girl with Honey (The Universe)',
			'catalog.paintingNames.id1991_2' => 'Dream',
			'catalog.paintingNames.id1991_3' => 'The Eternal',
			'catalog.paintingNames.id1992_1' => 'Portrait with a Seashell',
			'catalog.paintingNames.id1992_2' => 'Satyr and Nymph',
			'catalog.paintingNames.id1992_3' => 'Boy with a Rooster',
			'catalog.paintingNames.id1992_4' => 'Nina and Maxim',
			'catalog.paintingNames.id1992_5' => 'Russian Peasant',
			'catalog.paintingNames.id1992_6' => 'Portrait of Franz Koch',
			'catalog.paintingNames.id1992_7' => 'Nina',
			'catalog.paintingNames.id1992_8' => 'Olga',
			'catalog.paintingNames.id1992_9' => 'Don\'t Misbehave, Maxim!',
			'catalog.paintingNames.id1992_10' => 'Tapestry "Sunflowers"',
			'catalog.paintingNames.id1993_1' => 'The Eternal',
			'catalog.paintingNames.id1993_2' => 'Portrait of the Sculptor Lena Kharaberyush',
			'catalog.paintingNames.id1993_3' => 'The Apothecary',
			'catalog.paintingNames.id1993_4' => 'Olya',
			'catalog.paintingNames.id1993_5' => 'Mother and Child',
			'catalog.paintingNames.id1993_6' => 'Christ',
			'catalog.paintingNames.id1993_7' => 'Natasha',
			'catalog.paintingNames.id1993_8' => 'Portrait of an Unknown Woman',
			'catalog.paintingNames.id1993_9' => 'Roman',
			'catalog.paintingNames.id1994_1' => 'Under the Constellation of Leo',
			'catalog.paintingNames.id1994_2' => 'Portrait of Zoya',
			'catalog.paintingNames.id1994_3' => 'The Abandoned Courtyard',
			'catalog.paintingNames.id1994_4' => 'Natasha',
			'catalog.paintingNames.id1994_5' => 'Song',
			'catalog.paintingNames.id1994_6' => 'Girl with a Still Life with Apples',
			'catalog.paintingNames.id1994_7' => 'The Screaming Woman',
			'catalog.paintingNames.id1994_8' => 'Natasha',
			'catalog.paintingNames.id1994_9' => 'Bacchanalia',
			'catalog.paintingNames.id1995_1' => 'Little Dreamer',
			'catalog.paintingNames.id1995_2' => 'My Homeland',
			'catalog.paintingNames.id1995_3' => 'Nude',
			'catalog.paintingNames.id1995_4' => 'Olga Koltakova',
			'catalog.paintingNames.id1995_5' => 'Tamara Kirshchina from Behind',
			'catalog.paintingNames.id1995_6' => 'Olya',
			'catalog.paintingNames.id1995_7' => 'Sadness',
			'catalog.paintingNames.id1995_8' => 'Portrait of a Girl',
			'catalog.paintingNames.id1995_9' => 'The Universe',
			'catalog.paintingNames.id1995_10' => 'Lyosha',
			'catalog.paintingNames.id1995_11' => 'Portrait of Rostikov',
			'catalog.paintingNames.id1995_12' => 'Art Critic Nadya',
			'catalog.paintingNames.id1995_13' => 'Melody',
			'catalog.paintingNames.id1995_14' => 'Tanya',
			'catalog.paintingNames.id1995_15' => 'Sketch for the Painting «Portrait of Nina»',
			'catalog.paintingNames.id1995_16' => 'Still Life',
			'catalog.paintingNames.id1995_17' => 'Tapestry "The Sea" ("The Wave")',
			'catalog.paintingNames.id1996_1' => 'Still Life with Apples',
			'catalog.paintingNames.id1996_2' => 'Nude',
			'catalog.paintingNames.id1996_3' => 'Maxim with a Watermelon',
			'catalog.paintingNames.id1996_4' => 'Hymn (Rapture)',
			'catalog.paintingNames.id1996_5' => 'Nina',
			'catalog.paintingNames.id1996_6' => 'Inna',
			'catalog.paintingNames.id1996_7' => 'Alla Astakhovich',
			'catalog.paintingNames.id1996_8' => 'Lena',
			'catalog.paintingNames.id1996_9' => 'Female Portrait (Nina No. 1)',
			'catalog.paintingNames.id1996_10' => 'Universe',
			'catalog.paintingNames.id1996_11' => 'Floating in a Boat',
			'catalog.paintingNames.id1996_12' => 'Female Portrait with a Shawl',
			'catalog.paintingNames.id1996_13' => 'Mom',
			'catalog.paintingNames.id1996_14' => 'Filaret of Minsk',
			'catalog.paintingNames.id1996_15' => 'Still Life in Space',
			'catalog.paintingNames.id1996_16' => 'Portrait of Kuchinsky',
			'catalog.paintingNames.id1996_17' => 'Female Portrait',
			'catalog.paintingNames.id1996_18' => 'My Universe',
			'catalog.paintingNames.id1997_1' => 'Ivan',
			'catalog.paintingNames.id1997_2' => 'Portrait of Architect Vladimir Salazkin',
			'catalog.paintingNames.id1997_3' => 'War of the Worlds (Last Work)',
			'catalog.paintingNames.id1997_4' => 'Self-Portrait',
			'catalog.paintingNames.id1997_5' => 'Summer in Boguchar',
			'catalog.paintingNames.id1997_6' => 'Two Widows',
			'catalog.paintingNames.idunknown_1' => 'The Flood',
			'catalog.paintingNames.idunknown_2' => 'Female Portrait',
			'catalog.paintingNames.idunknown_3' => 'Blue Thorns',
			'catalog.paintingNames.idunknown_4' => 'Nina',
			'catalog.paintingNames.idunknown_5' => 'Nina',
			'common.pageNotFound' => 'Page not found',
			'common.viewCatalog' => 'VIEW CATALOG',
			'common.learnMore' => 'LEARN MORE',
			'language.label' => 'Language',
			'language.russian' => 'Russian',
			'language.english' => 'English',
			'language.spanish' => 'Spanish',
			'language.french' => 'French',
			'language.german' => 'German',
			'language.belarusian' => 'Belarusian',
			'bio.heroTitle' => 'ART OF COSMIC SCALE',
			'bio.heroSubtitle' => 'Art that erases boundaries between the earthly and the eternal. People\'s Artist of the Republic of Belarus, creator of the world\'s largest tapestry "The Tapestry of the Century".',
			'bio.name' => 'Alexander Mikhailovich Kishchanka (1933–1997)',
			'bio.tagline' => 'Painter. Philosopher. Monumentalist. Founder of Universal Realism.',
			'bio.intro' => 'Alexander Kishchanka is a figure of Renaissance stature in 20th-century art. A man who transformed the soft thread of tapestry into a powerful architectural statement, and city walls into open books of philosophical meaning. His work is a bridge between the archaic and the cosmic, between the pain of the earth and the light of distant galaxies.',
			'bio.feature.title' => 'LEGACY OF GLOBAL SCALE',
			'bio.feature.body' => 'This collection brings together works by an outstanding master whose art forever changed the understanding of monumental painting and tapestry. From the grand mosaics that became a visual code of Minsk to the celebrated Tapestry of the Century and the Chernobyl canvas displayed at United Nations Headquarters in New York, every work by Kishchanka is a philosophical treatise on the connection of times, the cosmos, and the indestructible human spirit.',
			'bio.feature.cta' => 'EXPLORE THE COLLECTION',
			'bio.feature.worksValue' => '200+',
			'bio.feature.worksLabel' => 'Works of Art',
			'bio.feature.panelsValue' => '6+',
			'bio.feature.panelsLabel' => 'Monumental panels in Minsk',
			'bio.feature.guinnessValue' => '1',
			'bio.feature.guinnessLabel' => 'Guinness art record',
			'bio.universalRealism.title' => 'Founder of Universal Realism',
			'bio.universalRealism.body' => 'Kishchanka did not merely depict reality — he created a new system of coordinates, which he called Universal Realism. At the heart of his method lies the conviction that the artist is a weaver of time, obligated to connect past and future. His art transcended national boundaries, operating in terms of global human drama. For Kishchanka, man is a demigod whose actions resonate on a universal scale. In his works, shadows become autonomous forms, and colour becomes cosmic music subject to a strict higher order.',
			'bio.tapestry.title' => 'Tapestry of the Century: The Pinnacle of World Weaving',
			'bio.tapestry.intro' => 'Alexander Kishchanka entered history as the author of the world\'s largest tapestry, officially listed in the Guinness Book of Records.',
			'bio.tapestry.scaleLabel' => 'Scale',
			'bio.tapestry.scale' => 'A canvas measuring 19 × 14 metres (approx. 300 sq. m), weighing over a tonne.',
			'bio.tapestry.conceptLabel' => 'Concept',
			'bio.tapestry.concept' => 'A grandiose fabric of history, in which the destinies of 80 iconic figures are interwoven — from Christ and the Madonna to Churchill, Castro and Gorbachev.',
			'bio.tapestry.meaningLabel' => 'Significance',
			'bio.tapestry.meaning' => 'This work is a temple-piece, at the centre of which the eternal conflict between creation and destruction unfolds. It was recognised as a national treasure of Belarus.',
			'bio.chernobyl.title' => 'Chernobyl: The Voice of a Nation in the Halls of the UN',
			'bio.chernobyl.body' => 'One of the master\'s most emotionally powerful works was the tapestry Chernobyl (1991). Presented as a gift to the United Nations, it still adorns the UN headquarters in New York. When the world saw this work, UN Secretary-General Javier Pérez de Cuéllar compared it to Picasso\'s Guernica. For Kishchanka, this tapestry was not merely a memorial to the tragedy, but the eyes of Belarus — a planetary warning about the fragility of life, woven by the hands of great Belarusian craftswomen.',
			'bio.mosaic.title' => 'The Face of the City: The Vostok Mosaic Panels',
			'bio.mosaic.intro' => 'Kishchanka shaped the visual identity of modern Minsk. His famous mosaics on residential high-rises in the Vostok-1 district became the hallmark of the capital.',
			'bio.mosaic.panelsLabel' => 'Four monumental works',
			'bio.mosaic.panels' => 'City-Warrior, City of Science, City of Culture, and City-Builder.',
			'bio.mosaic.panelsMeaning' => 'These works transformed standard housing blocks into an artistic space, where the triumph of the human spirit is celebrated through smalt and stone.',
			'bio.legacy.title' => 'Legacy',
			'bio.legacy.body' => 'Alexander Kishchanka left behind not only canvases housed in the Tretyakov Gallery and private collections of world leaders (B. Clinton, F. Mitterrand), but an entire school of Belarusian monumental tapestry. The Borisov Decorative and Applied Arts Combine, where his great tapestries were created, now bears his name.',
			'bio.quote' => 'Art is a divine phenomenon. Only it is given the power to stop time. Art can unravel the mystery of the future and also restore the lost past.',
			'bio.quoteAuthor' => '— Alexander Kishchanka',
			_ => null,
		};
	}
}
