///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	dynamic operator[](String key) => _meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$app$en app = Translations$app$en._(_root);
	late final Translations$navigation$en navigation = Translations$navigation$en._(_root);
	late final Translations$catalog$en catalog = Translations$catalog$en._(_root);
	late final Translations$common$en common = Translations$common$en._(_root);
	late final Translations$tour$en tour = Translations$tour$en._(_root);
	late final Translations$language$en language = Translations$language$en._(_root);
	late final Translations$archiveFeed$en archiveFeed = Translations$archiveFeed$en._(_root);
	late final Translations$films$en films = Translations$films$en._(_root);
	late final Translations$newsFeed$en newsFeed = Translations$newsFeed$en._(_root);
	late final Translations$bio$en bio = Translations$bio$en._(_root);
	late final Translations$contacts$en contacts = Translations$contacts$en._(_root);
	late final Translations$seo$en seo = Translations$seo$en._(_root);
}

// Path: app
class Translations$app$en {
	Translations$app$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'KISHCHANKA.ART'
	String get title => 'KISHCHANKA.ART';

	/// en: 'Collection of Fine Arts'
	String get brandTagline => 'Collection of Fine Arts';

	/// en: 'KA'
	String get logoMark => 'KA';
}

// Path: navigation
class Translations$navigation$en {
	Translations$navigation$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'About author'
	String get aboutAuthor => 'About author';

	/// en: 'News'
	String get news => 'News';

	/// en: 'Catalog of works'
	String get catalogOfWorks => 'Catalog of works';

	/// en: 'Films'
	String get films => 'Films';

	/// en: 'Archive'
	String get archive => 'Archive';

	/// en: 'Contacts'
	String get contacts => 'Contacts';
}

// Path: catalog
class Translations$catalog$en {
	Translations$catalog$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Work'
	String get workPrefix => 'Work';

	/// en: 'Failed to load paintings'
	String get errorTitle => 'Failed to load paintings';

	/// en: 'Failed to load paintings. ${message}'
	String errorWithDetails({required Object message}) => 'Failed to load paintings. ${message}';

	late final Translations$catalog$decade$en decade = Translations$catalog$decade$en._(_root);
	late final Translations$catalog$paintingNames$en paintingNames = Translations$catalog$paintingNames$en._(_root);
	late final Translations$catalog$paintingMediums$en paintingMediums = Translations$catalog$paintingMediums$en._(_root);
}

// Path: common
class Translations$common$en {
	Translations$common$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Page not found'
	String get pageNotFound => 'Page not found';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Something went wrong'
	String get errorTitle => 'Something went wrong';

	/// en: 'VIEW CATALOG'
	String get viewCatalog => 'VIEW CATALOG';

	/// en: 'LEARN MORE'
	String get learnMore => 'LEARN MORE';

	late final Translations$common$video$en video = Translations$common$video$en._(_root);
}

// Path: tour
class Translations$tour$en {
	Translations$tour$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Got it'
	String get gotIt => 'Got it';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Kishchanka is also the author of the "Chernobyl" tapestry (1991), which was gifted to the United Nations and still adorns its New York headquarters. The UN Secretary-General compared it to Picasso's Guernica.'
	String get chernobylBody => 'Kishchanka is also the author of the "Chernobyl" tapestry (1991), which was gifted to the United Nations and still adorns its New York headquarters. The UN Secretary-General compared it to Picasso\'s Guernica.';

	/// en: 'At the origins of "Universal Realism"'
	String get originsTitle => 'At the origins of "Universal Realism"';

	/// en: 'Alexander Mikhailovich Kishchanka (1933–1997). Painter. Philosopher. Monumentalist. Born in the hamlet of Bely Kolodez (today the Boguchar District, Voronezh Region), he won worldwide renown as the author of the world's largest tapestry — the "Tapestry of the Century".'
	String get originsBody => 'Alexander Mikhailovich Kishchanka (1933–1997). Painter. Philosopher. Monumentalist. Born in the hamlet of Bely Kolodez (today the Boguchar District, Voronezh Region), he won worldwide renown as the author of the world\'s largest tapestry — the "Tapestry of the Century".';

	/// en: 'Scale of the Tapestry of the Century'
	String get scaleTitle => 'Scale of the Tapestry of the Century';

	/// en: 'The "Tapestry of the Century" is a hand-woven canvas measuring 19 × 14 metres (as tall as a five-storey building) and weighing over a tonne. In 1999 it was entered into the Guinness Book of Records as the largest tapestry in the world.'
	String get scaleBody => 'The "Tapestry of the Century" is a hand-woven canvas measuring 19 × 14 metres (as tall as a five-storey building) and weighing over a tonne. In 1999 it was entered into the Guinness Book of Records as the largest tapestry in the world.';
}

// Path: language
class Translations$language$en {
	Translations$language$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Language'
	String get label => 'Language';

	/// en: 'Russian'
	String get russian => 'Russian';

	/// en: 'English'
	String get english => 'English';

	/// en: 'Spanish'
	String get spanish => 'Spanish';

	/// en: 'French'
	String get french => 'French';

	/// en: 'German'
	String get german => 'German';

	/// en: 'Belarusian'
	String get belarusian => 'Belarusian';
}

// Path: archiveFeed
class Translations$archiveFeed$en {
	Translations$archiveFeed$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Archive & Publications'
	String get title => 'Archive & Publications';

	/// en: 'Latest publication'
	String get latestLabel => 'Latest publication';

	/// en: 'News and references'
	String get moreLabel => 'News and references';

	/// en: 'Open article'
	String get openArticle => 'Open article';

	/// en: 'Source'
	String get sourceLabel => 'Source';

	/// en: '${year}'
	String yearLabel({required Object year}) => '${year}';

	late final Translations$archiveFeed$items$en items = Translations$archiveFeed$items$en._(_root);
}

// Path: films
class Translations$films$en {
	Translations$films$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Films & Documentaries'
	String get title => 'Films & Documentaries';

	/// en: 'Video archive about A. Kishchenko'
	String get subtitle => 'Video archive about A. Kishchenko';

	/// en: 'Latest film'
	String get latestLabel => 'Latest film';

	/// en: 'Source'
	String get sourceLabel => 'Source';

	/// en: 'Instagram'
	String get instagramTitle => 'Instagram';

	/// en: 'Short videos and stories'
	String get instagramSubtitle => 'Short videos and stories';

	late final Translations$films$watchOn$en watchOn = Translations$films$watchOn$en._(_root);
	late final Translations$films$items$en items = Translations$films$items$en._(_root);
}

// Path: newsFeed
class Translations$newsFeed$en {
	Translations$newsFeed$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'News'
	String get title => 'News';

	/// en: 'Publications, exhibitions, and events'
	String get subtitle => 'Publications, exhibitions, and events';

	/// en: 'No news yet. Check back soon.'
	String get emptyState => 'No news yet. Check back soon.';

	/// en: 'Failed to load news'
	String get errorTitle => 'Failed to load news';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Back to news'
	String get back => 'Back to news';

	/// en: 'Source'
	String get sourceLabel => 'Source';

	/// en: 'Read time'
	String get readTimeLabel => 'Read time';

	/// en: '${minutes} min'
	String readTimeValue({required Object minutes}) => '${minutes} min';

	/// en: 'Views'
	String get viewsLabel => 'Views';

	/// en: 'Published'
	String get publishedLabel => 'Published';
}

// Path: bio
class Translations$bio$en {
	Translations$bio$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ART OF COSMIC SCALE'
	String get heroTitle => 'ART OF COSMIC SCALE';

	/// en: 'Art that erases boundaries between the earthly and the eternal. People's Artist of the Republic of Belarus, creator of the world's largest tapestry "The Tapestry of the Century".'
	String get heroSubtitle => 'Art that erases boundaries between the earthly and the eternal. People\'s Artist of the Republic of Belarus, creator of the world\'s largest tapestry "The Tapestry of the Century".';

	/// en: 'Alexander Mikhailovich Kishchanka'
	String get heroBrandName => 'Alexander Mikhailovich Kishchanka';

	/// en: 'Alexander Mikhailovich Kishchanka (1933–1997)'
	String get name => 'Alexander Mikhailovich Kishchanka (1933–1997)';

	/// en: 'Painter. Philosopher. Monumentalist. Founder of Universal Realism.'
	String get tagline => 'Painter. Philosopher. Monumentalist. Founder of Universal Realism.';

	/// en: 'Alexander Kishchanka is a figure of Renaissance stature in 20th-century art. A man who transformed the soft thread of tapestry into a powerful architectural statement, and city walls into open books of philosophical meaning. His work is a bridge between the archaic and the cosmic, between the pain of the earth and the light of distant galaxies.'
	String get intro => 'Alexander Kishchanka is a figure of Renaissance stature in 20th-century art. A man who transformed the soft thread of tapestry into a powerful architectural statement, and city walls into open books of philosophical meaning. His work is a bridge between the archaic and the cosmic, between the pain of the earth and the light of distant galaxies.';

	late final Translations$bio$feature$en feature = Translations$bio$feature$en._(_root);
	late final Translations$bio$universalRealism$en universalRealism = Translations$bio$universalRealism$en._(_root);
	late final Translations$bio$tapestry$en tapestry = Translations$bio$tapestry$en._(_root);
	late final Translations$bio$chernobyl$en chernobyl = Translations$bio$chernobyl$en._(_root);
	late final Translations$bio$mosaic$en mosaic = Translations$bio$mosaic$en._(_root);
	late final Translations$bio$legacy$en legacy = Translations$bio$legacy$en._(_root);

	/// en: 'Art is a divine phenomenon. Only it is given the power to stop time. Art can unravel the mystery of the future and also restore the lost past.'
	String get quote => 'Art is a divine phenomenon. Only it is given the power to stop time. Art can unravel the mystery of the future and also restore the lost past.';

	/// en: '— Alexander Kishchanka'
	String get quoteAuthor => '— Alexander Kishchanka';

	/// en: 'READ ON WIKIPEDIA'
	String get wikipediaLinkLabel => 'READ ON WIKIPEDIA';
}

// Path: contacts
class Translations$contacts$en {
	Translations$contacts$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Contacts'
	String get title => 'Contacts';

	/// en: 'Get in touch with the studio.'
	String get tagline => 'Get in touch with the studio.';

	/// en: 'Phone'
	String get phoneSectionLabel => 'Phone';

	/// en: 'Calls and WhatsApp'
	String get phoneSectionHint => 'Calls and WhatsApp';

	/// en: 'Instagram'
	String get instagramSectionLabel => 'Instagram';

	/// en: '@kishchenko.art'
	String get instagramHandle => '@kishchenko.art';

	/// en: 'VK'
	String get vkSectionLabel => 'VK';

	/// en: 'aleksandrkishchenko'
	String get vkHandle => 'aleksandrkishchenko';

	/// en: 'Scan the QR to open VK'
	String get vkScanQrHint => 'Scan the QR to open VK';

	/// en: 'Author's studio'
	String get studioSectionTitle => 'Author\'s studio';

	/// en: 'Minsk, 44 Surganova St., 7th floor'
	String get studioAddress => 'Minsk, 44 Surganova St., 7th floor';

	/// en: 'OPEN IN OPENSTREETMAP'
	String get openInOsm => 'OPEN IN OPENSTREETMAP';

	/// en: '© OpenStreetMap contributors'
	String get mapAttribution => '© OpenStreetMap contributors';
}

// Path: seo
class Translations$seo$en {
	Translations$seo$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$seo$aboutAuthor$en aboutAuthor = Translations$seo$aboutAuthor$en._(_root);
	late final Translations$seo$catalog$en catalog = Translations$seo$catalog$en._(_root);
	late final Translations$seo$news$en news = Translations$seo$news$en._(_root);
	late final Translations$seo$films$en films = Translations$seo$films$en._(_root);
	late final Translations$seo$archive$en archive = Translations$seo$archive$en._(_root);
	late final Translations$seo$contacts$en contacts = Translations$seo$contacts$en._(_root);
}

// Path: catalog.decade
class Translations$catalog$decade$en {
	Translations$catalog$decade$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'All'
	String get all => 'All';

	/// en: '60s'
	String get sixties => '60s';

	/// en: '70s'
	String get seventies => '70s';

	/// en: '80s'
	String get eighties => '80s';

	/// en: '90s'
	String get nineties => '90s';
}

// Path: catalog.paintingNames
class Translations$catalog$paintingNames$en {
	Translations$catalog$paintingNames$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Outskirts. The Old Mill'
	String get id1958_1 => 'Outskirts. The Old Mill';

	/// en: 'Angelina'
	String get id1958_2 => 'Angelina';

	/// en: 'Toilette'
	String get id1958_3 => 'Toilette';

	/// en: 'Female Portrait'
	String get id1959_1 => 'Female Portrait';

	/// en: 'Composition No. 1'
	String get id1960_1 => 'Composition No. 1';

	/// en: 'Female Portrait in Green Tones'
	String get id1960_2 => 'Female Portrait in Green Tones';

	/// en: 'First Snow'
	String get id1960_3 => 'First Snow';

	/// en: 'Woman in an Armchair'
	String get id1960_4 => 'Woman in an Armchair';

	/// en: 'Portrait of Artist Vladimir Urishchenko'
	String get id1960_5 => 'Portrait of Artist Vladimir Urishchenko';

	/// en: 'Girl with a Bow'
	String get id1960_6 => 'Girl with a Bow';

	/// en: 'Female Portrait'
	String get id1960_7 => 'Female Portrait';

	/// en: 'Female Portrait'
	String get id1960_8 => 'Female Portrait';

	/// en: 'Expectation'
	String get id1960_9 => 'Expectation';

	/// en: 'Northern Woman (Woman from the North)'
	String get id1962_1 => 'Northern Woman (Woman from the North)';

	/// en: 'Female Portrait'
	String get id1965_1 => 'Female Portrait';

	/// en: 'Circus Boy'
	String get id1965_2 => 'Circus Boy';

	/// en: 'Temptation'
	String get id1965_3 => 'Temptation';

	/// en: 'Zoya Litvinova'
	String get id1967_1 => 'Zoya Litvinova';

	/// en: 'Two Lives'
	String get id1967_2 => 'Two Lives';

	/// en: 'Still Life with Pears'
	String get id1968_1 => 'Still Life with Pears';

	/// en: 'Angel'
	String get id1969_1 => 'Angel';

	/// en: 'The Teacher'
	String get id1970_1 => 'The Teacher';

	/// en: 'The Last Sevastopolian'
	String get id1970_2 => 'The Last Sevastopolian';

	/// en: 'Portrait of Zhenya Musinskaya'
	String get id1972_1 => 'Portrait of Zhenya Musinskaya';

	/// en: 'Girl in Russian Costume'
	String get id1974_1 => 'Girl in Russian Costume';

	/// en: 'The Firstborn'
	String get id1975_1 => 'The Firstborn';

	/// en: 'Girl in Red and Gold (Green Grapes)'
	String get id1976_1 => 'Girl in Red and Gold (Green Grapes)';

	/// en: 'Mother with Child'
	String get id1979_1 => 'Mother with Child';

	/// en: 'Natasha'
	String get id1979_2 => 'Natasha';

	/// en: 'The Murder of the Gromov Family. Action 1943. Taman.'
	String get id1979_3 => 'The Murder of the Gromov Family. Action 1943. Taman.';

	/// en: 'Sketch for "The Poet's Pain"'
	String get id1979_4 => 'Sketch for "The Poet\'s Pain"';

	/// en: 'Joy. Motherhood'
	String get id1979_5 => 'Joy. Motherhood';

	/// en: 'Fragment for the Painting "Honey"'
	String get id1980_1 => 'Fragment for the Painting "Honey"';

	/// en: 'Portrait of Mother'
	String get id1980_2 => 'Portrait of Mother';

	/// en: 'Nina'
	String get id1980_3 => 'Nina';

	/// en: 'Natasha Marchenko'
	String get id1980_4 => 'Natasha Marchenko';

	/// en: 'Natasha'
	String get id1980_5 => 'Natasha';

	/// en: 'Reverie'
	String get id1981_1 => 'Reverie';

	/// en: 'Portrait of Elena Obraztsova'
	String get id1981_2 => 'Portrait of Elena Obraztsova';

	/// en: 'Self-Portrait'
	String get id1982_1 => 'Self-Portrait';

	/// en: 'Adam and Eve'
	String get id1982_2 => 'Adam and Eve';

	/// en: 'Desecration of the Temple'
	String get id1982_3 => 'Desecration of the Temple';

	/// en: 'Obscurantists'
	String get id1982_4 => 'Obscurantists';

	/// en: 'Sunflowers'
	String get id1982_5 => 'Sunflowers';

	/// en: 'Landscape'
	String get id1982_6 => 'Landscape';

	/// en: 'Madonna'
	String get id1983_1 => 'Madonna';

	/// en: 'Conspiracy (The Freemasons' Oath)'
	String get id1983_2 => 'Conspiracy (The Freemasons\' Oath)';

	/// en: 'Nina'
	String get id1983_3 => 'Nina';

	/// en: 'Portrait of Maria Bieshu'
	String get id1983_4 => 'Portrait of Maria Bieshu';

	/// en: 'The Call of the Sea'
	String get id1983_5 => 'The Call of the Sea';

	/// en: 'Weeping'
	String get id1983_6 => 'Weeping';

	/// en: 'Natasha'
	String get id1983_7 => 'Natasha';

	/// en: 'Nina'
	String get id1984_1 => 'Nina';

	/// en: 'Nina'
	String get id1984_2 => 'Nina';

	/// en: 'Uncle Vanya'
	String get id1985_1 => 'Uncle Vanya';

	/// en: 'Girl in a Red Hat'
	String get id1985_2 => 'Girl in a Red Hat';

	/// en: 'Female Image. Natasha Tatarenko'
	String get id1985_3 => 'Female Image. Natasha Tatarenko';

	/// en: 'Male Portrait'
	String get id1985_4 => 'Male Portrait';

	/// en: 'Summer Shower'
	String get id1985_5 => 'Summer Shower';

	/// en: 'Portrait of a Girl'
	String get id1986_1 => 'Portrait of a Girl';

	/// en: 'Portrait of Cinematographer A. Abadovsky'
	String get id1986_2 => 'Portrait of Cinematographer A. Abadovsky';

	/// en: 'The Last Days of September'
	String get id1986_3 => 'The Last Days of September';

	/// en: 'Portrait of Bushchik'
	String get id1986_4 => 'Portrait of Bushchik';

	/// en: 'Portrait of Natasha Marchenko'
	String get id1986_5 => 'Portrait of Natasha Marchenko';

	/// en: 'He Will Live. Chernobyl'
	String get id1987_1 => 'He Will Live. Chernobyl';

	/// en: 'Female Portrait'
	String get id1987_2 => 'Female Portrait';

	/// en: 'Portrait of Masha'
	String get id1988_1 => 'Portrait of Masha';

	/// en: 'Male Head'
	String get id1988_2 => 'Male Head';

	/// en: 'Profile'
	String get id1988_3 => 'Profile';

	/// en: 'Walking Woman'
	String get id1988_4 => 'Walking Woman';

	/// en: 'On the Banks of the Don'
	String get id1989_1 => 'On the Banks of the Don';

	/// en: 'Morning'
	String get id1989_2 => 'Morning';

	/// en: 'Portrait of the Artist Tamara Kirshchina'
	String get id1989_3 => 'Portrait of the Artist Tamara Kirshchina';

	/// en: 'Nude in the Space of Music'
	String get id1989_4 => 'Nude in the Space of Music';

	/// en: 'Walking Woman (The Universe)'
	String get id1989_5 => 'Walking Woman (The Universe)';

	/// en: 'Nina'
	String get id1989_6 => 'Nina';

	/// en: 'Brother and Sister Yelkiny'
	String get id1989_7 => 'Brother and Sister Yelkiny';

	/// en: 'Nina'
	String get id1989_8 => 'Nina';

	/// en: 'Nude'
	String get id1989_9 => 'Nude';

	/// en: 'In Space (Nude)'
	String get id1990_1 => 'In Space (Nude)';

	/// en: 'Gifts of the Planets'
	String get id1990_2 => 'Gifts of the Planets';

	/// en: 'Zoya'
	String get id1990_3 => 'Zoya';

	/// en: 'Male Portrait'
	String get id1990_4 => 'Male Portrait';

	/// en: 'On the Balcony'
	String get id1990_5 => 'On the Balcony';

	/// en: 'Girl with Honey (The Universe)'
	String get id1991_1 => 'Girl with Honey (The Universe)';

	/// en: 'Dream'
	String get id1991_2 => 'Dream';

	/// en: 'The Eternal'
	String get id1991_3 => 'The Eternal';

	/// en: 'Portrait with a Seashell'
	String get id1992_1 => 'Portrait with a Seashell';

	/// en: 'Satyr and Nymph'
	String get id1992_2 => 'Satyr and Nymph';

	/// en: 'Boy with a Rooster'
	String get id1992_3 => 'Boy with a Rooster';

	/// en: 'Nina and Maxim'
	String get id1992_4 => 'Nina and Maxim';

	/// en: 'Russian Peasant'
	String get id1992_5 => 'Russian Peasant';

	/// en: 'Portrait of Franz Koch'
	String get id1992_6 => 'Portrait of Franz Koch';

	/// en: 'Nina'
	String get id1992_7 => 'Nina';

	/// en: 'Olga'
	String get id1992_8 => 'Olga';

	/// en: 'Don't Misbehave, Maxim!'
	String get id1992_9 => 'Don\'t Misbehave, Maxim!';

	/// en: 'Tapestry "Sunflowers"'
	String get id1992_10 => 'Tapestry "Sunflowers"';

	/// en: 'The Eternal'
	String get id1993_1 => 'The Eternal';

	/// en: 'Portrait of the Sculptor Lena Kharaberyush'
	String get id1993_2 => 'Portrait of the Sculptor Lena Kharaberyush';

	/// en: 'The Apothecary'
	String get id1993_3 => 'The Apothecary';

	/// en: 'Olya'
	String get id1993_4 => 'Olya';

	/// en: 'Mother and Child'
	String get id1993_5 => 'Mother and Child';

	/// en: 'Christ'
	String get id1993_6 => 'Christ';

	/// en: 'Natasha'
	String get id1993_7 => 'Natasha';

	/// en: 'Portrait of an Unknown Woman'
	String get id1993_8 => 'Portrait of an Unknown Woman';

	/// en: 'Roman'
	String get id1993_9 => 'Roman';

	/// en: 'Under the Constellation of Leo'
	String get id1994_1 => 'Under the Constellation of Leo';

	/// en: 'Portrait of Zoya'
	String get id1994_2 => 'Portrait of Zoya';

	/// en: 'The Abandoned Courtyard'
	String get id1994_3 => 'The Abandoned Courtyard';

	/// en: 'Natasha'
	String get id1994_4 => 'Natasha';

	/// en: 'Song'
	String get id1994_5 => 'Song';

	/// en: 'Girl with a Still Life with Apples'
	String get id1994_6 => 'Girl with a Still Life with Apples';

	/// en: 'The Screaming Woman'
	String get id1994_7 => 'The Screaming Woman';

	/// en: 'Natasha'
	String get id1994_8 => 'Natasha';

	/// en: 'Bacchanalia'
	String get id1994_9 => 'Bacchanalia';

	/// en: 'Little Dreamer'
	String get id1995_1 => 'Little Dreamer';

	/// en: 'My Homeland'
	String get id1995_2 => 'My Homeland';

	/// en: 'Nude'
	String get id1995_3 => 'Nude';

	/// en: 'Olga Koltakova'
	String get id1995_4 => 'Olga Koltakova';

	/// en: 'Tamara Kirshchina from Behind'
	String get id1995_5 => 'Tamara Kirshchina from Behind';

	/// en: 'Olya'
	String get id1995_6 => 'Olya';

	/// en: 'Sadness'
	String get id1995_7 => 'Sadness';

	/// en: 'Portrait of a Girl'
	String get id1995_8 => 'Portrait of a Girl';

	/// en: 'The Universe'
	String get id1995_9 => 'The Universe';

	/// en: 'Lyosha'
	String get id1995_10 => 'Lyosha';

	/// en: 'Portrait of Rostikov'
	String get id1995_11 => 'Portrait of Rostikov';

	/// en: 'Art Critic Nadya'
	String get id1995_12 => 'Art Critic Nadya';

	/// en: 'Melody'
	String get id1995_13 => 'Melody';

	/// en: 'Tanya'
	String get id1995_14 => 'Tanya';

	/// en: 'Sketch for the Painting «Portrait of Nina»'
	String get id1995_15 => 'Sketch for the Painting «Portrait of Nina»';

	/// en: 'Still Life'
	String get id1995_16 => 'Still Life';

	/// en: 'Tapestry "The Sea" ("The Wave")'
	String get id1995_17 => 'Tapestry "The Sea" ("The Wave")';

	/// en: 'Still Life with Apples'
	String get id1996_1 => 'Still Life with Apples';

	/// en: 'Nude'
	String get id1996_2 => 'Nude';

	/// en: 'Maxim with a Watermelon'
	String get id1996_3 => 'Maxim with a Watermelon';

	/// en: 'Hymn (Rapture)'
	String get id1996_4 => 'Hymn (Rapture)';

	/// en: 'Nina'
	String get id1996_5 => 'Nina';

	/// en: 'Inna'
	String get id1996_6 => 'Inna';

	/// en: 'Alla Astakhovich'
	String get id1996_7 => 'Alla Astakhovich';

	/// en: 'Lena'
	String get id1996_8 => 'Lena';

	/// en: 'Female Portrait (Nina No. 1)'
	String get id1996_9 => 'Female Portrait (Nina No. 1)';

	/// en: 'Universe'
	String get id1996_10 => 'Universe';

	/// en: 'Floating in a Boat'
	String get id1996_11 => 'Floating in a Boat';

	/// en: 'Female Portrait with a Shawl'
	String get id1996_12 => 'Female Portrait with a Shawl';

	/// en: 'Mom'
	String get id1996_13 => 'Mom';

	/// en: 'Filaret of Minsk'
	String get id1996_14 => 'Filaret of Minsk';

	/// en: 'Still Life in Space'
	String get id1996_15 => 'Still Life in Space';

	/// en: 'Portrait of Kuchinsky'
	String get id1996_16 => 'Portrait of Kuchinsky';

	/// en: 'Female Portrait'
	String get id1996_17 => 'Female Portrait';

	/// en: 'My Universe'
	String get id1996_18 => 'My Universe';

	/// en: 'Ivan'
	String get id1997_1 => 'Ivan';

	/// en: 'Portrait of Architect Vladimir Salazkin'
	String get id1997_2 => 'Portrait of Architect Vladimir Salazkin';

	/// en: 'War of the Worlds (Last Work)'
	String get id1997_3 => 'War of the Worlds (Last Work)';

	/// en: 'Self-Portrait'
	String get id1997_4 => 'Self-Portrait';

	/// en: 'Summer in Boguchar'
	String get id1997_5 => 'Summer in Boguchar';

	/// en: 'Two Widows'
	String get id1997_6 => 'Two Widows';

	/// en: 'The Flood'
	String get idunknown_1 => 'The Flood';

	/// en: 'Female Portrait'
	String get idunknown_2 => 'Female Portrait';

	/// en: 'Blue Thorns'
	String get idunknown_3 => 'Blue Thorns';

	/// en: 'Nina'
	String get idunknown_4 => 'Nina';

	/// en: 'Nina'
	String get idunknown_5 => 'Nina';
}

// Path: catalog.paintingMediums
class Translations$catalog$paintingMediums$en {
	Translations$catalog$paintingMediums$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Canvas, oil'
	String get canvasOil => 'Canvas, oil';

	/// en: 'Hardboard, oil'
	String get hardboardOil => 'Hardboard, oil';

	/// en: 'Cardboard'
	String get cardboard => 'Cardboard';

	/// en: 'Wool, linen, weaving'
	String get woolLinenWeaving => 'Wool, linen, weaving';
}

// Path: common.video
class Translations$common$video$en {
	Translations$common$video$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Failed to load video stream'
	String get loadError => 'Failed to load video stream';

	/// en: 'Open externally'
	String get openExternally => 'Open externally';
}

// Path: archiveFeed.items
class Translations$archiveFeed$items$en {
	Translations$archiveFeed$items$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$archiveFeed$items$boguchar2026$en boguchar2026 = Translations$archiveFeed$items$boguchar2026$en._(_root);
	late final Translations$archiveFeed$items$priorbankChtobyChuvstvovat$en priorbankChtobyChuvstvovat = Translations$archiveFeed$items$priorbankChtobyChuvstvovat$en._(_root);
	late final Translations$archiveFeed$items$nitiSudby$en nitiSudby = Translations$archiveFeed$items$nitiSudby$en._(_root);
	late final Translations$archiveFeed$items$boguchar2024$en boguchar2024 = Translations$archiveFeed$items$boguchar2024$en._(_root);
	late final Translations$archiveFeed$items$belgazprombankKraskiPobedy$en belgazprombankKraskiPobedy = Translations$archiveFeed$items$belgazprombankKraskiPobedy$en._(_root);
	late final Translations$archiveFeed$items$nebaZiamlja$en nebaZiamlja = Translations$archiveFeed$items$nebaZiamlja$en._(_root);
}

// Path: films.watchOn
class Translations$films$watchOn$en {
	Translations$films$watchOn$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Watch on YouTube'
	String get youtube => 'Watch on YouTube';

	/// en: 'Watch on Google Drive'
	String get googleDrive => 'Watch on Google Drive';

	/// en: 'Open on Instagram'
	String get instagram => 'Open on Instagram';
}

// Path: films.items
class Translations$films$items$en {
	Translations$films$items$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$films$items$ispovedVremeni$en ispovedVremeni = Translations$films$items$ispovedVremeni$en._(_root);
	late final Translations$films$items$aleksandrKishchenko$en aleksandrKishchenko = Translations$films$items$aleksandrKishchenko$en._(_root);
	late final Translations$films$items$voronezhKramskoyExhibition$en voronezhKramskoyExhibition = Translations$films$items$voronezhKramskoyExhibition$en._(_root);
	late final Translations$films$items$mastersOfSovietArt1988$en mastersOfSovietArt1988 = Translations$films$items$mastersOfSovietArt1988$en._(_root);
	late final Translations$films$items$bogucharLecture$en bogucharLecture = Translations$films$items$bogucharLecture$en._(_root);
	late final Translations$films$items$culturalCodesTapestries$en culturalCodesTapestries = Translations$films$items$culturalCodesTapestries$en._(_root);
	late final Translations$films$items$tapestryOfCenturyMinsk$en tapestryOfCenturyMinsk = Translations$films$items$tapestryOfCenturyMinsk$en._(_root);
	late final Translations$films$items$chernobylTapestryFacts$en chernobylTapestryFacts = Translations$films$items$chernobylTapestryFacts$en._(_root);
	late final Translations$films$items$kishchenkoReel1$en kishchenkoReel1 = Translations$films$items$kishchenkoReel1$en._(_root);
}

// Path: bio.feature
class Translations$bio$feature$en {
	Translations$bio$feature$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'LEGACY OF GLOBAL SCALE'
	String get title => 'LEGACY OF GLOBAL SCALE';

	/// en: 'This collection brings together works by an outstanding master whose art forever changed the understanding of monumental painting and tapestry. From the grand mosaics that became a visual code of Minsk to the celebrated Tapestry of the Century and the Chernobyl canvas displayed at United Nations Headquarters in New York, every work by Kishchanka is a philosophical treatise on the connection of times, the cosmos, and the indestructible human spirit.'
	String get body => 'This collection brings together works by an outstanding master whose art forever changed the understanding of monumental painting and tapestry. From the grand mosaics that became a visual code of Minsk to the celebrated Tapestry of the Century and the Chernobyl canvas displayed at United Nations Headquarters in New York, every work by Kishchanka is a philosophical treatise on the connection of times, the cosmos, and the indestructible human spirit.';

	/// en: 'EXPLORE THE COLLECTION'
	String get cta => 'EXPLORE THE COLLECTION';

	/// en: '500+'
	String get worksValue => '500+';

	/// en: 'Works of art around the world'
	String get worksLabel => 'Works of art around the world';

	/// en: '6+'
	String get panelsValue => '6+';

	/// en: 'Monumental panels in Minsk'
	String get panelsLabel => 'Monumental panels in Minsk';

	/// en: ''
	String get guinnessValue => '';

	/// en: 'Guinness art record'
	String get guinnessLabel => 'Guinness art record';

	/// en: ''
	String get unGiftValue => '';

	/// en: 'A gift to the UN from the Republic of Belarus'
	String get unGiftLabel => 'A gift to the UN from the Republic of Belarus';
}

// Path: bio.universalRealism
class Translations$bio$universalRealism$en {
	Translations$bio$universalRealism$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Founder of Universal Realism'
	String get title => 'Founder of Universal Realism';

	/// en: 'Kishchanka did not merely depict reality — he created a new system of coordinates, which he called Universal Realism. At the heart of his method lies the conviction that the artist is a weaver of time, obligated to connect past and future. His art transcended national boundaries, operating in terms of global human drama. For Kishchanka, man is a demigod whose actions resonate on a universal scale. In his works, shadows become autonomous forms, and colour becomes cosmic music subject to a strict higher order.'
	String get body => 'Kishchanka did not merely depict reality — he created a new system of coordinates, which he called Universal Realism. At the heart of his method lies the conviction that the artist is a weaver of time, obligated to connect past and future. His art transcended national boundaries, operating in terms of global human drama. For Kishchanka, man is a demigod whose actions resonate on a universal scale. In his works, shadows become autonomous forms, and colour becomes cosmic music subject to a strict higher order.';
}

// Path: bio.tapestry
class Translations$bio$tapestry$en {
	Translations$bio$tapestry$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tapestry of the Century: The Pinnacle of World Weaving'
	String get title => 'Tapestry of the Century: The Pinnacle of World Weaving';

	/// en: 'Alexander Kishchanka entered history as the author of the world's largest tapestry, officially listed in the Guinness Book of Records.'
	String get intro => 'Alexander Kishchanka entered history as the author of the world\'s largest tapestry, officially listed in the Guinness Book of Records.';

	/// en: 'Scale'
	String get scaleLabel => 'Scale';

	/// en: 'A canvas measuring 19 × 14 metres (approx. 300 sq. m), weighing over a tonne.'
	String get scale => 'A canvas measuring 19 × 14 metres (approx. 300 sq. m), weighing over a tonne.';

	/// en: 'Concept'
	String get conceptLabel => 'Concept';

	/// en: 'A grandiose fabric of history, in which the destinies of 80 iconic figures are interwoven — from Christ and the Madonna to Churchill, Castro and Gorbachev.'
	String get concept => 'A grandiose fabric of history, in which the destinies of 80 iconic figures are interwoven — from Christ and the Madonna to Churchill, Castro and Gorbachev.';

	/// en: 'Significance'
	String get meaningLabel => 'Significance';

	/// en: 'This work is a temple-piece, at the centre of which the eternal conflict between creation and destruction unfolds. It was recognised as a national treasure of Belarus.'
	String get meaning => 'This work is a temple-piece, at the centre of which the eternal conflict between creation and destruction unfolds. It was recognised as a national treasure of Belarus.';
}

// Path: bio.chernobyl
class Translations$bio$chernobyl$en {
	Translations$bio$chernobyl$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Chernobyl: The Voice of a Nation in the Halls of the UN'
	String get title => 'Chernobyl: The Voice of a Nation in the Halls of the UN';

	/// en: 'One of the master's most emotionally powerful works was the tapestry Chernobyl (1991). Presented as a gift to the United Nations, it still adorns the UN headquarters in New York. When the world saw this work, UN Secretary-General Javier Pérez de Cuéllar compared it to Picasso's Guernica. For Kishchanka, this tapestry was not merely a memorial to the tragedy, but the eyes of Belarus — a planetary warning about the fragility of life, woven by the hands of great Belarusian craftswomen.'
	String get body => 'One of the master\'s most emotionally powerful works was the tapestry Chernobyl (1991). Presented as a gift to the United Nations, it still adorns the UN headquarters in New York. When the world saw this work, UN Secretary-General Javier Pérez de Cuéllar compared it to Picasso\'s Guernica. For Kishchanka, this tapestry was not merely a memorial to the tragedy, but the eyes of Belarus — a planetary warning about the fragility of life, woven by the hands of great Belarusian craftswomen.';
}

// Path: bio.mosaic
class Translations$bio$mosaic$en {
	Translations$bio$mosaic$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The Face of the City: The Vostok Mosaic Panels'
	String get title => 'The Face of the City: The Vostok Mosaic Panels';

	/// en: 'Kishchanka shaped the visual identity of modern Minsk. His famous mosaics on residential high-rises in the Vostok-1 district became the hallmark of the capital.'
	String get intro => 'Kishchanka shaped the visual identity of modern Minsk. His famous mosaics on residential high-rises in the Vostok-1 district became the hallmark of the capital.';

	/// en: 'Four monumental works'
	String get panelsLabel => 'Four monumental works';

	/// en: 'City-Warrior, City of Science, City of Culture, and City-Builder.'
	String get panels => 'City-Warrior, City of Science, City of Culture, and City-Builder.';

	/// en: 'These works transformed standard housing blocks into an artistic space, where the triumph of the human spirit is celebrated through smalt and stone.'
	String get panelsMeaning => 'These works transformed standard housing blocks into an artistic space, where the triumph of the human spirit is celebrated through smalt and stone.';
}

// Path: bio.legacy
class Translations$bio$legacy$en {
	Translations$bio$legacy$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Legacy'
	String get title => 'Legacy';

	/// en: 'Alexander Kishchanka left behind not only canvases housed in the Tretyakov Gallery and private collections of world leaders (B. Clinton, F. Mitterrand), but an entire school of Belarusian monumental tapestry. The Borisov Decorative and Applied Arts Combine, where his great tapestries were created, now bears his name.'
	String get body => 'Alexander Kishchanka left behind not only canvases housed in the Tretyakov Gallery and private collections of world leaders (B. Clinton, F. Mitterrand), but an entire school of Belarusian monumental tapestry. The Borisov Decorative and Applied Arts Combine, where his great tapestries were created, now bears his name.';
}

// Path: seo.aboutAuthor
class Translations$seo$aboutAuthor$en {
	Translations$seo$aboutAuthor$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Alexander Kishchenko — People's Artist of Belarus | KISHCHANKA.ART'
	String get title => 'Alexander Kishchenko — People\'s Artist of Belarus | KISHCHANKA.ART';

	/// en: 'Alexander Mikhailovich Kishchenko (1933–1997) — People's Artist of Belarus, painter and monumentalist. Author of the world's largest tapestry and the Chernobyl tapestry at the UN.'
	String get description => 'Alexander Mikhailovich Kishchenko (1933–1997) — People\'s Artist of Belarus, painter and monumentalist. Author of the world\'s largest tapestry and the Chernobyl tapestry at the UN.';

	/// en: 'Alexander Kishchenko, biography, Belarusian artist, monumentalist, tapestry'
	String get keywords => 'Alexander Kishchenko, biography, Belarusian artist, monumentalist, tapestry';
}

// Path: seo.catalog
class Translations$seo$catalog$en {
	Translations$seo$catalog$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Catalog of Works by Alexander Kishchenko | KISHCHANKA.ART'
	String get title => 'Catalog of Works by Alexander Kishchenko | KISHCHANKA.ART';

	/// en: 'Catalog of paintings and tapestries by Alexander Kishchenko: portraits, landscapes, and philosophical works from 1958–1997.'
	String get description => 'Catalog of paintings and tapestries by Alexander Kishchenko: portraits, landscapes, and philosophical works from 1958–1997.';

	/// en: 'Kishchenko catalog, paintings, tapestries, buy Kishchenko art'
	String get keywords => 'Kishchenko catalog, paintings, tapestries, buy Kishchenko art';
}

// Path: seo.news
class Translations$seo$news$en {
	Translations$seo$news$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'News & Exhibitions | KISHCHANKA.ART'
	String get title => 'News & Exhibitions | KISHCHANKA.ART';

	/// en: 'News, exhibitions, and events related to the legacy of Alexander Kishchenko and the KISHCHANKA.ART gallery.'
	String get description => 'News, exhibitions, and events related to the legacy of Alexander Kishchenko and the KISHCHANKA.ART gallery.';

	/// en: 'Kishchenko exhibitions, gallery news, events'
	String get keywords => 'Kishchenko exhibitions, gallery news, events';
}

// Path: seo.films
class Translations$seo$films$en {
	Translations$seo$films$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Documentary Films about A. Kishchenko | KISHCHANKA.ART'
	String get title => 'Documentary Films about A. Kishchenko | KISHCHANKA.ART';

	/// en: 'Documentary films and videos about Alexander Kishchenko, his art, and monumental works.'
	String get description => 'Documentary films and videos about Alexander Kishchenko, his art, and monumental works.';

	/// en: 'Kishchenko documentary, film, Tapestry of the Century, video'
	String get keywords => 'Kishchenko documentary, film, Tapestry of the Century, video';
}

// Path: seo.archive
class Translations$seo$archive$en {
	Translations$seo$archive$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Archive & Publications | KISHCHANKA.ART'
	String get title => 'Archive & Publications | KISHCHANKA.ART';

	/// en: 'Archive of publications and materials about Alexander Kishchenko's art and exhibitions.'
	String get description => 'Archive of publications and materials about Alexander Kishchenko\'s art and exhibitions.';

	/// en: 'Kishchenko archive, publications, press, articles'
	String get keywords => 'Kishchenko archive, publications, press, articles';
}

// Path: seo.contacts
class Translations$seo$contacts$en {
	Translations$seo$contacts$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Contact | KISHCHANKA.ART'
	String get title => 'Contact | KISHCHANKA.ART';

	/// en: 'Contact the KISHCHANKA.ART gallery: studio in Minsk, phone, Instagram and VK.'
	String get description => 'Contact the KISHCHANKA.ART gallery: studio in Minsk, phone, Instagram and VK.';

	/// en: 'Kishchenko gallery contact, Minsk studio, buy painting'
	String get keywords => 'Kishchenko gallery contact, Minsk studio, buy painting';
}

// Path: archiveFeed.items.boguchar2026
class Translations$archiveFeed$items$boguchar2026$en {
	Translations$archiveFeed$items$boguchar2026$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Guided tour «The Life Story of M. A. Kishchenko»'
	String get title => 'Guided tour «The Life Story of M. A. Kishchenko»';

	/// en: 'On 19 February 2026 the Boguchar Museum hosted a guided tour for pupils of the Dyachenkovo village school («Pervyh» movement), introducing them to the life and work of the renowned artist Alexander Mikhailovich Kishchenko.'
	String get excerpt => 'On 19 February 2026 the Boguchar Museum hosted a guided tour for pupils of the Dyachenkovo village school («Pervyh» movement), introducing them to the life and work of the renowned artist Alexander Mikhailovich Kishchenko.';
}

// Path: archiveFeed.items.priorbankChtobyChuvstvovat
class Translations$archiveFeed$items$priorbankChtobyChuvstvovat$en {
	Translations$archiveFeed$items$priorbankChtobyChuvstvovat$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Exhibition «To Feel» — the Priorbank collection'
	String get title => 'Exhibition «To Feel» — the Priorbank collection';

	/// en: 'Priorbank presents its corporate collection of Belarusian painting from the 1960s to the 2000s to the public for the first time, assembled over more than 30 years. The exhibition «To Feel» at the Rumyantsev and Paskevich Palace runs from 10 April to 7 June and features over 70 unique canvases, including three works by Alexander Kishchenko.'
	String get excerpt => 'Priorbank presents its corporate collection of Belarusian painting from the 1960s to the 2000s to the public for the first time, assembled over more than 30 years. The exhibition «To Feel» at the Rumyantsev and Paskevich Palace runs from 10 April to 7 June and features over 70 unique canvases, including three works by Alexander Kishchenko.';
}

// Path: archiveFeed.items.nitiSudby
class Translations$archiveFeed$items$nitiSudby$en {
	Translations$archiveFeed$items$nitiSudby$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Alexander Kishchenko. Threads of Fate'
	String get title => 'Alexander Kishchenko. Threads of Fate';

	/// en: 'The museum hosted the grand opening of the exhibition «Alexander Kishchenko. Threads of Fate» (12+), dedicated to the work of the outstanding Belarusian artist, a native of the Boguchar district of the Voronezh region. The exhibition is organised to mark the 300th anniversary of the Voronezh Governorate and is part of the region's cultural exchange with the Republic of Belarus.'
	String get excerpt => 'The museum hosted the grand opening of the exhibition «Alexander Kishchenko. Threads of Fate» (12+), dedicated to the work of the outstanding Belarusian artist, a native of the Boguchar district of the Voronezh region. The exhibition is organised to mark the 300th anniversary of the Voronezh Governorate and is part of the region\'s cultural exchange with the Republic of Belarus.';
}

// Path: archiveFeed.items.boguchar2024
class Translations$archiveFeed$items$boguchar2024$en {
	Translations$archiveFeed$items$boguchar2024$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Guided tour «The Life Story of A. M. Kishchenko»'
	String get title => 'Guided tour «The Life Story of A. M. Kishchenko»';

	/// en: 'Alexander Mikhailovich Kishchenko was one of the most gifted figures of the Boguchar region — a People's Artist of the Republic of Belarus and an honorary citizen of the Boguchar district. A member of the USSR Union of Artists and laureate of the State Prize, he left a vivid mark on the history of art.'
	String get excerpt => 'Alexander Mikhailovich Kishchenko was one of the most gifted figures of the Boguchar region — a People\'s Artist of the Republic of Belarus and an honorary citizen of the Boguchar district. A member of the USSR Union of Artists and laureate of the State Prize, he left a vivid mark on the history of art.';
}

// Path: archiveFeed.items.belgazprombankKraskiPobedy
class Translations$archiveFeed$items$belgazprombankKraskiPobedy$en {
	Translations$archiveFeed$items$belgazprombankKraskiPobedy$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Belgazprombank invites you to the exhibition «Colours of the Great Victory»'
	String get title => 'Belgazprombank invites you to the exhibition «Colours of the Great Victory»';

	/// en: '28 June 2024. On the eve of the 80th anniversary of Belarus's liberation from the Nazi-German invaders, the themed exhibition «Colours of the Great Victory» was solemnly opened in the lobby of the Belgazprombank headquarters. It brings together works by Belarusian artists who knew the horrors of war first-hand — A. Kishchenko, V. Protaseni, I. Stasevich, N. Churabo, I. Rey, P. Daneliya and others.'
	String get excerpt => '28 June 2024. On the eve of the 80th anniversary of Belarus\'s liberation from the Nazi-German invaders, the themed exhibition «Colours of the Great Victory» was solemnly opened in the lobby of the Belgazprombank headquarters. It brings together works by Belarusian artists who knew the horrors of war first-hand — A. Kishchenko, V. Protaseni, I. Stasevich, N. Churabo, I. Rey, P. Daneliya and others.';
}

// Path: archiveFeed.items.nebaZiamlja
class Translations$archiveFeed$items$nebaZiamlja$en {
	Translations$archiveFeed$items$nebaZiamlja$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The Sky and the Earth of Alexander Kishchenko'
	String get title => 'The Sky and the Earth of Alexander Kishchenko';

	/// en: 'On 6 May 2023 the National Art Museum of the Republic of Belarus opens the exhibition «The Sky and the Earth of Alexander Kishchenko», dedicated to the scale of his artistic thinking and the significance of the master's legacy.'
	String get excerpt => 'On 6 May 2023 the National Art Museum of the Republic of Belarus opens the exhibition «The Sky and the Earth of Alexander Kishchenko», dedicated to the scale of his artistic thinking and the significance of the master\'s legacy.';
}

// Path: films.items.ispovedVremeni
class Translations$films$items$ispovedVremeni$en {
	Translations$films$items$ispovedVremeni$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'A. Kishchenko. Confession of Time'
	String get title => 'A. Kishchenko. Confession of Time';

	/// en: 'A documentary about Alexander Mikhailovich Kishchenko (1933–1997), People's Artist of Belarus and author of the world's largest tapestry. Directed by V. Korolyov; filming and editing by E. Milkovskiy.'
	String get excerpt => 'A documentary about Alexander Mikhailovich Kishchenko (1933–1997), People\'s Artist of Belarus and author of the world\'s largest tapestry. Directed by V. Korolyov; filming and editing by E. Milkovskiy.';
}

// Path: films.items.aleksandrKishchenko
class Translations$films$items$aleksandrKishchenko$en {
	Translations$films$items$aleksandrKishchenko$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Alexander Kishchenko'
	String get title => 'Alexander Kishchenko';

	/// en: 'Television feature on the life and work of Alexander Kishchenko, taking the viewer through his monumental panels in Minsk, the «Tapestry of the Century» and the artist's quest for Universal Realism.'
	String get excerpt => 'Television feature on the life and work of Alexander Kishchenko, taking the viewer through his monumental panels in Minsk, the «Tapestry of the Century» and the artist\'s quest for Universal Realism.';
}

// Path: films.items.voronezhKramskoyExhibition
class Translations$films$items$voronezhKramskoyExhibition$en {
	Translations$films$items$voronezhKramskoyExhibition$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'A. M. Kishchanka exhibition at the I. N. Kramskoy Voronezh Art Museum'
	String get title => 'A. M. Kishchanka exhibition at the I. N. Kramskoy Voronezh Art Museum';

	/// en: 'A report on the exhibition of works by the renowned Belarusian artist Alexander Kishchanka at the I. N. Kramskoy Voronezh Regional Art Museum.'
	String get excerpt => 'A report on the exhibition of works by the renowned Belarusian artist Alexander Kishchanka at the I. N. Kramskoy Voronezh Regional Art Museum.';
}

// Path: films.items.mastersOfSovietArt1988
class Translations$films$items$mastersOfSovietArt1988$en {
	Translations$films$items$mastersOfSovietArt1988$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'A. Kishchanka. «Masters of Soviet Art» series. 1988 album'
	String get title => 'A. Kishchanka. «Masters of Soviet Art» series. 1988 album';

	/// en: 'A video review of the 1988 album from the «Masters of Soviet Art» series, dedicated to Alexander Kishchanka's paintings and monumental works.'
	String get excerpt => 'A video review of the 1988 album from the «Masters of Soviet Art» series, dedicated to Alexander Kishchanka\'s paintings and monumental works.';
}

// Path: films.items.bogucharLecture
class Translations$films$items$bogucharLecture$en {
	Translations$films$items$bogucharLecture$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Lecture «A countryman of world renown». A. M. Kishchanka. Boguchar Museum'
	String get title => 'Lecture «A countryman of world renown». A. M. Kishchanka. Boguchar Museum';

	/// en: 'A lecture from the Boguchar Local History Museum about Alexander Mikhailovich Kishchanka — a countryman of world renown, born in the Boguchar district.'
	String get excerpt => 'A lecture from the Boguchar Local History Museum about Alexander Mikhailovich Kishchanka — a countryman of world renown, born in the Boguchar district.';
}

// Path: films.items.culturalCodesTapestries
class Translations$films$items$culturalCodesTapestries$en {
	Translations$films$items$culturalCodesTapestries$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cultural Codes of the Nation: Where are the tapestries of the People's Artist Kishchanka now? Main Broadcast'
	String get title => 'Cultural Codes of the Nation: Where are the tapestries of the People\'s Artist Kishchanka now? Main Broadcast';

	/// en: 'The «Main Broadcast» programme, in its «Cultural Codes of the Nation» segment, traces the present whereabouts of the tapestries by Belarus's People's Artist Alexander Kishchanka.'
	String get excerpt => 'The «Main Broadcast» programme, in its «Cultural Codes of the Nation» segment, traces the present whereabouts of the tapestries by Belarus\'s People\'s Artist Alexander Kishchanka.';
}

// Path: films.items.tapestryOfCenturyMinsk
class Translations$films$items$tapestryOfCenturyMinsk$en {
	Translations$films$items$tapestryOfCenturyMinsk$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Preparing «The Tapestry of the Century» for display at the Development Bank in Minsk'
	String get title => 'Preparing «The Tapestry of the Century» for display at the Development Bank in Minsk';

	/// en: 'A behind-the-scenes report on how Alexander Kishchanka's «Tapestry of the Century» was prepared for display at the Development Bank in Minsk.'
	String get excerpt => 'A behind-the-scenes report on how Alexander Kishchanka\'s «Tapestry of the Century» was prepared for display at the Development Bank in Minsk.';
}

// Path: films.items.chernobylTapestryFacts
class Translations$films$items$chernobylTapestryFacts$en {
	Translations$films$items$chernobylTapestryFacts$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'The «Century» and «Chernobyl» tapestries. Interesting facts'
	String get title => 'The «Century» and «Chernobyl» tapestries. Interesting facts';

	/// en: 'A video about Alexander Kishchanka's iconic tapestries — «The Tapestry of the Century» and «Chernobyl»: their backstory, symbolism, and curious facts.'
	String get excerpt => 'A video about Alexander Kishchanka\'s iconic tapestries — «The Tapestry of the Century» and «Chernobyl»: their backstory, symbolism, and curious facts.';
}

// Path: films.items.kishchenkoReel1
class Translations$films$items$kishchenkoReel1$en {
	Translations$films$items$kishchenkoReel1$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'A. Kishchenko on Instagram'
	String get title => 'A. Kishchenko on Instagram';

	/// en: 'A short clip about the works of Alexander Kishchenko from social media.'
	String get excerpt => 'A short clip about the works of Alexander Kishchenko from social media.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
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
