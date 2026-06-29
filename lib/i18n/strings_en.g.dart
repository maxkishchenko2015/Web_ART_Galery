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
	@override late final _Translations$app$en app = _Translations$app$en._(_root);
	@override late final _Translations$navigation$en navigation = _Translations$navigation$en._(_root);
	@override late final _Translations$catalog$en catalog = _Translations$catalog$en._(_root);
	@override late final _Translations$common$en common = _Translations$common$en._(_root);
	@override late final _Translations$tour$en tour = _Translations$tour$en._(_root);
	@override late final _Translations$language$en language = _Translations$language$en._(_root);
	@override late final _Translations$archiveFeed$en archiveFeed = _Translations$archiveFeed$en._(_root);
	@override late final _Translations$films$en films = _Translations$films$en._(_root);
	@override late final _Translations$newsFeed$en newsFeed = _Translations$newsFeed$en._(_root);
	@override late final _Translations$bio$en bio = _Translations$bio$en._(_root);
	@override late final _Translations$contacts$en contacts = _Translations$contacts$en._(_root);
	@override late final _Translations$seo$en seo = _Translations$seo$en._(_root);
}

// Path: app
class _Translations$app$en extends Translations$app$ru {
	_Translations$app$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'KISHCHANKA.ART';
	@override String get brandTagline => 'Collection of Fine Arts';
	@override String get logoMark => 'KA';
}

// Path: navigation
class _Translations$navigation$en extends Translations$navigation$ru {
	_Translations$navigation$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get aboutAuthor => 'About author';
	@override String get news => 'News';
	@override String get catalogOfWorks => 'Catalog of works';
	@override String get films => 'Films';
	@override String get archive => 'Archive';
	@override String get contacts => 'Contacts';
}

// Path: catalog
class _Translations$catalog$en extends Translations$catalog$ru {
	_Translations$catalog$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get workPrefix => 'Work';
	@override String get errorTitle => 'Failed to load paintings';
	@override String errorWithDetails({required Object message}) => 'Failed to load paintings. ${message}';
	@override late final _Translations$catalog$decade$en decade = _Translations$catalog$decade$en._(_root);
	@override late final _Translations$catalog$paintingNames$en paintingNames = _Translations$catalog$paintingNames$en._(_root);
	@override late final _Translations$catalog$paintingMediums$en paintingMediums = _Translations$catalog$paintingMediums$en._(_root);
}

// Path: common
class _Translations$common$en extends Translations$common$ru {
	_Translations$common$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get pageNotFound => 'Page not found';
	@override String get retry => 'Retry';
	@override String get errorTitle => 'Something went wrong';
	@override String get viewCatalog => 'VIEW CATALOG';
	@override String get learnMore => 'LEARN MORE';
	@override late final _Translations$common$video$en video = _Translations$common$video$en._(_root);
}

// Path: tour
class _Translations$tour$en extends Translations$tour$ru {
	_Translations$tour$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get next => 'Next';
	@override String get gotIt => 'Got it';
	@override String get back => 'Back';
	@override String get chernobylBody => 'Kishchanka is also the author of the "Chernobyl" tapestry (1991), which was gifted to the United Nations and still adorns its New York headquarters. The UN Secretary-General compared it to Picasso\'s Guernica.';
	@override String get originsTitle => 'At the origins of "Universal Realism"';
	@override String get originsBody => 'Alexander Mikhailovich Kishchanka (1933–1997). Painter. Philosopher. Monumentalist. Born in the hamlet of Bely Kolodez (today the Boguchar District, Voronezh Region), he won worldwide renown as the author of the world\'s largest tapestry — the "Tapestry of the Century".';
	@override String get scaleTitle => 'Scale of the Tapestry of the Century';
	@override String get scaleBody => 'The "Tapestry of the Century" is a hand-woven canvas measuring 19 × 14 metres (as tall as a five-storey building) and weighing over a tonne. In 1999 it was entered into the Guinness Book of Records as the largest tapestry in the world.';
}

// Path: language
class _Translations$language$en extends Translations$language$ru {
	_Translations$language$en._(TranslationsEn root) : this._root = root, super.internal(root);

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

// Path: archiveFeed
class _Translations$archiveFeed$en extends Translations$archiveFeed$ru {
	_Translations$archiveFeed$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Archive & Publications';
	@override String get latestLabel => 'Latest publication';
	@override String get moreLabel => 'News and references';
	@override String get openArticle => 'Open article';
	@override String get sourceLabel => 'Source';
	@override String yearLabel({required Object year}) => '${year}';
	@override late final _Translations$archiveFeed$items$en items = _Translations$archiveFeed$items$en._(_root);
}

// Path: films
class _Translations$films$en extends Translations$films$ru {
	_Translations$films$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Films & Documentaries';
	@override String get subtitle => 'Video archive about A. Kishchenko';
	@override String get latestLabel => 'Latest film';
	@override String get sourceLabel => 'Source';
	@override String get instagramTitle => 'Instagram';
	@override String get instagramSubtitle => 'Short videos and stories';
	@override late final _Translations$films$watchOn$en watchOn = _Translations$films$watchOn$en._(_root);
	@override late final _Translations$films$items$en items = _Translations$films$items$en._(_root);
}

// Path: newsFeed
class _Translations$newsFeed$en extends Translations$newsFeed$ru {
	_Translations$newsFeed$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'News';
	@override String get subtitle => 'Publications, exhibitions, and events';
	@override String get emptyState => 'No news yet. Check back soon.';
	@override String get errorTitle => 'Failed to load news';
	@override String get retry => 'Retry';
	@override String get back => 'Back to news';
	@override String get sourceLabel => 'Source';
	@override String get readTimeLabel => 'Read time';
	@override String readTimeValue({required Object minutes}) => '${minutes} min';
	@override String get viewsLabel => 'Views';
	@override String get publishedLabel => 'Published';
}

// Path: bio
class _Translations$bio$en extends Translations$bio$ru {
	_Translations$bio$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get heroTitle => 'ART OF COSMIC SCALE';
	@override String get heroSubtitle => 'Art that erases boundaries between the earthly and the eternal. People\'s Artist of the Republic of Belarus, creator of the world\'s largest tapestry "The Tapestry of the Century".';
	@override String get heroBrandName => 'Alexander Mikhailovich Kishchanka';
	@override String get name => 'Alexander Mikhailovich Kishchanka (1933–1997)';
	@override String get tagline => 'Painter. Philosopher. Monumentalist. Founder of Universal Realism.';
	@override String get intro => 'Alexander Kishchanka is a figure of Renaissance stature in 20th-century art. A man who transformed the soft thread of tapestry into a powerful architectural statement, and city walls into open books of philosophical meaning. His work is a bridge between the archaic and the cosmic, between the pain of the earth and the light of distant galaxies.';
	@override late final _Translations$bio$feature$en feature = _Translations$bio$feature$en._(_root);
	@override late final _Translations$bio$universalRealism$en universalRealism = _Translations$bio$universalRealism$en._(_root);
	@override late final _Translations$bio$tapestry$en tapestry = _Translations$bio$tapestry$en._(_root);
	@override late final _Translations$bio$chernobyl$en chernobyl = _Translations$bio$chernobyl$en._(_root);
	@override late final _Translations$bio$mosaic$en mosaic = _Translations$bio$mosaic$en._(_root);
	@override late final _Translations$bio$legacy$en legacy = _Translations$bio$legacy$en._(_root);
	@override String get quote => 'Art is a divine phenomenon. Only it is given the power to stop time. Art can unravel the mystery of the future and also restore the lost past.';
	@override String get quoteAuthor => '— Alexander Kishchanka';
	@override String get wikipediaLinkLabel => 'READ ON WIKIPEDIA';
}

// Path: contacts
class _Translations$contacts$en extends Translations$contacts$ru {
	_Translations$contacts$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Contacts';
	@override String get tagline => 'Get in touch with the studio.';
	@override String get phoneSectionLabel => 'Phone';
	@override String get phoneSectionHint => 'Calls and WhatsApp';
	@override String get instagramSectionLabel => 'Instagram';
	@override String get instagramHandle => '@kishchenko.art';
	@override String get vkSectionLabel => 'VK';
	@override String get vkHandle => 'aleksandrkishchenko';
	@override String get vkScanQrHint => 'Scan the QR to open VK';
	@override String get studioSectionTitle => 'Author\'s studio';
	@override String get studioAddress => 'Minsk, 44 Surganova St., 7th floor';
	@override String get openInOsm => 'OPEN IN OPENSTREETMAP';
	@override String get mapAttribution => '© OpenStreetMap contributors';
}

// Path: seo
class _Translations$seo$en extends Translations$seo$ru {
	_Translations$seo$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _Translations$seo$aboutAuthor$en aboutAuthor = _Translations$seo$aboutAuthor$en._(_root);
	@override late final _Translations$seo$catalog$en catalog = _Translations$seo$catalog$en._(_root);
	@override late final _Translations$seo$news$en news = _Translations$seo$news$en._(_root);
	@override late final _Translations$seo$films$en films = _Translations$seo$films$en._(_root);
	@override late final _Translations$seo$archive$en archive = _Translations$seo$archive$en._(_root);
	@override late final _Translations$seo$contacts$en contacts = _Translations$seo$contacts$en._(_root);
}

// Path: catalog.decade
class _Translations$catalog$decade$en extends Translations$catalog$decade$ru {
	_Translations$catalog$decade$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get all => 'All';
	@override String get sixties => '60s';
	@override String get seventies => '70s';
	@override String get eighties => '80s';
	@override String get nineties => '90s';
}

// Path: catalog.paintingNames
class _Translations$catalog$paintingNames$en extends Translations$catalog$paintingNames$ru {
	_Translations$catalog$paintingNames$en._(TranslationsEn root) : this._root = root, super.internal(root);

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

// Path: catalog.paintingMediums
class _Translations$catalog$paintingMediums$en extends Translations$catalog$paintingMediums$ru {
	_Translations$catalog$paintingMediums$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get canvasOil => 'Canvas, oil';
	@override String get hardboardOil => 'Hardboard, oil';
	@override String get cardboard => 'Cardboard';
	@override String get woolLinenWeaving => 'Wool, linen, weaving';
}

// Path: common.video
class _Translations$common$video$en extends Translations$common$video$ru {
	_Translations$common$video$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get loadError => 'Failed to load video stream';
	@override String get openExternally => 'Open externally';
}

// Path: archiveFeed.items
class _Translations$archiveFeed$items$en extends Translations$archiveFeed$items$ru {
	_Translations$archiveFeed$items$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _Translations$archiveFeed$items$boguchar2026$en boguchar2026 = _Translations$archiveFeed$items$boguchar2026$en._(_root);
	@override late final _Translations$archiveFeed$items$priorbankChtobyChuvstvovat$en priorbankChtobyChuvstvovat = _Translations$archiveFeed$items$priorbankChtobyChuvstvovat$en._(_root);
	@override late final _Translations$archiveFeed$items$nitiSudby$en nitiSudby = _Translations$archiveFeed$items$nitiSudby$en._(_root);
	@override late final _Translations$archiveFeed$items$boguchar2024$en boguchar2024 = _Translations$archiveFeed$items$boguchar2024$en._(_root);
	@override late final _Translations$archiveFeed$items$belgazprombankKraskiPobedy$en belgazprombankKraskiPobedy = _Translations$archiveFeed$items$belgazprombankKraskiPobedy$en._(_root);
	@override late final _Translations$archiveFeed$items$nebaZiamlja$en nebaZiamlja = _Translations$archiveFeed$items$nebaZiamlja$en._(_root);
}

// Path: films.watchOn
class _Translations$films$watchOn$en extends Translations$films$watchOn$ru {
	_Translations$films$watchOn$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get youtube => 'Watch on YouTube';
	@override String get googleDrive => 'Watch on Google Drive';
	@override String get instagram => 'Open on Instagram';
}

// Path: films.items
class _Translations$films$items$en extends Translations$films$items$ru {
	_Translations$films$items$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _Translations$films$items$ispovedVremeni$en ispovedVremeni = _Translations$films$items$ispovedVremeni$en._(_root);
	@override late final _Translations$films$items$aleksandrKishchenko$en aleksandrKishchenko = _Translations$films$items$aleksandrKishchenko$en._(_root);
	@override late final _Translations$films$items$voronezhKramskoyExhibition$en voronezhKramskoyExhibition = _Translations$films$items$voronezhKramskoyExhibition$en._(_root);
	@override late final _Translations$films$items$mastersOfSovietArt1988$en mastersOfSovietArt1988 = _Translations$films$items$mastersOfSovietArt1988$en._(_root);
	@override late final _Translations$films$items$bogucharLecture$en bogucharLecture = _Translations$films$items$bogucharLecture$en._(_root);
	@override late final _Translations$films$items$culturalCodesTapestries$en culturalCodesTapestries = _Translations$films$items$culturalCodesTapestries$en._(_root);
	@override late final _Translations$films$items$tapestryOfCenturyMinsk$en tapestryOfCenturyMinsk = _Translations$films$items$tapestryOfCenturyMinsk$en._(_root);
	@override late final _Translations$films$items$chernobylTapestryFacts$en chernobylTapestryFacts = _Translations$films$items$chernobylTapestryFacts$en._(_root);
	@override late final _Translations$films$items$kishchenkoReel1$en kishchenkoReel1 = _Translations$films$items$kishchenkoReel1$en._(_root);
}

// Path: bio.feature
class _Translations$bio$feature$en extends Translations$bio$feature$ru {
	_Translations$bio$feature$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'LEGACY OF GLOBAL SCALE';
	@override String get body => 'This collection brings together works by an outstanding master whose art forever changed the understanding of monumental painting and tapestry. From the grand mosaics that became a visual code of Minsk to the celebrated Tapestry of the Century and the Chernobyl canvas displayed at United Nations Headquarters in New York, every work by Kishchanka is a philosophical treatise on the connection of times, the cosmos, and the indestructible human spirit.';
	@override String get cta => 'EXPLORE THE COLLECTION';
	@override String get worksValue => '500+';
	@override String get worksLabel => 'Works of art around the world';
	@override String get panelsValue => '6+';
	@override String get panelsLabel => 'Monumental panels in Minsk';
	@override String get guinnessValue => '';
	@override String get guinnessLabel => 'Guinness art record';
	@override String get unGiftValue => '';
	@override String get unGiftLabel => 'A gift to the UN from the Republic of Belarus';
}

// Path: bio.universalRealism
class _Translations$bio$universalRealism$en extends Translations$bio$universalRealism$ru {
	_Translations$bio$universalRealism$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Founder of Universal Realism';
	@override String get body => 'Kishchanka did not merely depict reality — he created a new system of coordinates, which he called Universal Realism. At the heart of his method lies the conviction that the artist is a weaver of time, obligated to connect past and future. His art transcended national boundaries, operating in terms of global human drama. For Kishchanka, man is a demigod whose actions resonate on a universal scale. In his works, shadows become autonomous forms, and colour becomes cosmic music subject to a strict higher order.';
}

// Path: bio.tapestry
class _Translations$bio$tapestry$en extends Translations$bio$tapestry$ru {
	_Translations$bio$tapestry$en._(TranslationsEn root) : this._root = root, super.internal(root);

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
class _Translations$bio$chernobyl$en extends Translations$bio$chernobyl$ru {
	_Translations$bio$chernobyl$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chernobyl: The Voice of a Nation in the Halls of the UN';
	@override String get body => 'One of the master\'s most emotionally powerful works was the tapestry Chernobyl (1991). Presented as a gift to the United Nations, it still adorns the UN headquarters in New York. When the world saw this work, UN Secretary-General Javier Pérez de Cuéllar compared it to Picasso\'s Guernica. For Kishchanka, this tapestry was not merely a memorial to the tragedy, but the eyes of Belarus — a planetary warning about the fragility of life, woven by the hands of great Belarusian craftswomen.';
}

// Path: bio.mosaic
class _Translations$bio$mosaic$en extends Translations$bio$mosaic$ru {
	_Translations$bio$mosaic$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'The Face of the City: The Vostok Mosaic Panels';
	@override String get intro => 'Kishchanka shaped the visual identity of modern Minsk. His famous mosaics on residential high-rises in the Vostok-1 district became the hallmark of the capital.';
	@override String get panelsLabel => 'Four monumental works';
	@override String get panels => 'City-Warrior, City of Science, City of Culture, and City-Builder.';
	@override String get panelsMeaning => 'These works transformed standard housing blocks into an artistic space, where the triumph of the human spirit is celebrated through smalt and stone.';
}

// Path: bio.legacy
class _Translations$bio$legacy$en extends Translations$bio$legacy$ru {
	_Translations$bio$legacy$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Legacy';
	@override String get body => 'Alexander Kishchanka left behind not only canvases housed in the Tretyakov Gallery and private collections of world leaders (B. Clinton, F. Mitterrand), but an entire school of Belarusian monumental tapestry. The Borisov Decorative and Applied Arts Combine, where his great tapestries were created, now bears his name.';
}

// Path: seo.aboutAuthor
class _Translations$seo$aboutAuthor$en extends Translations$seo$aboutAuthor$ru {
	_Translations$seo$aboutAuthor$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Alexander Kishchenko — People\'s Artist of Belarus | KISHCHANKA.ART';
	@override String get description => 'Alexander Mikhailovich Kishchenko (1933–1997) — People\'s Artist of Belarus, painter and monumentalist. Author of the world\'s largest tapestry and the Chernobyl tapestry at the UN.';
	@override String get keywords => 'Alexander Kishchenko, biography, Belarusian artist, monumentalist, tapestry';
}

// Path: seo.catalog
class _Translations$seo$catalog$en extends Translations$seo$catalog$ru {
	_Translations$seo$catalog$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Catalog of Works by Alexander Kishchenko | KISHCHANKA.ART';
	@override String get description => 'Catalog of paintings and tapestries by Alexander Kishchenko: portraits, landscapes, and philosophical works from 1958–1997.';
	@override String get keywords => 'Kishchenko catalog, paintings, tapestries, buy Kishchenko art';
}

// Path: seo.news
class _Translations$seo$news$en extends Translations$seo$news$ru {
	_Translations$seo$news$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'News & Exhibitions | KISHCHANKA.ART';
	@override String get description => 'News, exhibitions, and events related to the legacy of Alexander Kishchenko and the KISHCHANKA.ART gallery.';
	@override String get keywords => 'Kishchenko exhibitions, gallery news, events';
}

// Path: seo.films
class _Translations$seo$films$en extends Translations$seo$films$ru {
	_Translations$seo$films$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Documentary Films about A. Kishchenko | KISHCHANKA.ART';
	@override String get description => 'Documentary films and videos about Alexander Kishchenko, his art, and monumental works.';
	@override String get keywords => 'Kishchenko documentary, film, Tapestry of the Century, video';
}

// Path: seo.archive
class _Translations$seo$archive$en extends Translations$seo$archive$ru {
	_Translations$seo$archive$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Archive & Publications | KISHCHANKA.ART';
	@override String get description => 'Archive of publications and materials about Alexander Kishchenko\'s art and exhibitions.';
	@override String get keywords => 'Kishchenko archive, publications, press, articles';
}

// Path: seo.contacts
class _Translations$seo$contacts$en extends Translations$seo$contacts$ru {
	_Translations$seo$contacts$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Contact | KISHCHANKA.ART';
	@override String get description => 'Contact the KISHCHANKA.ART gallery: studio in Minsk, phone, Instagram and VK.';
	@override String get keywords => 'Kishchenko gallery contact, Minsk studio, buy painting';
}

// Path: archiveFeed.items.boguchar2026
class _Translations$archiveFeed$items$boguchar2026$en extends Translations$archiveFeed$items$boguchar2026$ru {
	_Translations$archiveFeed$items$boguchar2026$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Guided tour «The Life Story of M. A. Kishchenko»';
	@override String get excerpt => 'On 19 February 2026 the Boguchar Museum hosted a guided tour for pupils of the Dyachenkovo village school («Pervyh» movement), introducing them to the life and work of the renowned artist Alexander Mikhailovich Kishchenko.';
}

// Path: archiveFeed.items.priorbankChtobyChuvstvovat
class _Translations$archiveFeed$items$priorbankChtobyChuvstvovat$en extends Translations$archiveFeed$items$priorbankChtobyChuvstvovat$ru {
	_Translations$archiveFeed$items$priorbankChtobyChuvstvovat$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Exhibition «To Feel» — the Priorbank collection';
	@override String get excerpt => 'Priorbank presents its corporate collection of Belarusian painting from the 1960s to the 2000s to the public for the first time, assembled over more than 30 years. The exhibition «To Feel» at the Rumyantsev and Paskevich Palace runs from 10 April to 7 June and features over 70 unique canvases, including three works by Alexander Kishchenko.';
}

// Path: archiveFeed.items.nitiSudby
class _Translations$archiveFeed$items$nitiSudby$en extends Translations$archiveFeed$items$nitiSudby$ru {
	_Translations$archiveFeed$items$nitiSudby$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Alexander Kishchenko. Threads of Fate';
	@override String get excerpt => 'The museum hosted the grand opening of the exhibition «Alexander Kishchenko. Threads of Fate» (12+), dedicated to the work of the outstanding Belarusian artist, a native of the Boguchar district of the Voronezh region. The exhibition is organised to mark the 300th anniversary of the Voronezh Governorate and is part of the region\'s cultural exchange with the Republic of Belarus.';
}

// Path: archiveFeed.items.boguchar2024
class _Translations$archiveFeed$items$boguchar2024$en extends Translations$archiveFeed$items$boguchar2024$ru {
	_Translations$archiveFeed$items$boguchar2024$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Guided tour «The Life Story of A. M. Kishchenko»';
	@override String get excerpt => 'Alexander Mikhailovich Kishchenko was one of the most gifted figures of the Boguchar region — a People\'s Artist of the Republic of Belarus and an honorary citizen of the Boguchar district. A member of the USSR Union of Artists and laureate of the State Prize, he left a vivid mark on the history of art.';
}

// Path: archiveFeed.items.belgazprombankKraskiPobedy
class _Translations$archiveFeed$items$belgazprombankKraskiPobedy$en extends Translations$archiveFeed$items$belgazprombankKraskiPobedy$ru {
	_Translations$archiveFeed$items$belgazprombankKraskiPobedy$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Belgazprombank invites you to the exhibition «Colours of the Great Victory»';
	@override String get excerpt => '28 June 2024. On the eve of the 80th anniversary of Belarus\'s liberation from the Nazi-German invaders, the themed exhibition «Colours of the Great Victory» was solemnly opened in the lobby of the Belgazprombank headquarters. It brings together works by Belarusian artists who knew the horrors of war first-hand — A. Kishchenko, V. Protaseni, I. Stasevich, N. Churabo, I. Rey, P. Daneliya and others.';
}

// Path: archiveFeed.items.nebaZiamlja
class _Translations$archiveFeed$items$nebaZiamlja$en extends Translations$archiveFeed$items$nebaZiamlja$ru {
	_Translations$archiveFeed$items$nebaZiamlja$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'The Sky and the Earth of Alexander Kishchenko';
	@override String get excerpt => 'On 6 May 2023 the National Art Museum of the Republic of Belarus opens the exhibition «The Sky and the Earth of Alexander Kishchenko», dedicated to the scale of his artistic thinking and the significance of the master\'s legacy.';
}

// Path: films.items.ispovedVremeni
class _Translations$films$items$ispovedVremeni$en extends Translations$films$items$ispovedVremeni$ru {
	_Translations$films$items$ispovedVremeni$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'A. Kishchenko. Confession of Time';
	@override String get excerpt => 'A documentary about Alexander Mikhailovich Kishchenko (1933–1997), People\'s Artist of Belarus and author of the world\'s largest tapestry. Directed by V. Korolyov; filming and editing by E. Milkovskiy.';
}

// Path: films.items.aleksandrKishchenko
class _Translations$films$items$aleksandrKishchenko$en extends Translations$films$items$aleksandrKishchenko$ru {
	_Translations$films$items$aleksandrKishchenko$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Alexander Kishchenko';
	@override String get excerpt => 'Television feature on the life and work of Alexander Kishchenko, taking the viewer through his monumental panels in Minsk, the «Tapestry of the Century» and the artist\'s quest for Universal Realism.';
}

// Path: films.items.voronezhKramskoyExhibition
class _Translations$films$items$voronezhKramskoyExhibition$en extends Translations$films$items$voronezhKramskoyExhibition$ru {
	_Translations$films$items$voronezhKramskoyExhibition$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'A. M. Kishchanka exhibition at the I. N. Kramskoy Voronezh Art Museum';
	@override String get excerpt => 'A report on the exhibition of works by the renowned Belarusian artist Alexander Kishchanka at the I. N. Kramskoy Voronezh Regional Art Museum.';
}

// Path: films.items.mastersOfSovietArt1988
class _Translations$films$items$mastersOfSovietArt1988$en extends Translations$films$items$mastersOfSovietArt1988$ru {
	_Translations$films$items$mastersOfSovietArt1988$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'A. Kishchanka. «Masters of Soviet Art» series. 1988 album';
	@override String get excerpt => 'A video review of the 1988 album from the «Masters of Soviet Art» series, dedicated to Alexander Kishchanka\'s paintings and monumental works.';
}

// Path: films.items.bogucharLecture
class _Translations$films$items$bogucharLecture$en extends Translations$films$items$bogucharLecture$ru {
	_Translations$films$items$bogucharLecture$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Lecture «A countryman of world renown». A. M. Kishchanka. Boguchar Museum';
	@override String get excerpt => 'A lecture from the Boguchar Local History Museum about Alexander Mikhailovich Kishchanka — a countryman of world renown, born in the Boguchar district.';
}

// Path: films.items.culturalCodesTapestries
class _Translations$films$items$culturalCodesTapestries$en extends Translations$films$items$culturalCodesTapestries$ru {
	_Translations$films$items$culturalCodesTapestries$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cultural Codes of the Nation: Where are the tapestries of the People\'s Artist Kishchanka now? Main Broadcast';
	@override String get excerpt => 'The «Main Broadcast» programme, in its «Cultural Codes of the Nation» segment, traces the present whereabouts of the tapestries by Belarus\'s People\'s Artist Alexander Kishchanka.';
}

// Path: films.items.tapestryOfCenturyMinsk
class _Translations$films$items$tapestryOfCenturyMinsk$en extends Translations$films$items$tapestryOfCenturyMinsk$ru {
	_Translations$films$items$tapestryOfCenturyMinsk$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Preparing «The Tapestry of the Century» for display at the Development Bank in Minsk';
	@override String get excerpt => 'A behind-the-scenes report on how Alexander Kishchanka\'s «Tapestry of the Century» was prepared for display at the Development Bank in Minsk.';
}

// Path: films.items.chernobylTapestryFacts
class _Translations$films$items$chernobylTapestryFacts$en extends Translations$films$items$chernobylTapestryFacts$ru {
	_Translations$films$items$chernobylTapestryFacts$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'The «Century» and «Chernobyl» tapestries. Interesting facts';
	@override String get excerpt => 'A video about Alexander Kishchanka\'s iconic tapestries — «The Tapestry of the Century» and «Chernobyl»: their backstory, symbolism, and curious facts.';
}

// Path: films.items.kishchenkoReel1
class _Translations$films$items$kishchenkoReel1$en extends Translations$films$items$kishchenkoReel1$ru {
	_Translations$films$items$kishchenkoReel1$en._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'A. Kishchenko on Instagram';
	@override String get excerpt => 'A short clip about the works of Alexander Kishchenko from social media.';
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
			'app.brandTagline' => 'Collection of Fine Arts',
			'app.logoMark' => 'KA',
			'navigation.aboutAuthor' => 'About author',
			'navigation.news' => 'News',
			'navigation.catalogOfWorks' => 'Catalog of works',
			'navigation.films' => 'Films',
			'navigation.archive' => 'Archive',
			'navigation.contacts' => 'Contacts',
			'catalog.workPrefix' => 'Work',
			'catalog.errorTitle' => 'Failed to load paintings',
			'catalog.errorWithDetails' => ({required Object message}) => 'Failed to load paintings. ${message}',
			'catalog.decade.all' => 'All',
			'catalog.decade.sixties' => '60s',
			'catalog.decade.seventies' => '70s',
			'catalog.decade.eighties' => '80s',
			'catalog.decade.nineties' => '90s',
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
			'catalog.paintingMediums.canvasOil' => 'Canvas, oil',
			'catalog.paintingMediums.hardboardOil' => 'Hardboard, oil',
			'catalog.paintingMediums.cardboard' => 'Cardboard',
			'catalog.paintingMediums.woolLinenWeaving' => 'Wool, linen, weaving',
			'common.pageNotFound' => 'Page not found',
			'common.retry' => 'Retry',
			'common.errorTitle' => 'Something went wrong',
			'common.viewCatalog' => 'VIEW CATALOG',
			'common.learnMore' => 'LEARN MORE',
			'common.video.loadError' => 'Failed to load video stream',
			'common.video.openExternally' => 'Open externally',
			'tour.next' => 'Next',
			'tour.gotIt' => 'Got it',
			'tour.back' => 'Back',
			'tour.chernobylBody' => 'Kishchanka is also the author of the "Chernobyl" tapestry (1991), which was gifted to the United Nations and still adorns its New York headquarters. The UN Secretary-General compared it to Picasso\'s Guernica.',
			'tour.originsTitle' => 'At the origins of "Universal Realism"',
			'tour.originsBody' => 'Alexander Mikhailovich Kishchanka (1933–1997). Painter. Philosopher. Monumentalist. Born in the hamlet of Bely Kolodez (today the Boguchar District, Voronezh Region), he won worldwide renown as the author of the world\'s largest tapestry — the "Tapestry of the Century".',
			'tour.scaleTitle' => 'Scale of the Tapestry of the Century',
			'tour.scaleBody' => 'The "Tapestry of the Century" is a hand-woven canvas measuring 19 × 14 metres (as tall as a five-storey building) and weighing over a tonne. In 1999 it was entered into the Guinness Book of Records as the largest tapestry in the world.',
			'language.label' => 'Language',
			'language.russian' => 'Russian',
			'language.english' => 'English',
			'language.spanish' => 'Spanish',
			'language.french' => 'French',
			'language.german' => 'German',
			'language.belarusian' => 'Belarusian',
			'archiveFeed.title' => 'Archive & Publications',
			'archiveFeed.latestLabel' => 'Latest publication',
			'archiveFeed.moreLabel' => 'News and references',
			'archiveFeed.openArticle' => 'Open article',
			'archiveFeed.sourceLabel' => 'Source',
			'archiveFeed.yearLabel' => ({required Object year}) => '${year}',
			'archiveFeed.items.boguchar2026.title' => 'Guided tour «The Life Story of M. A. Kishchenko»',
			'archiveFeed.items.boguchar2026.excerpt' => 'On 19 February 2026 the Boguchar Museum hosted a guided tour for pupils of the Dyachenkovo village school («Pervyh» movement), introducing them to the life and work of the renowned artist Alexander Mikhailovich Kishchenko.',
			'archiveFeed.items.priorbankChtobyChuvstvovat.title' => 'Exhibition «To Feel» — the Priorbank collection',
			'archiveFeed.items.priorbankChtobyChuvstvovat.excerpt' => 'Priorbank presents its corporate collection of Belarusian painting from the 1960s to the 2000s to the public for the first time, assembled over more than 30 years. The exhibition «To Feel» at the Rumyantsev and Paskevich Palace runs from 10 April to 7 June and features over 70 unique canvases, including three works by Alexander Kishchenko.',
			'archiveFeed.items.nitiSudby.title' => 'Alexander Kishchenko. Threads of Fate',
			'archiveFeed.items.nitiSudby.excerpt' => 'The museum hosted the grand opening of the exhibition «Alexander Kishchenko. Threads of Fate» (12+), dedicated to the work of the outstanding Belarusian artist, a native of the Boguchar district of the Voronezh region. The exhibition is organised to mark the 300th anniversary of the Voronezh Governorate and is part of the region\'s cultural exchange with the Republic of Belarus.',
			'archiveFeed.items.boguchar2024.title' => 'Guided tour «The Life Story of A. M. Kishchenko»',
			'archiveFeed.items.boguchar2024.excerpt' => 'Alexander Mikhailovich Kishchenko was one of the most gifted figures of the Boguchar region — a People\'s Artist of the Republic of Belarus and an honorary citizen of the Boguchar district. A member of the USSR Union of Artists and laureate of the State Prize, he left a vivid mark on the history of art.',
			'archiveFeed.items.belgazprombankKraskiPobedy.title' => 'Belgazprombank invites you to the exhibition «Colours of the Great Victory»',
			'archiveFeed.items.belgazprombankKraskiPobedy.excerpt' => '28 June 2024. On the eve of the 80th anniversary of Belarus\'s liberation from the Nazi-German invaders, the themed exhibition «Colours of the Great Victory» was solemnly opened in the lobby of the Belgazprombank headquarters. It brings together works by Belarusian artists who knew the horrors of war first-hand — A. Kishchenko, V. Protaseni, I. Stasevich, N. Churabo, I. Rey, P. Daneliya and others.',
			'archiveFeed.items.nebaZiamlja.title' => 'The Sky and the Earth of Alexander Kishchenko',
			'archiveFeed.items.nebaZiamlja.excerpt' => 'On 6 May 2023 the National Art Museum of the Republic of Belarus opens the exhibition «The Sky and the Earth of Alexander Kishchenko», dedicated to the scale of his artistic thinking and the significance of the master\'s legacy.',
			'films.title' => 'Films & Documentaries',
			'films.subtitle' => 'Video archive about A. Kishchenko',
			'films.latestLabel' => 'Latest film',
			'films.sourceLabel' => 'Source',
			'films.instagramTitle' => 'Instagram',
			'films.instagramSubtitle' => 'Short videos and stories',
			'films.watchOn.youtube' => 'Watch on YouTube',
			'films.watchOn.googleDrive' => 'Watch on Google Drive',
			'films.watchOn.instagram' => 'Open on Instagram',
			'films.items.ispovedVremeni.title' => 'A. Kishchenko. Confession of Time',
			'films.items.ispovedVremeni.excerpt' => 'A documentary about Alexander Mikhailovich Kishchenko (1933–1997), People\'s Artist of Belarus and author of the world\'s largest tapestry. Directed by V. Korolyov; filming and editing by E. Milkovskiy.',
			'films.items.aleksandrKishchenko.title' => 'Alexander Kishchenko',
			'films.items.aleksandrKishchenko.excerpt' => 'Television feature on the life and work of Alexander Kishchenko, taking the viewer through his monumental panels in Minsk, the «Tapestry of the Century» and the artist\'s quest for Universal Realism.',
			'films.items.voronezhKramskoyExhibition.title' => 'A. M. Kishchanka exhibition at the I. N. Kramskoy Voronezh Art Museum',
			'films.items.voronezhKramskoyExhibition.excerpt' => 'A report on the exhibition of works by the renowned Belarusian artist Alexander Kishchanka at the I. N. Kramskoy Voronezh Regional Art Museum.',
			'films.items.mastersOfSovietArt1988.title' => 'A. Kishchanka. «Masters of Soviet Art» series. 1988 album',
			'films.items.mastersOfSovietArt1988.excerpt' => 'A video review of the 1988 album from the «Masters of Soviet Art» series, dedicated to Alexander Kishchanka\'s paintings and monumental works.',
			'films.items.bogucharLecture.title' => 'Lecture «A countryman of world renown». A. M. Kishchanka. Boguchar Museum',
			'films.items.bogucharLecture.excerpt' => 'A lecture from the Boguchar Local History Museum about Alexander Mikhailovich Kishchanka — a countryman of world renown, born in the Boguchar district.',
			'films.items.culturalCodesTapestries.title' => 'Cultural Codes of the Nation: Where are the tapestries of the People\'s Artist Kishchanka now? Main Broadcast',
			'films.items.culturalCodesTapestries.excerpt' => 'The «Main Broadcast» programme, in its «Cultural Codes of the Nation» segment, traces the present whereabouts of the tapestries by Belarus\'s People\'s Artist Alexander Kishchanka.',
			'films.items.tapestryOfCenturyMinsk.title' => 'Preparing «The Tapestry of the Century» for display at the Development Bank in Minsk',
			'films.items.tapestryOfCenturyMinsk.excerpt' => 'A behind-the-scenes report on how Alexander Kishchanka\'s «Tapestry of the Century» was prepared for display at the Development Bank in Minsk.',
			'films.items.chernobylTapestryFacts.title' => 'The «Century» and «Chernobyl» tapestries. Interesting facts',
			'films.items.chernobylTapestryFacts.excerpt' => 'A video about Alexander Kishchanka\'s iconic tapestries — «The Tapestry of the Century» and «Chernobyl»: their backstory, symbolism, and curious facts.',
			'films.items.kishchenkoReel1.title' => 'A. Kishchenko on Instagram',
			'films.items.kishchenkoReel1.excerpt' => 'A short clip about the works of Alexander Kishchenko from social media.',
			'newsFeed.title' => 'News',
			'newsFeed.subtitle' => 'Publications, exhibitions, and events',
			'newsFeed.emptyState' => 'No news yet. Check back soon.',
			'newsFeed.errorTitle' => 'Failed to load news',
			'newsFeed.retry' => 'Retry',
			'newsFeed.back' => 'Back to news',
			'newsFeed.sourceLabel' => 'Source',
			'newsFeed.readTimeLabel' => 'Read time',
			'newsFeed.readTimeValue' => ({required Object minutes}) => '${minutes} min',
			'newsFeed.viewsLabel' => 'Views',
			'newsFeed.publishedLabel' => 'Published',
			'bio.heroTitle' => 'ART OF COSMIC SCALE',
			'bio.heroSubtitle' => 'Art that erases boundaries between the earthly and the eternal. People\'s Artist of the Republic of Belarus, creator of the world\'s largest tapestry "The Tapestry of the Century".',
			'bio.heroBrandName' => 'Alexander Mikhailovich Kishchanka',
			'bio.name' => 'Alexander Mikhailovich Kishchanka (1933–1997)',
			'bio.tagline' => 'Painter. Philosopher. Monumentalist. Founder of Universal Realism.',
			'bio.intro' => 'Alexander Kishchanka is a figure of Renaissance stature in 20th-century art. A man who transformed the soft thread of tapestry into a powerful architectural statement, and city walls into open books of philosophical meaning. His work is a bridge between the archaic and the cosmic, between the pain of the earth and the light of distant galaxies.',
			'bio.feature.title' => 'LEGACY OF GLOBAL SCALE',
			'bio.feature.body' => 'This collection brings together works by an outstanding master whose art forever changed the understanding of monumental painting and tapestry. From the grand mosaics that became a visual code of Minsk to the celebrated Tapestry of the Century and the Chernobyl canvas displayed at United Nations Headquarters in New York, every work by Kishchanka is a philosophical treatise on the connection of times, the cosmos, and the indestructible human spirit.',
			'bio.feature.cta' => 'EXPLORE THE COLLECTION',
			'bio.feature.worksValue' => '500+',
			'bio.feature.worksLabel' => 'Works of art around the world',
			'bio.feature.panelsValue' => '6+',
			'bio.feature.panelsLabel' => 'Monumental panels in Minsk',
			'bio.feature.guinnessValue' => '',
			'bio.feature.guinnessLabel' => 'Guinness art record',
			'bio.feature.unGiftValue' => '',
			'bio.feature.unGiftLabel' => 'A gift to the UN from the Republic of Belarus',
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
			'bio.wikipediaLinkLabel' => 'READ ON WIKIPEDIA',
			'contacts.title' => 'Contacts',
			'contacts.tagline' => 'Get in touch with the studio.',
			'contacts.phoneSectionLabel' => 'Phone',
			'contacts.phoneSectionHint' => 'Calls and WhatsApp',
			'contacts.instagramSectionLabel' => 'Instagram',
			'contacts.instagramHandle' => '@kishchenko.art',
			'contacts.vkSectionLabel' => 'VK',
			'contacts.vkHandle' => 'aleksandrkishchenko',
			'contacts.vkScanQrHint' => 'Scan the QR to open VK',
			'contacts.studioSectionTitle' => 'Author\'s studio',
			'contacts.studioAddress' => 'Minsk, 44 Surganova St., 7th floor',
			'contacts.openInOsm' => 'OPEN IN OPENSTREETMAP',
			'contacts.mapAttribution' => '© OpenStreetMap contributors',
			'seo.aboutAuthor.title' => 'Alexander Kishchenko — People\'s Artist of Belarus | KISHCHANKA.ART',
			'seo.aboutAuthor.description' => 'Alexander Mikhailovich Kishchenko (1933–1997) — People\'s Artist of Belarus, painter and monumentalist. Author of the world\'s largest tapestry and the Chernobyl tapestry at the UN.',
			'seo.aboutAuthor.keywords' => 'Alexander Kishchenko, biography, Belarusian artist, monumentalist, tapestry',
			'seo.catalog.title' => 'Catalog of Works by Alexander Kishchenko | KISHCHANKA.ART',
			'seo.catalog.description' => 'Catalog of paintings and tapestries by Alexander Kishchenko: portraits, landscapes, and philosophical works from 1958–1997.',
			'seo.catalog.keywords' => 'Kishchenko catalog, paintings, tapestries, buy Kishchenko art',
			'seo.news.title' => 'News & Exhibitions | KISHCHANKA.ART',
			'seo.news.description' => 'News, exhibitions, and events related to the legacy of Alexander Kishchenko and the KISHCHANKA.ART gallery.',
			'seo.news.keywords' => 'Kishchenko exhibitions, gallery news, events',
			'seo.films.title' => 'Documentary Films about A. Kishchenko | KISHCHANKA.ART',
			'seo.films.description' => 'Documentary films and videos about Alexander Kishchenko, his art, and monumental works.',
			'seo.films.keywords' => 'Kishchenko documentary, film, Tapestry of the Century, video',
			'seo.archive.title' => 'Archive & Publications | KISHCHANKA.ART',
			'seo.archive.description' => 'Archive of publications and materials about Alexander Kishchenko\'s art and exhibitions.',
			'seo.archive.keywords' => 'Kishchenko archive, publications, press, articles',
			'seo.contacts.title' => 'Contact | KISHCHANKA.ART',
			'seo.contacts.description' => 'Contact the KISHCHANKA.ART gallery: studio in Minsk, phone, Instagram and VK.',
			'seo.contacts.keywords' => 'Kishchenko gallery contact, Minsk studio, buy painting',
			_ => null,
		};
	}
}
