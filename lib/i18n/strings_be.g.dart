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
class TranslationsBe extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsBe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.be,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <be>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsBe _root = this; // ignore: unused_field

	@override 
	TranslationsBe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsBe(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$be app = _Translations$app$be._(_root);
	@override late final _Translations$navigation$be navigation = _Translations$navigation$be._(_root);
	@override late final _Translations$catalog$be catalog = _Translations$catalog$be._(_root);
	@override late final _Translations$common$be common = _Translations$common$be._(_root);
	@override late final _Translations$tour$be tour = _Translations$tour$be._(_root);
	@override late final _Translations$language$be language = _Translations$language$be._(_root);
	@override late final _Translations$archiveFeed$be archiveFeed = _Translations$archiveFeed$be._(_root);
	@override late final _Translations$films$be films = _Translations$films$be._(_root);
	@override late final _Translations$newsFeed$be newsFeed = _Translations$newsFeed$be._(_root);
	@override late final _Translations$bio$be bio = _Translations$bio$be._(_root);
	@override late final _Translations$contacts$be contacts = _Translations$contacts$be._(_root);
	@override late final _Translations$seo$be seo = _Translations$seo$be._(_root);
}

// Path: app
class _Translations$app$be extends Translations$app$ru {
	_Translations$app$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'КІШЧАНКА.АРТ';
	@override String get brandTagline => 'Калекцыя выяўленчага мастацтва';
	@override String get logoMark => 'КА';
}

// Path: navigation
class _Translations$navigation$be extends Translations$navigation$ru {
	_Translations$navigation$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get aboutAuthor => 'Пра аўтара';
	@override String get news => 'Навіны';
	@override String get catalogOfWorks => 'Каталог прац';
	@override String get films => 'Фільмы';
	@override String get archive => 'Архіў';
	@override String get contacts => 'Кантакты';
}

// Path: catalog
class _Translations$catalog$be extends Translations$catalog$ru {
	_Translations$catalog$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get workPrefix => 'Праца';
	@override String get errorTitle => 'Не атрымалася загрузіць карціны';
	@override String errorWithDetails({required Object message}) => 'Не атрымалася загрузіць карціны. ${message}';
	@override late final _Translations$catalog$decade$be decade = _Translations$catalog$decade$be._(_root);
	@override late final _Translations$catalog$paintingNames$be paintingNames = _Translations$catalog$paintingNames$be._(_root);
	@override late final _Translations$catalog$paintingMediums$be paintingMediums = _Translations$catalog$paintingMediums$be._(_root);
}

// Path: common
class _Translations$common$be extends Translations$common$ru {
	_Translations$common$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get pageNotFound => 'Старонка не знойдзена';
	@override String get viewCatalog => 'ПАГЛЯДЗЕЦЬ КАТАЛОГ';
	@override String get learnMore => 'ПАДРАБЯЗНЕЙ';
	@override late final _Translations$common$video$be video = _Translations$common$video$be._(_root);
}

// Path: tour
class _Translations$tour$be extends Translations$tour$ru {
	_Translations$tour$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get next => 'Далей';
	@override String get gotIt => 'Зразумела';
	@override String get back => 'Назад';
	@override String get chernobylBody => 'Габелен «Чарнобыль» (1991) перададзены ў дар ААН і сёння ўпрыгожвае яе штаб-кватэру ў Нью-Ёрку. Генеральны сакратар ААН параўнаў яго з «Гернікай» Пікаса.';
	@override String get originsTitle => 'Ля вытокаў «Сусветнага рэалізму»';
	@override String get originsBody => 'Аляксандр Міхайлавіч Кішчанка (1933–1997). Жывапісец. Філосаф. Манументаліст. Нарадзіўся ў хутары Белы Калодзеж (цяпер Багучарскі раён, Варонежская вобласць) і набыў сусветную вядомасць.';
	@override String get scaleTitle => 'Маштаб габелена стагоддзя';
	@override String get scaleBody => 'Палатно памерам 19 × 14 метраў (каля 300 кв. м), вагой больш за тону — памерам з пяціпавярховы будынак. Унесена ў Кнігу рэкордаў Гінеса.';
}

// Path: language
class _Translations$language$be extends Translations$language$ru {
	_Translations$language$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get label => 'Мова';
	@override String get russian => 'Рускі';
	@override String get english => 'Англійская';
	@override String get spanish => 'Іспанская';
	@override String get french => 'Французская';
	@override String get german => 'Нямецкая';
	@override String get belarusian => 'Беларуская';
}

// Path: archiveFeed
class _Translations$archiveFeed$be extends Translations$archiveFeed$ru {
	_Translations$archiveFeed$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Архіў публікацый';
	@override String get latestLabel => 'Апошняя публікацыя';
	@override String get moreLabel => 'Навіны і матэрыялы';
	@override String get openArticle => 'Адкрыць артыкул';
	@override String get sourceLabel => 'Крыніца';
	@override String yearLabel({required Object year}) => '${year} год';
	@override late final _Translations$archiveFeed$items$be items = _Translations$archiveFeed$items$be._(_root);
}

// Path: films
class _Translations$films$be extends Translations$films$ru {
	_Translations$films$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Фільмы і дакументальныя стужкі';
	@override String get subtitle => 'Відэаархіў пра А. Кішчанку';
	@override String get latestLabel => 'Галоўны фільм';
	@override String get sourceLabel => 'Крыніца';
	@override String get instagramTitle => 'Instagram';
	@override String get instagramSubtitle => 'Кароткія відэа і гісторыі';
	@override late final _Translations$films$watchOn$be watchOn = _Translations$films$watchOn$be._(_root);
	@override late final _Translations$films$items$be items = _Translations$films$items$be._(_root);
}

// Path: newsFeed
class _Translations$newsFeed$be extends Translations$newsFeed$ru {
	_Translations$newsFeed$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Навіны';
	@override String get subtitle => 'Публікацыі, выставы і падзеі';
	@override String get emptyState => 'Навін пакуль няма. Зазірніце пазней.';
	@override String get errorTitle => 'Не ўдалося загрузіць навіны';
	@override String get retry => 'Паўтарыць';
	@override String get back => 'Да спісу навін';
	@override String get sourceLabel => 'Крыніца';
	@override String get readTimeLabel => 'Час чытання';
	@override String readTimeValue({required Object minutes}) => '${minutes} хв';
	@override String get viewsLabel => 'Праглядаў';
	@override String get publishedLabel => 'Апублікавана';
}

// Path: bio
class _Translations$bio$be extends Translations$bio$ru {
	_Translations$bio$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get heroTitle => 'МАСТАЦТВА КАСМІЧНАГА МАШТАБУ';
	@override String get heroSubtitle => 'Мастацтва, якое сцірае межы паміж зямным і вечным. Народны мастак Рэспублікі Беларусь, стваральнік найбуйнейшага ў свеце «Гобелена стагоддзя»';
	@override String get heroBrandName => 'Аляксандр Міхайлавіч Кішчанка';
	@override String get name => 'Аляксандр Міхайлавіч Кішчанка (1933–1997)';
	@override String get tagline => 'Жывапісец. Філосаф. Манументаліст. Заснавальнік «Сусветнага рэалізму».';
	@override String get intro => 'Аляксандр Кішчанка — постаць рэнесансавага маштабу ў мастацтве XX стагоддзя. Чалавек, якому ўдалося ператварыць мяккую нітку гобелена ў магутнае архітэктурнае выказванне, а сцены гарадоў — у адкрытыя кнігі філасофскіх сэнсаў. Яго творчасць — гэта мост паміж архаікай і космасам, паміж болем зямлі і святлом далёкіх галактык.';
	@override late final _Translations$bio$feature$be feature = _Translations$bio$feature$be._(_root);
	@override late final _Translations$bio$universalRealism$be universalRealism = _Translations$bio$universalRealism$be._(_root);
	@override late final _Translations$bio$tapestry$be tapestry = _Translations$bio$tapestry$be._(_root);
	@override late final _Translations$bio$chernobyl$be chernobyl = _Translations$bio$chernobyl$be._(_root);
	@override late final _Translations$bio$mosaic$be mosaic = _Translations$bio$mosaic$be._(_root);
	@override late final _Translations$bio$legacy$be legacy = _Translations$bio$legacy$be._(_root);
	@override String get quote => 'Мастацтва — гэта боская з\'ява. Толькі яно можа спыніць час. Мастацтва здольнае разгадаць таямніцу будучыні, а таксама аднавіць страчанае мінулае.';
	@override String get quoteAuthor => '— Аляксандр Кішчанка';
	@override String get wikipediaLinkLabel => 'ЧЫТАЦЬ У ВІКІПЕДЫІ';
}

// Path: contacts
class _Translations$contacts$be extends Translations$contacts$ru {
	_Translations$contacts$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Кантакты';
	@override String get tagline => 'Звяжыцеся са студыяй.';
	@override String get phoneSectionLabel => 'Тэлефон';
	@override String get phoneSectionHint => 'Званкі і WhatsApp';
	@override String get instagramSectionLabel => 'Instagram';
	@override String get instagramHandle => '@kishchenko.art';
	@override String get vkSectionLabel => 'УКантакце';
	@override String get vkHandle => 'aleksandrkishchenko';
	@override String get vkScanQrHint => 'Адсканіруйце QR, каб адкрыць старонку УКантакце';
	@override String get studioSectionTitle => 'Майстэрня аўтара';
	@override String get studioAddress => 'Мінск, вул. Сурганава, 44 — 7 паверх';
	@override String get openInOsm => 'АДКРЫЦЬ У OPENSTREETMAP';
	@override String get mapAttribution => '© OpenStreetMap contributors';
}

// Path: seo
class _Translations$seo$be extends Translations$seo$ru {
	_Translations$seo$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override late final _Translations$seo$aboutAuthor$be aboutAuthor = _Translations$seo$aboutAuthor$be._(_root);
	@override late final _Translations$seo$catalog$be catalog = _Translations$seo$catalog$be._(_root);
	@override late final _Translations$seo$news$be news = _Translations$seo$news$be._(_root);
	@override late final _Translations$seo$films$be films = _Translations$seo$films$be._(_root);
	@override late final _Translations$seo$archive$be archive = _Translations$seo$archive$be._(_root);
	@override late final _Translations$seo$contacts$be contacts = _Translations$seo$contacts$be._(_root);
}

// Path: catalog.decade
class _Translations$catalog$decade$be extends Translations$catalog$decade$ru {
	_Translations$catalog$decade$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get all => 'Усе';
	@override String get sixties => '60-я';
	@override String get seventies => '70-я';
	@override String get eighties => '80-я';
	@override String get nineties => '90-я';
}

// Path: catalog.paintingNames
class _Translations$catalog$paintingNames$be extends Translations$catalog$paintingNames$ru {
	_Translations$catalog$paintingNames$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get id1958_1 => 'Ускраіна. Стары млын';
	@override String get id1958_2 => 'Ангеліна';
	@override String get id1958_3 => 'Туалет';
	@override String get id1959_1 => 'Жаночы партрэт';
	@override String get id1960_1 => 'Кампазіцыя №1';
	@override String get id1960_2 => 'Жаночы партрэт у зялёных танах';
	@override String get id1960_3 => 'Першы снег';
	@override String get id1960_4 => 'Жанчына ў крэсле';
	@override String get id1960_5 => 'Партрэт мастака Уладзіміра Урышчанкі';
	@override String get id1960_6 => 'Дзяўчынка з бантам';
	@override String get id1960_7 => 'Жаночы партрэт';
	@override String get id1960_8 => 'Жаночы партрэт';
	@override String get id1960_9 => 'Чаканне';
	@override String get id1962_1 => 'Паўночніца (Жанчына з поўначы)';
	@override String get id1965_1 => 'Жаночы партрэт';
	@override String get id1965_2 => 'Цыркавы хлопец';
	@override String get id1965_3 => 'Спакуса';
	@override String get id1967_1 => 'Зоя Літвінава';
	@override String get id1967_2 => 'Два жыцці';
	@override String get id1968_1 => 'Нацюрморт з грушамі';
	@override String get id1969_1 => 'Анёл';
	@override String get id1970_1 => 'Настаўніца';
	@override String get id1970_2 => 'Апошні севастапалец';
	@override String get id1972_1 => 'Партрэт Жэні Мусінскай';
	@override String get id1974_1 => 'Дзяўчына ў рускім касцюме';
	@override String get id1975_1 => 'Першынец';
	@override String get id1976_1 => 'Дзяўчына ў чырвоным з залатым (Зялёны вінаград)';
	@override String get id1979_1 => 'Маці з дзіцём';
	@override String get id1979_2 => 'Наташа';
	@override String get id1979_3 => 'Забойства сям\'і Гомавых. Дзеянне 1943. Тамань.';
	@override String get id1979_4 => 'Эскіз да работы "Боль паэта"';
	@override String get id1979_5 => 'Радасць. Мацярынства';
	@override String get id1980_1 => 'Фрагмент да карціны "Мёд"';
	@override String get id1980_2 => 'Партрэт мамы';
	@override String get id1980_3 => 'Ніна';
	@override String get id1980_4 => 'Наташа Марчанка';
	@override String get id1980_5 => 'Наташа';
	@override String get id1981_1 => 'Роздум';
	@override String get id1981_2 => 'Партрэт Алены Абразцовай';
	@override String get id1982_1 => 'Аўтапартрэт';
	@override String get id1982_2 => 'Адам і Ева';
	@override String get id1982_3 => 'Зняважэнне храма';
	@override String get id1982_4 => 'Мракабесы';
	@override String get id1982_5 => 'Сланечнікі';
	@override String get id1982_6 => 'Пейзаж';
	@override String get id1983_1 => 'Мадонна';
	@override String get id1983_2 => 'Змова (Клятва масонаў)';
	@override String get id1983_3 => 'Ніна';
	@override String get id1983_4 => 'Партрэт Марыі Бешу';
	@override String get id1983_5 => 'Кліч мора';
	@override String get id1983_6 => 'Плач';
	@override String get id1983_7 => 'Наташа';
	@override String get id1984_1 => 'Ніна';
	@override String get id1984_2 => 'Ніна';
	@override String get id1985_1 => 'Дзядзька Ваня';
	@override String get id1985_2 => 'Дзяўчынка ў чырвоным капелюшы';
	@override String get id1985_3 => 'Жаночы вобраз. Наташа Татарэнка';
	@override String get id1985_4 => 'Мужчынскі партрэт';
	@override String get id1985_5 => 'Летні душ';
	@override String get id1986_1 => 'Партрэт дзяўчынкі';
	@override String get id1986_2 => 'Партрэт кінааператара А. Абадоўскага';
	@override String get id1986_3 => 'Апошнія дні верасня';
	@override String get id1986_4 => 'Партрэт Бушчыка';
	@override String get id1986_5 => 'Партрэт Наташы Марчанкі';
	@override String get id1987_1 => 'Ён будзе жыць. Чарнобыль';
	@override String get id1987_2 => 'Жаночы партрэт';
	@override String get id1988_1 => 'Партрэт Машы';
	@override String get id1988_2 => 'Мужчынская галава';
	@override String get id1988_3 => 'Профіль';
	@override String get id1988_4 => 'Ідучая';
	@override String get id1989_1 => 'На беразе Дона';
	@override String get id1989_2 => 'Раніца';
	@override String get id1989_3 => 'Партрэт мастачкі Тамары Кіршчынай';
	@override String get id1989_4 => 'Аголеная ў прасторы музыкі';
	@override String get id1989_5 => 'Ідучая (Сусвет)';
	@override String get id1989_6 => 'Ніна';
	@override String get id1989_7 => 'Брат і сястра Ялькіны';
	@override String get id1989_8 => 'Ніна';
	@override String get id1989_9 => 'Аголеная';
	@override String get id1990_1 => 'У прасторы (Аголеная)';
	@override String get id1990_2 => 'Дары планет';
	@override String get id1990_3 => 'Зоя';
	@override String get id1990_4 => 'Мужчынскі партрэт';
	@override String get id1990_5 => 'На балконе';
	@override String get id1991_1 => 'Дзяўчынка з мёдам (Сусвет)';
	@override String get id1991_2 => 'Мара';
	@override String get id1991_3 => 'Вечная';
	@override String get id1992_1 => 'Партрэт з марской ракавінай';
	@override String get id1992_2 => 'Сатыр і Німфа';
	@override String get id1992_3 => 'Хлопчык з пеўнем';
	@override String get id1992_4 => 'Ніна і Максім';
	@override String get id1992_5 => 'Рускі мужык';
	@override String get id1992_6 => 'Партрэт Франца Коха';
	@override String get id1992_7 => 'Ніна';
	@override String get id1992_8 => 'Вольга';
	@override String get id1992_9 => 'Не балуйся, Максім!';
	@override String get id1992_10 => 'Гобелен "Сланечнікі"';
	@override String get id1993_1 => 'Вечнае';
	@override String get id1993_2 => 'Партрэт скульптара Лены Харабярюш';
	@override String get id1993_3 => 'Аптэкар';
	@override String get id1993_4 => 'Оля';
	@override String get id1993_5 => 'Маці і дзіця';
	@override String get id1993_6 => 'Хрыстос';
	@override String get id1993_7 => 'Наташа';
	@override String get id1993_8 => 'Партрэт невядомай';
	@override String get id1993_9 => 'Раман';
	@override String get id1994_1 => 'Пад сузор\'ем Льва';
	@override String get id1994_2 => 'Партрэт Зоі';
	@override String get id1994_3 => 'Закінуты двор';
	@override String get id1994_4 => 'Наташа';
	@override String get id1994_5 => 'Песня';
	@override String get id1994_6 => 'Дзяўчынка з нацюрмортам з яблыкамі';
	@override String get id1994_7 => 'Якая крычыць';
	@override String get id1994_8 => 'Наташа';
	@override String get id1994_9 => 'Вакханалія';
	@override String get id1995_1 => 'Маленькі фантазёр';
	@override String get id1995_2 => 'Мая Радзіма';
	@override String get id1995_3 => 'Ню';
	@override String get id1995_4 => 'Вольга Калтакова';
	@override String get id1995_5 => 'Тамара Кіршчына зі спіны';
	@override String get id1995_6 => 'Оля';
	@override String get id1995_7 => 'Смутак';
	@override String get id1995_8 => 'Партрэт дзяўчынкі';
	@override String get id1995_9 => 'Сусвет';
	@override String get id1995_10 => 'Лёша';
	@override String get id1995_11 => 'Партрэт Растыкава';
	@override String get id1995_12 => 'Мастацтвазнаўца Надзя';
	@override String get id1995_13 => 'Мелодыя';
	@override String get id1995_14 => 'Таня';
	@override String get id1995_15 => 'Эскіз карціны «Партрэт Ніны»';
	@override String get id1995_16 => 'Нацюрморт';
	@override String get id1995_17 => 'Гобелен "Мора" ("Хваля")';
	@override String get id1996_1 => 'Нацюрморт з яблыкамі';
	@override String get id1996_2 => 'Аголеная';
	@override String get id1996_3 => 'Максім з кавуном';
	@override String get id1996_4 => 'Гімн (Захапленне)';
	@override String get id1996_5 => 'Ніна';
	@override String get id1996_6 => 'Іна';
	@override String get id1996_7 => 'Алла Астаховіч';
	@override String get id1996_8 => 'Лена';
	@override String get id1996_9 => 'Жаночы партрэт (Ніна №1)';
	@override String get id1996_10 => 'Сусвет';
	@override String get id1996_11 => 'Якія плывуць у чоўне';
	@override String get id1996_12 => 'Жаночы партрэт з хусткай';
	@override String get id1996_13 => 'Мама';
	@override String get id1996_14 => 'Філарэт Мінскі';
	@override String get id1996_15 => 'Нацюрморт у прасторы';
	@override String get id1996_16 => 'Партрэт Кучынскага';
	@override String get id1996_17 => 'Жаночы партрэт';
	@override String get id1996_18 => 'Мой Сусвет';
	@override String get id1997_1 => 'Іван';
	@override String get id1997_2 => 'Партрэт архітэктара Уладзіміра Салазкіна';
	@override String get id1997_3 => 'Вайна светаў (апошняя работа)';
	@override String get id1997_4 => 'Аўтапартрэт';
	@override String get id1997_5 => 'Лета ў Багучары';
	@override String get id1997_6 => 'Дзве ўдовы';
	@override String get idunknown_1 => 'Паводка';
	@override String get idunknown_2 => 'Жаночы партрэт';
	@override String get idunknown_3 => 'Блакітныя калючкі';
	@override String get idunknown_4 => 'Ніна';
	@override String get idunknown_5 => 'Ніна';
}

// Path: catalog.paintingMediums
class _Translations$catalog$paintingMediums$be extends Translations$catalog$paintingMediums$ru {
	_Translations$catalog$paintingMediums$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get canvasOil => 'Палатно, алей';
	@override String get hardboardOil => 'ДВП, алей';
	@override String get cardboard => 'Кардон';
	@override String get woolLinenWeaving => 'Воўна, лён, ткацтва';
}

// Path: common.video
class _Translations$common$video$be extends Translations$common$video$ru {
	_Translations$common$video$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get loadError => 'Не атрымалася загрузіць відэа';
	@override String get openExternally => 'Адкрыць у знешнім плэеры';
}

// Path: archiveFeed.items
class _Translations$archiveFeed$items$be extends Translations$archiveFeed$items$ru {
	_Translations$archiveFeed$items$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override late final _Translations$archiveFeed$items$boguchar2026$be boguchar2026 = _Translations$archiveFeed$items$boguchar2026$be._(_root);
	@override late final _Translations$archiveFeed$items$priorbankChtobyChuvstvovat$be priorbankChtobyChuvstvovat = _Translations$archiveFeed$items$priorbankChtobyChuvstvovat$be._(_root);
	@override late final _Translations$archiveFeed$items$nitiSudby$be nitiSudby = _Translations$archiveFeed$items$nitiSudby$be._(_root);
	@override late final _Translations$archiveFeed$items$boguchar2024$be boguchar2024 = _Translations$archiveFeed$items$boguchar2024$be._(_root);
	@override late final _Translations$archiveFeed$items$belgazprombankKraskiPobedy$be belgazprombankKraskiPobedy = _Translations$archiveFeed$items$belgazprombankKraskiPobedy$be._(_root);
	@override late final _Translations$archiveFeed$items$nebaZiamlja$be nebaZiamlja = _Translations$archiveFeed$items$nebaZiamlja$be._(_root);
}

// Path: films.watchOn
class _Translations$films$watchOn$be extends Translations$films$watchOn$ru {
	_Translations$films$watchOn$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get youtube => 'Глядзець на YouTube';
	@override String get googleDrive => 'Глядзець на Google Дыску';
	@override String get instagram => 'Адкрыць у Instagram';
}

// Path: films.items
class _Translations$films$items$be extends Translations$films$items$ru {
	_Translations$films$items$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override late final _Translations$films$items$ispovedVremeni$be ispovedVremeni = _Translations$films$items$ispovedVremeni$be._(_root);
	@override late final _Translations$films$items$aleksandrKishchenko$be aleksandrKishchenko = _Translations$films$items$aleksandrKishchenko$be._(_root);
	@override late final _Translations$films$items$voronezhKramskoyExhibition$be voronezhKramskoyExhibition = _Translations$films$items$voronezhKramskoyExhibition$be._(_root);
	@override late final _Translations$films$items$mastersOfSovietArt1988$be mastersOfSovietArt1988 = _Translations$films$items$mastersOfSovietArt1988$be._(_root);
	@override late final _Translations$films$items$bogucharLecture$be bogucharLecture = _Translations$films$items$bogucharLecture$be._(_root);
	@override late final _Translations$films$items$culturalCodesTapestries$be culturalCodesTapestries = _Translations$films$items$culturalCodesTapestries$be._(_root);
	@override late final _Translations$films$items$tapestryOfCenturyMinsk$be tapestryOfCenturyMinsk = _Translations$films$items$tapestryOfCenturyMinsk$be._(_root);
	@override late final _Translations$films$items$chernobylTapestryFacts$be chernobylTapestryFacts = _Translations$films$items$chernobylTapestryFacts$be._(_root);
	@override late final _Translations$films$items$kishchenkoReel1$be kishchenkoReel1 = _Translations$films$items$kishchenkoReel1$be._(_root);
}

// Path: bio.feature
class _Translations$bio$feature$be extends Translations$bio$feature$ru {
	_Translations$bio$feature$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'СПАДЧЫНА СУСВЕТНАГА МАШТАБУ';
	@override String get body => 'У гэтай калекцыі сабраны творы выбітнага майстра, чыё мастацтва назаўсёды змяніла ўяўленне пра манументальны жывапіс і ткацтва. Ад грандыёзных мазаік, якія сталі візуальным кодам Мінска, да знакамітага «Гобелена стагоддзя» і палатна «Чарнобыль», што ўпрыгожвае штаб-кватэру ААН у Нью-Ёрку. Кожны твор Кішчанкі — гэта філасофскі трактат пра сувязь часоў, космас і нязломны чалавечы дух.';
	@override String get cta => 'ДАСЛЕДАВАЦЬ КАЛЕКЦЫЮ';
	@override String get worksValue => '500+';
	@override String get worksLabel => 'Твораў мастацтва па ўсім свеце';
	@override String get panelsValue => '6+';
	@override String get panelsLabel => 'Манументальныя пано ў Мінску';
	@override String get guinnessValue => '';
	@override String get guinnessLabel => 'Рэкорд Гінеса ў мастацтве';
	@override String get unGiftValue => '';
	@override String get unGiftLabel => 'Падарунак ААН ад Рэспублікі Беларусь';
}

// Path: bio.universalRealism
class _Translations$bio$universalRealism$be extends Translations$bio$universalRealism$ru {
	_Translations$bio$universalRealism$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Заснавальнік «Сусветнага рэалізму»';
	@override String get body => 'Кішчанка не проста адлюстроўваў рэчаіснасць — ён ствараў новую сістэму каардынат, якую назваў Сусветным рэалізмам. Аснову яго метаду складае перакананне, што мастак — гэта «ткач часу», абавязаны злучаць мінулае і будучыню. Яго мастацтва выйшла за межы нацыянальных граніц, аперыруючы катэгорыямі глабальнай чалавечай драмы. Для Кішчанкі чалавек — гэта паўбог, чые ўчынкі рэзаніруюць у маштабах Сусвету. У яго работах цені становяцца самастойнымі формамі, а колер — «касмічнай музыкай», падначаленай строгаму вышэйшаму парадку.';
}

// Path: bio.tapestry
class _Translations$bio$tapestry$be extends Translations$bio$tapestry$ru {
	_Translations$bio$tapestry$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => '«Гобелен стагоддзя»: Вяршыня сусветнага ткацтва';
	@override String get intro => 'Аляксандр Кішчанка ўвайшоў у гісторыю як аўтар самага вялікага гобелена ў свеце, афіцыйна ўнесенага ў Кнігу рэкордаў Гінеса.';
	@override String get scaleLabel => 'Маштаб';
	@override String get scale => 'Палатно памерам 19 × 14 метраў (каля 300 кв. м), вагой больш за тону.';
	@override String get conceptLabel => 'Задума';
	@override String get concept => 'Грандыёзная тканіна гісторыі, дзе перапляліся лёсы 80 знакавых асоб (ад Хрыста і Мадонны да Чэрчыля, Кастра і Гарбачова).';
	@override String get meaningLabel => 'Сэнс';
	@override String get meaning => 'Гэтая работа-храм, у цэнтры якой разгортваецца вечны канфлікт паміж стварэннем і разбурэннем. Работа была прызнана нацыянальным скарбам Беларусі.';
}

// Path: bio.chernobyl
class _Translations$bio$chernobyl$be extends Translations$bio$chernobyl$ru {
	_Translations$bio$chernobyl$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => '«Чарнобыль»: Голас нацыі ў сценах ААН';
	@override String get body => 'Адным з самых эмацыйна моцных твораў майстра стаў гобелен «Чарнобыль» (1991). Адказаны ў дар Арганізацыі Аб\'яднаных Нацый, ён і сёння ўпрыгожвае штаб-кватэру ААН у Нью-Ёрку. Калі свет убачыў гэтае палатно, Генеральны сакратар ААН Перэс дэ Куэльяр параўнаў яго з «Гернікай» Пікаса. Для Кішчанкі гэты гобелен быў не проста памяццю аб трагедыі, а «вачыма Беларусі» — планетарным папярэджаннем аб далікатнасці жыцця, вытканым рукамі вялікіх беларускіх майстрых.';
}

// Path: bio.mosaic
class _Translations$bio$mosaic$be extends Translations$bio$mosaic$ru {
	_Translations$bio$mosaic$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Твар горада: Мазаічныя пано «Усход»';
	@override String get intro => 'Кішчанка сфарміраваў візуальны код сучаснага Мінска. Яго знакамітыя мазаікі на жылых вышынях у мікрараёне Усход-1 сталі візітнай карткай сталіцы.';
	@override String get panelsLabel => 'Чатыры манументальных палатны';
	@override String get panels => '«Горад-воін», «Горад навукі», «Горад культуры» і «Горад-будаўнік».';
	@override String get panelsMeaning => 'Гэтыя работы ператварылі тыпавую забудову ў мастацкую прастору, дзе праз смальту і камень апяваецца трыумф чалавечага духу.';
}

// Path: bio.legacy
class _Translations$bio$legacy$be extends Translations$bio$legacy$ru {
	_Translations$bio$legacy$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Спадчына';
	@override String get body => 'Аляксандр Кішчанка пакінуў пасля сябе не толькі палотны, якія захоўваюцца ў Траццякоўскай галерэі і прыватных калекцыях сусветных лідараў (Б. Клінтана, Ф. Мітэрана), але і цэлую школу беларускага манументальнага гобелена. Яго імя носіць Барысаўскі камбінат дэкаратыўна-прыкладнога мастацтва, дзе стваралісяя яго вялікія шпалеры.';
}

// Path: seo.aboutAuthor
class _Translations$seo$aboutAuthor$be extends Translations$seo$aboutAuthor$ru {
	_Translations$seo$aboutAuthor$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Аляксандр Кішчанка — народны мастак Беларусі | КІШЧАНКА.АРТ';
	@override String get description => 'Аляксандр Міхайлавіч Кішчанка (1933–1997) — народны мастак Рэспублікі Беларусь, жывапісец і манументаліст. Аўтар самага вялікага габелена ў свеце і «Чарнобыля» ў штаб-кватэры ААН.';
	@override String get keywords => 'Аляксандр Кішчанка, біяграфія, беларускі мастак, манументаліст, габелен';
}

// Path: seo.catalog
class _Translations$seo$catalog$be extends Translations$seo$catalog$ru {
	_Translations$seo$catalog$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Каталог прац Аляксандра Кішчанкі | КІШЧАНКА.АРТ';
	@override String get description => 'Каталог жывапісу і габеленаў Аляксандра Кішчанкі: партрэты, пейзажы, філасофскія палотны 1958–1997 гадоў.';
	@override String get keywords => 'каталог прац Кішчанкі, жывапіс, габелены, купіць карціну Кішчанкі';
}

// Path: seo.news
class _Translations$seo$news$be extends Translations$seo$news$ru {
	_Translations$seo$news$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Навіны і выставы | КІШЧАНКА.АРТ';
	@override String get description => 'Навіны, выставы і падзеі, звязаныя са спадчынай Аляксандра Кішчанкі і галерэяй КІШЧАНКА.АРТ.';
	@override String get keywords => 'выставы Кішчанкі, навіны галерэі, падзеі';
}

// Path: seo.films
class _Translations$seo$films$be extends Translations$seo$films$ru {
	_Translations$seo$films$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Дакументальныя фільмы пра А. Кішчанку | КІШЧАНКА.АРТ';
	@override String get description => 'Дакументальныя фільмы і відэаматэрыялы пра Аляксандра Кішчанку, яго творчасць і манументальныя творы.';
	@override String get keywords => 'фільм пра Кішчанку, дакументальны фільм, габелен стагоддзя, відэа';
}

// Path: seo.archive
class _Translations$seo$archive$be extends Translations$seo$archive$ru {
	_Translations$seo$archive$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Архіў публікацый | КІШЧАНКА.АРТ';
	@override String get description => 'Архіў публікацый і матэрыялаў пра творчасць і выставы Аляксандра Міхайлавіча Кішчанкі.';
	@override String get keywords => 'архіў Кішчанкі, публікацыі, артыкулы, прэса';
}

// Path: seo.contacts
class _Translations$seo$contacts$be extends Translations$seo$contacts$ru {
	_Translations$seo$contacts$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Кантакты | КІШЧАНКА.АРТ';
	@override String get description => 'Кантакты галерэі КІШЧАНКА.АРТ: майстэрня ў Мінску, тэлефон, Instagram і УКантакце.';
	@override String get keywords => 'кантакты галерэі Кішчанкі, майстэрня Мінск, купіць карціну';
}

// Path: archiveFeed.items.boguchar2026
class _Translations$archiveFeed$items$boguchar2026$be extends Translations$archiveFeed$items$boguchar2026$ru {
	_Translations$archiveFeed$items$boguchar2026$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Экскурсія «Гісторыя жыцця М. А. Кішчанкі»';
	@override String get excerpt => '19 лютага 2026 года ў сценах Багучарскага музея адбылася экскурсія для вучняў школы вёскі Дзячанкава («Рух першых»), прысвечаная знаёмству з жыццём і творчасцю выдатнага мастака Аляксандра Міхайлавіча Кішчанкі.';
}

// Path: archiveFeed.items.priorbankChtobyChuvstvovat
class _Translations$archiveFeed$items$priorbankChtobyChuvstvovat$be extends Translations$archiveFeed$items$priorbankChtobyChuvstvovat$ru {
	_Translations$archiveFeed$items$priorbankChtobyChuvstvovat$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Выстава «Каб адчуваць» — калекцыя Прыёрбанка';
	@override String get excerpt => 'Прыёрбанк упершыню паказвае публіцы сваю карпаратыўную калекцыю беларускага жывапісу 1960–2000-х гадоў, якая фарміравалася больш за 30 гадоў. На выставе «Каб адчуваць» у палацы Румянцавых і Паскевічаў з 10 красавіка па 7 чэрвеня прадстаўлены больш за 70 унікальных палотнаў, сярод якіх тры работы Аляксандра Кішчанкі.';
}

// Path: archiveFeed.items.nitiSudby
class _Translations$archiveFeed$items$nitiSudby$be extends Translations$archiveFeed$items$nitiSudby$ru {
	_Translations$archiveFeed$items$nitiSudby$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Аляксандр Кішчанка. Ніці лёсу';
	@override String get excerpt => 'У музеі адбылося ўрачыстае адкрыццё выставы «Аляксандр Кішчанка. Ніці лёсу» (12+), прысвечанай творчасці выдатнага беларускага мастака, ураджэнца Багучарскага раёна Варонежскай вобласці. Выстава арганізавана ў гонар 300-годдзя Варонежскай губерні і стала часткай культурнага ўзаемадзеяння рэгіёна з Рэспублікай Беларусь.';
}

// Path: archiveFeed.items.boguchar2024
class _Translations$archiveFeed$items$boguchar2024$be extends Translations$archiveFeed$items$boguchar2024$ru {
	_Translations$archiveFeed$items$boguchar2024$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Экскурсія «Гісторыя жыцця А. М. Кішчанкі»';
	@override String get excerpt => 'Адным з самых таленавітых людзей Багучарскага краю быў Аляксандр Міхайлавіч Кішчанка — народны мастак Рэспублікі Беларусь і ганаровы грамадзянін Багучарскага раёна. Член Саюза мастакоў СССР і лаўрэат Дзяржаўнай прэміі, ён пакінуў яскравы след у гісторыі мастацтва.';
}

// Path: archiveFeed.items.belgazprombankKraskiPobedy
class _Translations$archiveFeed$items$belgazprombankKraskiPobedy$be extends Translations$archiveFeed$items$belgazprombankKraskiPobedy$ru {
	_Translations$archiveFeed$items$belgazprombankKraskiPobedy$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Белгазпрамбанк запрашае на выставу «Фарбы Вялікай Перамогі»';
	@override String get excerpt => '28 чэрвеня 2024 года. Напярэдадні 80-й гадавіны вызвалення Беларусі ад нямецка-фашысцкіх захопнікаў у фае галоўнага офіса Белгазпрамбанка ўрачыста адкрылася тэматычная выстава «Фарбы Вялікай Перамогі». Яна аб\'яднала работы беларускіх аўтараў, якія не з чутак ведалі жахі вайны, — А. Кішчанка, В. Пратасені, І. Стасевіча, М. Чураба, І. Рэя, П. Данэліі і іншых.';
}

// Path: archiveFeed.items.nebaZiamlja
class _Translations$archiveFeed$items$nebaZiamlja$be extends Translations$archiveFeed$items$nebaZiamlja$ru {
	_Translations$archiveFeed$items$nebaZiamlja$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Неба і зямля Аляксандра Кішчанкі';
	@override String get excerpt => '6 мая 2023 года ў Нацыянальным мастацкім музеі Рэспублікі Беларусь пачынае працаваць выстава «Неба і зямля Аляксандра Кішчанкі», прысвечаная маштабу яго мастацкага мыслення і значнасці спадчыны майстра.';
}

// Path: films.items.ispovedVremeni
class _Translations$films$items$ispovedVremeni$be extends Translations$films$items$ispovedVremeni$ru {
	_Translations$films$items$ispovedVremeni$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'А. Кішчанка. Споведзь Часу';
	@override String get excerpt => 'Дакументальны фільм пра Аляксандра Міхайлавіча Кішчанку (1933–1997) — народнага мастака Беларусі, аўтара самага вялікага габелена ў свеце. Рэжысёр В. Каралёў; здымка і мантаж — Я. Мілкоўскі.';
}

// Path: films.items.aleksandrKishchenko
class _Translations$films$items$aleksandrKishchenko$be extends Translations$films$items$aleksandrKishchenko$ru {
	_Translations$films$items$aleksandrKishchenko$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Аляксандр Кішчанка';
	@override String get excerpt => 'Тэлевізійны фільм пра жыццё і творчасць Аляксандра Кішчанкі: манументальныя роспісы Мінска, «Габелен стагоддзя» і філасофія ўніверсальнага рэалізму майстра.';
}

// Path: films.items.voronezhKramskoyExhibition
class _Translations$films$items$voronezhKramskoyExhibition$be extends Translations$films$items$voronezhKramskoyExhibition$ru {
	_Translations$films$items$voronezhKramskoyExhibition$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Выстава А. М. Кішчанкі ў Варонежскім мастацкім музеі імя І. М. Крамскога';
	@override String get excerpt => 'Сюжэт пра выставу работ вядомага беларускага мастака Аляксандра Кішчанкі ў Варонежскім абласным мастацкім музеі імя І. М. Крамскога.';
}

// Path: films.items.mastersOfSovietArt1988
class _Translations$films$items$mastersOfSovietArt1988$be extends Translations$films$items$mastersOfSovietArt1988$ru {
	_Translations$films$items$mastersOfSovietArt1988$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'А. Кішчанка. Серыя «Майстры савецкага мастацтва». Альбом 1988 г.';
	@override String get excerpt => 'Відэаагляд альбома 1988 года з серыі «Майстры савецкага мастацтва», прысвечанага жывапісу і манументальным працам Аляксандра Кішчанкі.';
}

// Path: films.items.bogucharLecture
class _Translations$films$items$bogucharLecture$be extends Translations$films$items$bogucharLecture$ru {
	_Translations$films$items$bogucharLecture$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Лекцыя «Зямляк са сусветным імем». А. М. Кішчанка. Багучарскі музей';
	@override String get excerpt => 'Лекцыя Багучарскага гісторыка-краязнаўчага музея пра Аляксандра Міхайлавіча Кішчанку — земляка са сусветным імем, родам з Багучарскага раёна.';
}

// Path: films.items.culturalCodesTapestries
class _Translations$films$items$culturalCodesTapestries$be extends Translations$films$items$culturalCodesTapestries$ru {
	_Translations$films$items$culturalCodesTapestries$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Культурныя коды нацыі: Дзе цяпер габелены народнага мастака Кішчанкі? Галоўны эфір';
	@override String get excerpt => 'Праграма «Галоўны эфір» у рубрыцы «Культурныя коды нацыі» расказвае, дзе сёння знаходзяцца габелены народнага мастака Беларусі Аляксандра Кішчанкі.';
}

// Path: films.items.tapestryOfCenturyMinsk
class _Translations$films$items$tapestryOfCenturyMinsk$be extends Translations$films$items$tapestryOfCenturyMinsk$ru {
	_Translations$films$items$tapestryOfCenturyMinsk$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Як у Мінску рыхтавалі да экспазіцыі «Габелен веку» ў Банку развіцця';
	@override String get excerpt => 'Рэпартаж пра тое, як у Мінску рыхтавалі да экспазіцыі работу беларускага мастака Аляксандра Кішчанкі «Габелен веку» ў Банку развіцця.';
}

// Path: films.items.chernobylTapestryFacts
class _Translations$films$items$chernobylTapestryFacts$be extends Translations$films$items$chernobylTapestryFacts$ru {
	_Translations$films$items$chernobylTapestryFacts$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Габелены «Веку» і «Чарнобыль». Цікавыя факты';
	@override String get excerpt => 'Відэаматэрыял пра знакамітыя габелены Аляксандра Кішчанкі — «Габелен веку» і «Чарнобыль»: гісторыя стварэння, сімволіка і цікавыя факты.';
}

// Path: films.items.kishchenkoReel1
class _Translations$films$items$kishchenkoReel1$be extends Translations$films$items$kishchenkoReel1$ru {
	_Translations$films$items$kishchenkoReel1$be._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'А. Кішчанка ў Instagram';
	@override String get excerpt => 'Кароткае відэа пра работы Аляксандра Кішчанкі з сацыяльнай сеткі.';
}

/// The flat map containing all translations for locale <be>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsBe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'КІШЧАНКА.АРТ',
			'app.brandTagline' => 'Калекцыя выяўленчага мастацтва',
			'app.logoMark' => 'КА',
			'navigation.aboutAuthor' => 'Пра аўтара',
			'navigation.news' => 'Навіны',
			'navigation.catalogOfWorks' => 'Каталог прац',
			'navigation.films' => 'Фільмы',
			'navigation.archive' => 'Архіў',
			'navigation.contacts' => 'Кантакты',
			'catalog.workPrefix' => 'Праца',
			'catalog.errorTitle' => 'Не атрымалася загрузіць карціны',
			'catalog.errorWithDetails' => ({required Object message}) => 'Не атрымалася загрузіць карціны. ${message}',
			'catalog.decade.all' => 'Усе',
			'catalog.decade.sixties' => '60-я',
			'catalog.decade.seventies' => '70-я',
			'catalog.decade.eighties' => '80-я',
			'catalog.decade.nineties' => '90-я',
			'catalog.paintingNames.id1958_1' => 'Ускраіна. Стары млын',
			'catalog.paintingNames.id1958_2' => 'Ангеліна',
			'catalog.paintingNames.id1958_3' => 'Туалет',
			'catalog.paintingNames.id1959_1' => 'Жаночы партрэт',
			'catalog.paintingNames.id1960_1' => 'Кампазіцыя №1',
			'catalog.paintingNames.id1960_2' => 'Жаночы партрэт у зялёных танах',
			'catalog.paintingNames.id1960_3' => 'Першы снег',
			'catalog.paintingNames.id1960_4' => 'Жанчына ў крэсле',
			'catalog.paintingNames.id1960_5' => 'Партрэт мастака Уладзіміра Урышчанкі',
			'catalog.paintingNames.id1960_6' => 'Дзяўчынка з бантам',
			'catalog.paintingNames.id1960_7' => 'Жаночы партрэт',
			'catalog.paintingNames.id1960_8' => 'Жаночы партрэт',
			'catalog.paintingNames.id1960_9' => 'Чаканне',
			'catalog.paintingNames.id1962_1' => 'Паўночніца (Жанчына з поўначы)',
			'catalog.paintingNames.id1965_1' => 'Жаночы партрэт',
			'catalog.paintingNames.id1965_2' => 'Цыркавы хлопец',
			'catalog.paintingNames.id1965_3' => 'Спакуса',
			'catalog.paintingNames.id1967_1' => 'Зоя Літвінава',
			'catalog.paintingNames.id1967_2' => 'Два жыцці',
			'catalog.paintingNames.id1968_1' => 'Нацюрморт з грушамі',
			'catalog.paintingNames.id1969_1' => 'Анёл',
			'catalog.paintingNames.id1970_1' => 'Настаўніца',
			'catalog.paintingNames.id1970_2' => 'Апошні севастапалец',
			'catalog.paintingNames.id1972_1' => 'Партрэт Жэні Мусінскай',
			'catalog.paintingNames.id1974_1' => 'Дзяўчына ў рускім касцюме',
			'catalog.paintingNames.id1975_1' => 'Першынец',
			'catalog.paintingNames.id1976_1' => 'Дзяўчына ў чырвоным з залатым (Зялёны вінаград)',
			'catalog.paintingNames.id1979_1' => 'Маці з дзіцём',
			'catalog.paintingNames.id1979_2' => 'Наташа',
			'catalog.paintingNames.id1979_3' => 'Забойства сям\'і Гомавых. Дзеянне 1943. Тамань.',
			'catalog.paintingNames.id1979_4' => 'Эскіз да работы "Боль паэта"',
			'catalog.paintingNames.id1979_5' => 'Радасць. Мацярынства',
			'catalog.paintingNames.id1980_1' => 'Фрагмент да карціны "Мёд"',
			'catalog.paintingNames.id1980_2' => 'Партрэт мамы',
			'catalog.paintingNames.id1980_3' => 'Ніна',
			'catalog.paintingNames.id1980_4' => 'Наташа Марчанка',
			'catalog.paintingNames.id1980_5' => 'Наташа',
			'catalog.paintingNames.id1981_1' => 'Роздум',
			'catalog.paintingNames.id1981_2' => 'Партрэт Алены Абразцовай',
			'catalog.paintingNames.id1982_1' => 'Аўтапартрэт',
			'catalog.paintingNames.id1982_2' => 'Адам і Ева',
			'catalog.paintingNames.id1982_3' => 'Зняважэнне храма',
			'catalog.paintingNames.id1982_4' => 'Мракабесы',
			'catalog.paintingNames.id1982_5' => 'Сланечнікі',
			'catalog.paintingNames.id1982_6' => 'Пейзаж',
			'catalog.paintingNames.id1983_1' => 'Мадонна',
			'catalog.paintingNames.id1983_2' => 'Змова (Клятва масонаў)',
			'catalog.paintingNames.id1983_3' => 'Ніна',
			'catalog.paintingNames.id1983_4' => 'Партрэт Марыі Бешу',
			'catalog.paintingNames.id1983_5' => 'Кліч мора',
			'catalog.paintingNames.id1983_6' => 'Плач',
			'catalog.paintingNames.id1983_7' => 'Наташа',
			'catalog.paintingNames.id1984_1' => 'Ніна',
			'catalog.paintingNames.id1984_2' => 'Ніна',
			'catalog.paintingNames.id1985_1' => 'Дзядзька Ваня',
			'catalog.paintingNames.id1985_2' => 'Дзяўчынка ў чырвоным капелюшы',
			'catalog.paintingNames.id1985_3' => 'Жаночы вобраз. Наташа Татарэнка',
			'catalog.paintingNames.id1985_4' => 'Мужчынскі партрэт',
			'catalog.paintingNames.id1985_5' => 'Летні душ',
			'catalog.paintingNames.id1986_1' => 'Партрэт дзяўчынкі',
			'catalog.paintingNames.id1986_2' => 'Партрэт кінааператара А. Абадоўскага',
			'catalog.paintingNames.id1986_3' => 'Апошнія дні верасня',
			'catalog.paintingNames.id1986_4' => 'Партрэт Бушчыка',
			'catalog.paintingNames.id1986_5' => 'Партрэт Наташы Марчанкі',
			'catalog.paintingNames.id1987_1' => 'Ён будзе жыць. Чарнобыль',
			'catalog.paintingNames.id1987_2' => 'Жаночы партрэт',
			'catalog.paintingNames.id1988_1' => 'Партрэт Машы',
			'catalog.paintingNames.id1988_2' => 'Мужчынская галава',
			'catalog.paintingNames.id1988_3' => 'Профіль',
			'catalog.paintingNames.id1988_4' => 'Ідучая',
			'catalog.paintingNames.id1989_1' => 'На беразе Дона',
			'catalog.paintingNames.id1989_2' => 'Раніца',
			'catalog.paintingNames.id1989_3' => 'Партрэт мастачкі Тамары Кіршчынай',
			'catalog.paintingNames.id1989_4' => 'Аголеная ў прасторы музыкі',
			'catalog.paintingNames.id1989_5' => 'Ідучая (Сусвет)',
			'catalog.paintingNames.id1989_6' => 'Ніна',
			'catalog.paintingNames.id1989_7' => 'Брат і сястра Ялькіны',
			'catalog.paintingNames.id1989_8' => 'Ніна',
			'catalog.paintingNames.id1989_9' => 'Аголеная',
			'catalog.paintingNames.id1990_1' => 'У прасторы (Аголеная)',
			'catalog.paintingNames.id1990_2' => 'Дары планет',
			'catalog.paintingNames.id1990_3' => 'Зоя',
			'catalog.paintingNames.id1990_4' => 'Мужчынскі партрэт',
			'catalog.paintingNames.id1990_5' => 'На балконе',
			'catalog.paintingNames.id1991_1' => 'Дзяўчынка з мёдам (Сусвет)',
			'catalog.paintingNames.id1991_2' => 'Мара',
			'catalog.paintingNames.id1991_3' => 'Вечная',
			'catalog.paintingNames.id1992_1' => 'Партрэт з марской ракавінай',
			'catalog.paintingNames.id1992_2' => 'Сатыр і Німфа',
			'catalog.paintingNames.id1992_3' => 'Хлопчык з пеўнем',
			'catalog.paintingNames.id1992_4' => 'Ніна і Максім',
			'catalog.paintingNames.id1992_5' => 'Рускі мужык',
			'catalog.paintingNames.id1992_6' => 'Партрэт Франца Коха',
			'catalog.paintingNames.id1992_7' => 'Ніна',
			'catalog.paintingNames.id1992_8' => 'Вольга',
			'catalog.paintingNames.id1992_9' => 'Не балуйся, Максім!',
			'catalog.paintingNames.id1992_10' => 'Гобелен "Сланечнікі"',
			'catalog.paintingNames.id1993_1' => 'Вечнае',
			'catalog.paintingNames.id1993_2' => 'Партрэт скульптара Лены Харабярюш',
			'catalog.paintingNames.id1993_3' => 'Аптэкар',
			'catalog.paintingNames.id1993_4' => 'Оля',
			'catalog.paintingNames.id1993_5' => 'Маці і дзіця',
			'catalog.paintingNames.id1993_6' => 'Хрыстос',
			'catalog.paintingNames.id1993_7' => 'Наташа',
			'catalog.paintingNames.id1993_8' => 'Партрэт невядомай',
			'catalog.paintingNames.id1993_9' => 'Раман',
			'catalog.paintingNames.id1994_1' => 'Пад сузор\'ем Льва',
			'catalog.paintingNames.id1994_2' => 'Партрэт Зоі',
			'catalog.paintingNames.id1994_3' => 'Закінуты двор',
			'catalog.paintingNames.id1994_4' => 'Наташа',
			'catalog.paintingNames.id1994_5' => 'Песня',
			'catalog.paintingNames.id1994_6' => 'Дзяўчынка з нацюрмортам з яблыкамі',
			'catalog.paintingNames.id1994_7' => 'Якая крычыць',
			'catalog.paintingNames.id1994_8' => 'Наташа',
			'catalog.paintingNames.id1994_9' => 'Вакханалія',
			'catalog.paintingNames.id1995_1' => 'Маленькі фантазёр',
			'catalog.paintingNames.id1995_2' => 'Мая Радзіма',
			'catalog.paintingNames.id1995_3' => 'Ню',
			'catalog.paintingNames.id1995_4' => 'Вольга Калтакова',
			'catalog.paintingNames.id1995_5' => 'Тамара Кіршчына зі спіны',
			'catalog.paintingNames.id1995_6' => 'Оля',
			'catalog.paintingNames.id1995_7' => 'Смутак',
			'catalog.paintingNames.id1995_8' => 'Партрэт дзяўчынкі',
			'catalog.paintingNames.id1995_9' => 'Сусвет',
			'catalog.paintingNames.id1995_10' => 'Лёша',
			'catalog.paintingNames.id1995_11' => 'Партрэт Растыкава',
			'catalog.paintingNames.id1995_12' => 'Мастацтвазнаўца Надзя',
			'catalog.paintingNames.id1995_13' => 'Мелодыя',
			'catalog.paintingNames.id1995_14' => 'Таня',
			'catalog.paintingNames.id1995_15' => 'Эскіз карціны «Партрэт Ніны»',
			'catalog.paintingNames.id1995_16' => 'Нацюрморт',
			'catalog.paintingNames.id1995_17' => 'Гобелен "Мора" ("Хваля")',
			'catalog.paintingNames.id1996_1' => 'Нацюрморт з яблыкамі',
			'catalog.paintingNames.id1996_2' => 'Аголеная',
			'catalog.paintingNames.id1996_3' => 'Максім з кавуном',
			'catalog.paintingNames.id1996_4' => 'Гімн (Захапленне)',
			'catalog.paintingNames.id1996_5' => 'Ніна',
			'catalog.paintingNames.id1996_6' => 'Іна',
			'catalog.paintingNames.id1996_7' => 'Алла Астаховіч',
			'catalog.paintingNames.id1996_8' => 'Лена',
			'catalog.paintingNames.id1996_9' => 'Жаночы партрэт (Ніна №1)',
			'catalog.paintingNames.id1996_10' => 'Сусвет',
			'catalog.paintingNames.id1996_11' => 'Якія плывуць у чоўне',
			'catalog.paintingNames.id1996_12' => 'Жаночы партрэт з хусткай',
			'catalog.paintingNames.id1996_13' => 'Мама',
			'catalog.paintingNames.id1996_14' => 'Філарэт Мінскі',
			'catalog.paintingNames.id1996_15' => 'Нацюрморт у прасторы',
			'catalog.paintingNames.id1996_16' => 'Партрэт Кучынскага',
			'catalog.paintingNames.id1996_17' => 'Жаночы партрэт',
			'catalog.paintingNames.id1996_18' => 'Мой Сусвет',
			'catalog.paintingNames.id1997_1' => 'Іван',
			'catalog.paintingNames.id1997_2' => 'Партрэт архітэктара Уладзіміра Салазкіна',
			'catalog.paintingNames.id1997_3' => 'Вайна светаў (апошняя работа)',
			'catalog.paintingNames.id1997_4' => 'Аўтапартрэт',
			'catalog.paintingNames.id1997_5' => 'Лета ў Багучары',
			'catalog.paintingNames.id1997_6' => 'Дзве ўдовы',
			'catalog.paintingNames.idunknown_1' => 'Паводка',
			'catalog.paintingNames.idunknown_2' => 'Жаночы партрэт',
			'catalog.paintingNames.idunknown_3' => 'Блакітныя калючкі',
			'catalog.paintingNames.idunknown_4' => 'Ніна',
			'catalog.paintingNames.idunknown_5' => 'Ніна',
			'catalog.paintingMediums.canvasOil' => 'Палатно, алей',
			'catalog.paintingMediums.hardboardOil' => 'ДВП, алей',
			'catalog.paintingMediums.cardboard' => 'Кардон',
			'catalog.paintingMediums.woolLinenWeaving' => 'Воўна, лён, ткацтва',
			'common.pageNotFound' => 'Старонка не знойдзена',
			'common.viewCatalog' => 'ПАГЛЯДЗЕЦЬ КАТАЛОГ',
			'common.learnMore' => 'ПАДРАБЯЗНЕЙ',
			'common.video.loadError' => 'Не атрымалася загрузіць відэа',
			'common.video.openExternally' => 'Адкрыць у знешнім плэеры',
			'tour.next' => 'Далей',
			'tour.gotIt' => 'Зразумела',
			'tour.back' => 'Назад',
			'tour.chernobylBody' => 'Габелен «Чарнобыль» (1991) перададзены ў дар ААН і сёння ўпрыгожвае яе штаб-кватэру ў Нью-Ёрку. Генеральны сакратар ААН параўнаў яго з «Гернікай» Пікаса.',
			'tour.originsTitle' => 'Ля вытокаў «Сусветнага рэалізму»',
			'tour.originsBody' => 'Аляксандр Міхайлавіч Кішчанка (1933–1997). Жывапісец. Філосаф. Манументаліст. Нарадзіўся ў хутары Белы Калодзеж (цяпер Багучарскі раён, Варонежская вобласць) і набыў сусветную вядомасць.',
			'tour.scaleTitle' => 'Маштаб габелена стагоддзя',
			'tour.scaleBody' => 'Палатно памерам 19 × 14 метраў (каля 300 кв. м), вагой больш за тону — памерам з пяціпавярховы будынак. Унесена ў Кнігу рэкордаў Гінеса.',
			'language.label' => 'Мова',
			'language.russian' => 'Рускі',
			'language.english' => 'Англійская',
			'language.spanish' => 'Іспанская',
			'language.french' => 'Французская',
			'language.german' => 'Нямецкая',
			'language.belarusian' => 'Беларуская',
			'archiveFeed.title' => 'Архіў публікацый',
			'archiveFeed.latestLabel' => 'Апошняя публікацыя',
			'archiveFeed.moreLabel' => 'Навіны і матэрыялы',
			'archiveFeed.openArticle' => 'Адкрыць артыкул',
			'archiveFeed.sourceLabel' => 'Крыніца',
			'archiveFeed.yearLabel' => ({required Object year}) => '${year} год',
			'archiveFeed.items.boguchar2026.title' => 'Экскурсія «Гісторыя жыцця М. А. Кішчанкі»',
			'archiveFeed.items.boguchar2026.excerpt' => '19 лютага 2026 года ў сценах Багучарскага музея адбылася экскурсія для вучняў школы вёскі Дзячанкава («Рух першых»), прысвечаная знаёмству з жыццём і творчасцю выдатнага мастака Аляксандра Міхайлавіча Кішчанкі.',
			'archiveFeed.items.priorbankChtobyChuvstvovat.title' => 'Выстава «Каб адчуваць» — калекцыя Прыёрбанка',
			'archiveFeed.items.priorbankChtobyChuvstvovat.excerpt' => 'Прыёрбанк упершыню паказвае публіцы сваю карпаратыўную калекцыю беларускага жывапісу 1960–2000-х гадоў, якая фарміравалася больш за 30 гадоў. На выставе «Каб адчуваць» у палацы Румянцавых і Паскевічаў з 10 красавіка па 7 чэрвеня прадстаўлены больш за 70 унікальных палотнаў, сярод якіх тры работы Аляксандра Кішчанкі.',
			'archiveFeed.items.nitiSudby.title' => 'Аляксандр Кішчанка. Ніці лёсу',
			'archiveFeed.items.nitiSudby.excerpt' => 'У музеі адбылося ўрачыстае адкрыццё выставы «Аляксандр Кішчанка. Ніці лёсу» (12+), прысвечанай творчасці выдатнага беларускага мастака, ураджэнца Багучарскага раёна Варонежскай вобласці. Выстава арганізавана ў гонар 300-годдзя Варонежскай губерні і стала часткай культурнага ўзаемадзеяння рэгіёна з Рэспублікай Беларусь.',
			'archiveFeed.items.boguchar2024.title' => 'Экскурсія «Гісторыя жыцця А. М. Кішчанкі»',
			'archiveFeed.items.boguchar2024.excerpt' => 'Адным з самых таленавітых людзей Багучарскага краю быў Аляксандр Міхайлавіч Кішчанка — народны мастак Рэспублікі Беларусь і ганаровы грамадзянін Багучарскага раёна. Член Саюза мастакоў СССР і лаўрэат Дзяржаўнай прэміі, ён пакінуў яскравы след у гісторыі мастацтва.',
			'archiveFeed.items.belgazprombankKraskiPobedy.title' => 'Белгазпрамбанк запрашае на выставу «Фарбы Вялікай Перамогі»',
			'archiveFeed.items.belgazprombankKraskiPobedy.excerpt' => '28 чэрвеня 2024 года. Напярэдадні 80-й гадавіны вызвалення Беларусі ад нямецка-фашысцкіх захопнікаў у фае галоўнага офіса Белгазпрамбанка ўрачыста адкрылася тэматычная выстава «Фарбы Вялікай Перамогі». Яна аб\'яднала работы беларускіх аўтараў, якія не з чутак ведалі жахі вайны, — А. Кішчанка, В. Пратасені, І. Стасевіча, М. Чураба, І. Рэя, П. Данэліі і іншых.',
			'archiveFeed.items.nebaZiamlja.title' => 'Неба і зямля Аляксандра Кішчанкі',
			'archiveFeed.items.nebaZiamlja.excerpt' => '6 мая 2023 года ў Нацыянальным мастацкім музеі Рэспублікі Беларусь пачынае працаваць выстава «Неба і зямля Аляксандра Кішчанкі», прысвечаная маштабу яго мастацкага мыслення і значнасці спадчыны майстра.',
			'films.title' => 'Фільмы і дакументальныя стужкі',
			'films.subtitle' => 'Відэаархіў пра А. Кішчанку',
			'films.latestLabel' => 'Галоўны фільм',
			'films.sourceLabel' => 'Крыніца',
			'films.instagramTitle' => 'Instagram',
			'films.instagramSubtitle' => 'Кароткія відэа і гісторыі',
			'films.watchOn.youtube' => 'Глядзець на YouTube',
			'films.watchOn.googleDrive' => 'Глядзець на Google Дыску',
			'films.watchOn.instagram' => 'Адкрыць у Instagram',
			'films.items.ispovedVremeni.title' => 'А. Кішчанка. Споведзь Часу',
			'films.items.ispovedVremeni.excerpt' => 'Дакументальны фільм пра Аляксандра Міхайлавіча Кішчанку (1933–1997) — народнага мастака Беларусі, аўтара самага вялікага габелена ў свеце. Рэжысёр В. Каралёў; здымка і мантаж — Я. Мілкоўскі.',
			'films.items.aleksandrKishchenko.title' => 'Аляксандр Кішчанка',
			'films.items.aleksandrKishchenko.excerpt' => 'Тэлевізійны фільм пра жыццё і творчасць Аляксандра Кішчанкі: манументальныя роспісы Мінска, «Габелен стагоддзя» і філасофія ўніверсальнага рэалізму майстра.',
			'films.items.voronezhKramskoyExhibition.title' => 'Выстава А. М. Кішчанкі ў Варонежскім мастацкім музеі імя І. М. Крамскога',
			'films.items.voronezhKramskoyExhibition.excerpt' => 'Сюжэт пра выставу работ вядомага беларускага мастака Аляксандра Кішчанкі ў Варонежскім абласным мастацкім музеі імя І. М. Крамскога.',
			'films.items.mastersOfSovietArt1988.title' => 'А. Кішчанка. Серыя «Майстры савецкага мастацтва». Альбом 1988 г.',
			'films.items.mastersOfSovietArt1988.excerpt' => 'Відэаагляд альбома 1988 года з серыі «Майстры савецкага мастацтва», прысвечанага жывапісу і манументальным працам Аляксандра Кішчанкі.',
			'films.items.bogucharLecture.title' => 'Лекцыя «Зямляк са сусветным імем». А. М. Кішчанка. Багучарскі музей',
			'films.items.bogucharLecture.excerpt' => 'Лекцыя Багучарскага гісторыка-краязнаўчага музея пра Аляксандра Міхайлавіча Кішчанку — земляка са сусветным імем, родам з Багучарскага раёна.',
			'films.items.culturalCodesTapestries.title' => 'Культурныя коды нацыі: Дзе цяпер габелены народнага мастака Кішчанкі? Галоўны эфір',
			'films.items.culturalCodesTapestries.excerpt' => 'Праграма «Галоўны эфір» у рубрыцы «Культурныя коды нацыі» расказвае, дзе сёння знаходзяцца габелены народнага мастака Беларусі Аляксандра Кішчанкі.',
			'films.items.tapestryOfCenturyMinsk.title' => 'Як у Мінску рыхтавалі да экспазіцыі «Габелен веку» ў Банку развіцця',
			'films.items.tapestryOfCenturyMinsk.excerpt' => 'Рэпартаж пра тое, як у Мінску рыхтавалі да экспазіцыі работу беларускага мастака Аляксандра Кішчанкі «Габелен веку» ў Банку развіцця.',
			'films.items.chernobylTapestryFacts.title' => 'Габелены «Веку» і «Чарнобыль». Цікавыя факты',
			'films.items.chernobylTapestryFacts.excerpt' => 'Відэаматэрыял пра знакамітыя габелены Аляксандра Кішчанкі — «Габелен веку» і «Чарнобыль»: гісторыя стварэння, сімволіка і цікавыя факты.',
			'films.items.kishchenkoReel1.title' => 'А. Кішчанка ў Instagram',
			'films.items.kishchenkoReel1.excerpt' => 'Кароткае відэа пра работы Аляксандра Кішчанкі з сацыяльнай сеткі.',
			'newsFeed.title' => 'Навіны',
			'newsFeed.subtitle' => 'Публікацыі, выставы і падзеі',
			'newsFeed.emptyState' => 'Навін пакуль няма. Зазірніце пазней.',
			'newsFeed.errorTitle' => 'Не ўдалося загрузіць навіны',
			'newsFeed.retry' => 'Паўтарыць',
			'newsFeed.back' => 'Да спісу навін',
			'newsFeed.sourceLabel' => 'Крыніца',
			'newsFeed.readTimeLabel' => 'Час чытання',
			'newsFeed.readTimeValue' => ({required Object minutes}) => '${minutes} хв',
			'newsFeed.viewsLabel' => 'Праглядаў',
			'newsFeed.publishedLabel' => 'Апублікавана',
			'bio.heroTitle' => 'МАСТАЦТВА КАСМІЧНАГА МАШТАБУ',
			'bio.heroSubtitle' => 'Мастацтва, якое сцірае межы паміж зямным і вечным. Народны мастак Рэспублікі Беларусь, стваральнік найбуйнейшага ў свеце «Гобелена стагоддзя»',
			'bio.heroBrandName' => 'Аляксандр Міхайлавіч Кішчанка',
			'bio.name' => 'Аляксандр Міхайлавіч Кішчанка (1933–1997)',
			'bio.tagline' => 'Жывапісец. Філосаф. Манументаліст. Заснавальнік «Сусветнага рэалізму».',
			'bio.intro' => 'Аляксандр Кішчанка — постаць рэнесансавага маштабу ў мастацтве XX стагоддзя. Чалавек, якому ўдалося ператварыць мяккую нітку гобелена ў магутнае архітэктурнае выказванне, а сцены гарадоў — у адкрытыя кнігі філасофскіх сэнсаў. Яго творчасць — гэта мост паміж архаікай і космасам, паміж болем зямлі і святлом далёкіх галактык.',
			'bio.feature.title' => 'СПАДЧЫНА СУСВЕТНАГА МАШТАБУ',
			'bio.feature.body' => 'У гэтай калекцыі сабраны творы выбітнага майстра, чыё мастацтва назаўсёды змяніла ўяўленне пра манументальны жывапіс і ткацтва. Ад грандыёзных мазаік, якія сталі візуальным кодам Мінска, да знакамітага «Гобелена стагоддзя» і палатна «Чарнобыль», што ўпрыгожвае штаб-кватэру ААН у Нью-Ёрку. Кожны твор Кішчанкі — гэта філасофскі трактат пра сувязь часоў, космас і нязломны чалавечы дух.',
			'bio.feature.cta' => 'ДАСЛЕДАВАЦЬ КАЛЕКЦЫЮ',
			'bio.feature.worksValue' => '500+',
			'bio.feature.worksLabel' => 'Твораў мастацтва па ўсім свеце',
			'bio.feature.panelsValue' => '6+',
			'bio.feature.panelsLabel' => 'Манументальныя пано ў Мінску',
			'bio.feature.guinnessValue' => '',
			'bio.feature.guinnessLabel' => 'Рэкорд Гінеса ў мастацтве',
			'bio.feature.unGiftValue' => '',
			'bio.feature.unGiftLabel' => 'Падарунак ААН ад Рэспублікі Беларусь',
			'bio.universalRealism.title' => 'Заснавальнік «Сусветнага рэалізму»',
			'bio.universalRealism.body' => 'Кішчанка не проста адлюстроўваў рэчаіснасць — ён ствараў новую сістэму каардынат, якую назваў Сусветным рэалізмам. Аснову яго метаду складае перакананне, што мастак — гэта «ткач часу», абавязаны злучаць мінулае і будучыню. Яго мастацтва выйшла за межы нацыянальных граніц, аперыруючы катэгорыямі глабальнай чалавечай драмы. Для Кішчанкі чалавек — гэта паўбог, чые ўчынкі рэзаніруюць у маштабах Сусвету. У яго работах цені становяцца самастойнымі формамі, а колер — «касмічнай музыкай», падначаленай строгаму вышэйшаму парадку.',
			'bio.tapestry.title' => '«Гобелен стагоддзя»: Вяршыня сусветнага ткацтва',
			'bio.tapestry.intro' => 'Аляксандр Кішчанка ўвайшоў у гісторыю як аўтар самага вялікага гобелена ў свеце, афіцыйна ўнесенага ў Кнігу рэкордаў Гінеса.',
			'bio.tapestry.scaleLabel' => 'Маштаб',
			'bio.tapestry.scale' => 'Палатно памерам 19 × 14 метраў (каля 300 кв. м), вагой больш за тону.',
			'bio.tapestry.conceptLabel' => 'Задума',
			'bio.tapestry.concept' => 'Грандыёзная тканіна гісторыі, дзе перапляліся лёсы 80 знакавых асоб (ад Хрыста і Мадонны да Чэрчыля, Кастра і Гарбачова).',
			'bio.tapestry.meaningLabel' => 'Сэнс',
			'bio.tapestry.meaning' => 'Гэтая работа-храм, у цэнтры якой разгортваецца вечны канфлікт паміж стварэннем і разбурэннем. Работа была прызнана нацыянальным скарбам Беларусі.',
			'bio.chernobyl.title' => '«Чарнобыль»: Голас нацыі ў сценах ААН',
			'bio.chernobyl.body' => 'Адным з самых эмацыйна моцных твораў майстра стаў гобелен «Чарнобыль» (1991). Адказаны ў дар Арганізацыі Аб\'яднаных Нацый, ён і сёння ўпрыгожвае штаб-кватэру ААН у Нью-Ёрку. Калі свет убачыў гэтае палатно, Генеральны сакратар ААН Перэс дэ Куэльяр параўнаў яго з «Гернікай» Пікаса. Для Кішчанкі гэты гобелен быў не проста памяццю аб трагедыі, а «вачыма Беларусі» — планетарным папярэджаннем аб далікатнасці жыцця, вытканым рукамі вялікіх беларускіх майстрых.',
			'bio.mosaic.title' => 'Твар горада: Мазаічныя пано «Усход»',
			'bio.mosaic.intro' => 'Кішчанка сфарміраваў візуальны код сучаснага Мінска. Яго знакамітыя мазаікі на жылых вышынях у мікрараёне Усход-1 сталі візітнай карткай сталіцы.',
			'bio.mosaic.panelsLabel' => 'Чатыры манументальных палатны',
			'bio.mosaic.panels' => '«Горад-воін», «Горад навукі», «Горад культуры» і «Горад-будаўнік».',
			'bio.mosaic.panelsMeaning' => 'Гэтыя работы ператварылі тыпавую забудову ў мастацкую прастору, дзе праз смальту і камень апяваецца трыумф чалавечага духу.',
			'bio.legacy.title' => 'Спадчына',
			'bio.legacy.body' => 'Аляксандр Кішчанка пакінуў пасля сябе не толькі палотны, якія захоўваюцца ў Траццякоўскай галерэі і прыватных калекцыях сусветных лідараў (Б. Клінтана, Ф. Мітэрана), але і цэлую школу беларускага манументальнага гобелена. Яго імя носіць Барысаўскі камбінат дэкаратыўна-прыкладнога мастацтва, дзе стваралісяя яго вялікія шпалеры.',
			'bio.quote' => 'Мастацтва — гэта боская з\'ява. Толькі яно можа спыніць час. Мастацтва здольнае разгадаць таямніцу будучыні, а таксама аднавіць страчанае мінулае.',
			'bio.quoteAuthor' => '— Аляксандр Кішчанка',
			'bio.wikipediaLinkLabel' => 'ЧЫТАЦЬ У ВІКІПЕДЫІ',
			'contacts.title' => 'Кантакты',
			'contacts.tagline' => 'Звяжыцеся са студыяй.',
			'contacts.phoneSectionLabel' => 'Тэлефон',
			'contacts.phoneSectionHint' => 'Званкі і WhatsApp',
			'contacts.instagramSectionLabel' => 'Instagram',
			'contacts.instagramHandle' => '@kishchenko.art',
			'contacts.vkSectionLabel' => 'УКантакце',
			'contacts.vkHandle' => 'aleksandrkishchenko',
			'contacts.vkScanQrHint' => 'Адсканіруйце QR, каб адкрыць старонку УКантакце',
			'contacts.studioSectionTitle' => 'Майстэрня аўтара',
			'contacts.studioAddress' => 'Мінск, вул. Сурганава, 44 — 7 паверх',
			'contacts.openInOsm' => 'АДКРЫЦЬ У OPENSTREETMAP',
			'contacts.mapAttribution' => '© OpenStreetMap contributors',
			'seo.aboutAuthor.title' => 'Аляксандр Кішчанка — народны мастак Беларусі | КІШЧАНКА.АРТ',
			'seo.aboutAuthor.description' => 'Аляксандр Міхайлавіч Кішчанка (1933–1997) — народны мастак Рэспублікі Беларусь, жывапісец і манументаліст. Аўтар самага вялікага габелена ў свеце і «Чарнобыля» ў штаб-кватэры ААН.',
			'seo.aboutAuthor.keywords' => 'Аляксандр Кішчанка, біяграфія, беларускі мастак, манументаліст, габелен',
			'seo.catalog.title' => 'Каталог прац Аляксандра Кішчанкі | КІШЧАНКА.АРТ',
			'seo.catalog.description' => 'Каталог жывапісу і габеленаў Аляксандра Кішчанкі: партрэты, пейзажы, філасофскія палотны 1958–1997 гадоў.',
			'seo.catalog.keywords' => 'каталог прац Кішчанкі, жывапіс, габелены, купіць карціну Кішчанкі',
			'seo.news.title' => 'Навіны і выставы | КІШЧАНКА.АРТ',
			'seo.news.description' => 'Навіны, выставы і падзеі, звязаныя са спадчынай Аляксандра Кішчанкі і галерэяй КІШЧАНКА.АРТ.',
			'seo.news.keywords' => 'выставы Кішчанкі, навіны галерэі, падзеі',
			'seo.films.title' => 'Дакументальныя фільмы пра А. Кішчанку | КІШЧАНКА.АРТ',
			'seo.films.description' => 'Дакументальныя фільмы і відэаматэрыялы пра Аляксандра Кішчанку, яго творчасць і манументальныя творы.',
			'seo.films.keywords' => 'фільм пра Кішчанку, дакументальны фільм, габелен стагоддзя, відэа',
			'seo.archive.title' => 'Архіў публікацый | КІШЧАНКА.АРТ',
			'seo.archive.description' => 'Архіў публікацый і матэрыялаў пра творчасць і выставы Аляксандра Міхайлавіча Кішчанкі.',
			'seo.archive.keywords' => 'архіў Кішчанкі, публікацыі, артыкулы, прэса',
			'seo.contacts.title' => 'Кантакты | КІШЧАНКА.АРТ',
			'seo.contacts.description' => 'Кантакты галерэі КІШЧАНКА.АРТ: майстэрня ў Мінску, тэлефон, Instagram і УКантакце.',
			'seo.contacts.keywords' => 'кантакты галерэі Кішчанкі, майстэрня Мінск, купіць карціну',
			_ => null,
		};
	}
}
