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
	@override late final _TranslationsAppBe app = _TranslationsAppBe._(_root);
	@override late final _TranslationsNavigationBe navigation = _TranslationsNavigationBe._(_root);
	@override late final _TranslationsCatalogBe catalog = _TranslationsCatalogBe._(_root);
	@override late final _TranslationsCommonBe common = _TranslationsCommonBe._(_root);
	@override late final _TranslationsLanguageBe language = _TranslationsLanguageBe._(_root);
	@override late final _TranslationsBioBe bio = _TranslationsBioBe._(_root);
}

// Path: app
class _TranslationsAppBe extends TranslationsAppRu {
	_TranslationsAppBe._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'КІШЧАНКА.АРТ';
}

// Path: navigation
class _TranslationsNavigationBe extends TranslationsNavigationRu {
	_TranslationsNavigationBe._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get aboutAuthor => 'Пра аўтара';
	@override String get news => 'Навіны';
	@override String get catalogOfWorks => 'Каталог прац';
	@override String get archive => 'Архіў';
	@override String get contacts => 'Кантакты';
}

// Path: catalog
class _TranslationsCatalogBe extends TranslationsCatalogRu {
	_TranslationsCatalogBe._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get workPrefix => 'Праца';
	@override late final _TranslationsCatalogPaintingNamesBe paintingNames = _TranslationsCatalogPaintingNamesBe._(_root);
}

// Path: common
class _TranslationsCommonBe extends TranslationsCommonRu {
	_TranslationsCommonBe._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get pageNotFound => 'Старонка не знойдзена';
	@override String get viewCatalog => 'ПАГЛЯДЗЕЦЬ КАТАЛОГ';
	@override String get learnMore => 'ПАДРАБЯЗНЕЙ';
}

// Path: language
class _TranslationsLanguageBe extends TranslationsLanguageRu {
	_TranslationsLanguageBe._(TranslationsBe root) : this._root = root, super.internal(root);

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

// Path: bio
class _TranslationsBioBe extends TranslationsBioRu {
	_TranslationsBioBe._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get heroTitle => 'МАСТАЦТВА КАСМІЧНАГА МАШТАБУ';
	@override String get heroSubtitle => 'Мастацтва, якое сцірае межы паміж зямным і вечным. Народны мастак Рэспублікі Беларусь, стваральнік найбуйнейшага ў свеце «Гобелена стагоддзя»';
	@override String get name => 'Аляксандр Міхайлавіч Кішчанка (1933–1997)';
	@override String get tagline => 'Жывапісец. Філосаф. Манументаліст. Заснавальнік «Сусветнага рэалізму».';
	@override String get intro => 'Аляксандр Кішчанка — постаць рэнесансавага маштабу ў мастацтве XX стагоддзя. Чалавек, якому ўдалося ператварыць мяккую нітку гобелена ў магутнае архітэктурнае выказванне, а сцены гарадоў — у адкрытыя кнігі філасофскіх сэнсаў. Яго творчасць — гэта мост паміж архаікай і космасам, паміж болем зямлі і святлом далёкіх галактык.';
	@override late final _TranslationsBioFeatureBe feature = _TranslationsBioFeatureBe._(_root);
	@override late final _TranslationsBioUniversalRealismBe universalRealism = _TranslationsBioUniversalRealismBe._(_root);
	@override late final _TranslationsBioTapestryBe tapestry = _TranslationsBioTapestryBe._(_root);
	@override late final _TranslationsBioChernobylBe chernobyl = _TranslationsBioChernobylBe._(_root);
	@override late final _TranslationsBioMosaicBe mosaic = _TranslationsBioMosaicBe._(_root);
	@override late final _TranslationsBioLegacyBe legacy = _TranslationsBioLegacyBe._(_root);
	@override String get quote => 'Мастацтва — гэта боская з\'ява. Толькі яно можа спыніць час. Мастацтва здольнае разгадаць таямніцу будучыні, а таксама аднавіць страчанае мінулае.';
	@override String get quoteAuthor => '— Аляксандр Кішчанка';
}

// Path: catalog.paintingNames
class _TranslationsCatalogPaintingNamesBe extends TranslationsCatalogPaintingNamesRu {
	_TranslationsCatalogPaintingNamesBe._(TranslationsBe root) : this._root = root, super.internal(root);

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

// Path: bio.feature
class _TranslationsBioFeatureBe extends TranslationsBioFeatureRu {
	_TranslationsBioFeatureBe._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'СПАДЧЫНА СУСВЕТНАГА МАШТАБУ';
	@override String get body => 'У гэтай калекцыі сабраны творы выбітнага майстра, чыё мастацтва назаўсёды змяніла ўяўленне пра манументальны жывапіс і ткацтва. Ад грандыёзных мазаік, якія сталі візуальным кодам Мінска, да знакамітага «Гобелена стагоддзя» і палатна «Чарнобыль», што ўпрыгожвае штаб-кватэру ААН у Нью-Ёрку. Кожны твор Кішчанкі — гэта філасофскі трактат пра сувязь часоў, космас і нязломны чалавечы дух.';
	@override String get cta => 'ДАСЛЕДАВАЦЬ КАЛЕКЦЫЮ';
	@override String get worksValue => '200+';
	@override String get worksLabel => 'Твораў мастацтва';
	@override String get panelsValue => '6+';
	@override String get panelsLabel => 'Манументальныя пано ў Мінску';
	@override String get guinnessValue => '1';
	@override String get guinnessLabel => 'Рэкорд Гінеса ў мастацтве';
}

// Path: bio.universalRealism
class _TranslationsBioUniversalRealismBe extends TranslationsBioUniversalRealismRu {
	_TranslationsBioUniversalRealismBe._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Заснавальнік «Сусветнага рэалізму»';
	@override String get body => 'Кішчанка не проста адлюстроўваў рэчаіснасць — ён ствараў новую сістэму каардынат, якую назваў Сусветным рэалізмам. Аснову яго метаду складае перакананне, што мастак — гэта «ткач часу», абавязаны злучаць мінулае і будучыню. Яго мастацтва выйшла за межы нацыянальных граніц, аперыруючы катэгорыямі глабальнай чалавечай драмы. Для Кішчанкі чалавек — гэта паўбог, чые ўчынкі рэзаніруюць у маштабах Сусвету. У яго работах цені становяцца самастойнымі формамі, а колер — «касмічнай музыкай», падначаленай строгаму вышэйшаму парадку.';
}

// Path: bio.tapestry
class _TranslationsBioTapestryBe extends TranslationsBioTapestryRu {
	_TranslationsBioTapestryBe._(TranslationsBe root) : this._root = root, super.internal(root);

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
class _TranslationsBioChernobylBe extends TranslationsBioChernobylRu {
	_TranslationsBioChernobylBe._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => '«Чарнобыль»: Голас нацыі ў сценах ААН';
	@override String get body => 'Адным з самых эмацыйна моцных твораў майстра стаў гобелен «Чарнобыль» (1991). Адказаны ў дар Арганізацыі Аб\'яднаных Нацый, ён і сёння ўпрыгожвае штаб-кватэру ААН у Нью-Ёрку. Калі свет убачыў гэтае палатно, Генеральны сакратар ААН Перэс дэ Куэльяр параўнаў яго з «Гернікай» Пікаса. Для Кішчанкі гэты гобелен быў не проста памяццю аб трагедыі, а «вачыма Беларусі» — планетарным папярэджаннем аб далікатнасці жыцця, вытканым рукамі вялікіх беларускіх майстрых.';
}

// Path: bio.mosaic
class _TranslationsBioMosaicBe extends TranslationsBioMosaicRu {
	_TranslationsBioMosaicBe._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Твар горада: Мазаічныя пано «Усход»';
	@override String get intro => 'Кішчанка сфарміраваў візуальны код сучаснага Мінска. Яго знакамітыя мазаікі на жылых вышынях у мікрараёне Усход-1 сталі візітнай карткай сталіцы.';
	@override String get panelsLabel => 'Чатыры манументальных палатны';
	@override String get panels => '«Горад-воін», «Горад навукі», «Горад культуры» і «Горад-будаўнік».';
	@override String get panelsMeaning => 'Гэтыя работы ператварылі тыпавую забудову ў мастацкую прастору, дзе праз смальту і камень апяваецца трыумф чалавечага духу.';
}

// Path: bio.legacy
class _TranslationsBioLegacyBe extends TranslationsBioLegacyRu {
	_TranslationsBioLegacyBe._(TranslationsBe root) : this._root = root, super.internal(root);

	final TranslationsBe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Спадчына';
	@override String get body => 'Аляксандр Кішчанка пакінуў пасля сябе не толькі палотны, якія захоўваюцца ў Траццякоўскай галерэі і прыватных калекцыях сусветных лідараў (Б. Клінтана, Ф. Мітэрана), але і цэлую школу беларускага манументальнага гобелена. Яго імя носіць Барысаўскі камбінат дэкаратыўна-прыкладнога мастацтва, дзе стваралісяя яго вялікія шпалеры.';
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
			'navigation.aboutAuthor' => 'Пра аўтара',
			'navigation.news' => 'Навіны',
			'navigation.catalogOfWorks' => 'Каталог прац',
			'navigation.archive' => 'Архіў',
			'navigation.contacts' => 'Кантакты',
			'catalog.workPrefix' => 'Праца',
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
			'common.pageNotFound' => 'Старонка не знойдзена',
			'common.viewCatalog' => 'ПАГЛЯДЗЕЦЬ КАТАЛОГ',
			'common.learnMore' => 'ПАДРАБЯЗНЕЙ',
			'language.label' => 'Мова',
			'language.russian' => 'Рускі',
			'language.english' => 'Англійская',
			'language.spanish' => 'Іспанская',
			'language.french' => 'Французская',
			'language.german' => 'Нямецкая',
			'language.belarusian' => 'Беларуская',
			'bio.heroTitle' => 'МАСТАЦТВА КАСМІЧНАГА МАШТАБУ',
			'bio.heroSubtitle' => 'Мастацтва, якое сцірае межы паміж зямным і вечным. Народны мастак Рэспублікі Беларусь, стваральнік найбуйнейшага ў свеце «Гобелена стагоддзя»',
			'bio.name' => 'Аляксандр Міхайлавіч Кішчанка (1933–1997)',
			'bio.tagline' => 'Жывапісец. Філосаф. Манументаліст. Заснавальнік «Сусветнага рэалізму».',
			'bio.intro' => 'Аляксандр Кішчанка — постаць рэнесансавага маштабу ў мастацтве XX стагоддзя. Чалавек, якому ўдалося ператварыць мяккую нітку гобелена ў магутнае архітэктурнае выказванне, а сцены гарадоў — у адкрытыя кнігі філасофскіх сэнсаў. Яго творчасць — гэта мост паміж архаікай і космасам, паміж болем зямлі і святлом далёкіх галактык.',
			'bio.feature.title' => 'СПАДЧЫНА СУСВЕТНАГА МАШТАБУ',
			'bio.feature.body' => 'У гэтай калекцыі сабраны творы выбітнага майстра, чыё мастацтва назаўсёды змяніла ўяўленне пра манументальны жывапіс і ткацтва. Ад грандыёзных мазаік, якія сталі візуальным кодам Мінска, да знакамітага «Гобелена стагоддзя» і палатна «Чарнобыль», што ўпрыгожвае штаб-кватэру ААН у Нью-Ёрку. Кожны твор Кішчанкі — гэта філасофскі трактат пра сувязь часоў, космас і нязломны чалавечы дух.',
			'bio.feature.cta' => 'ДАСЛЕДАВАЦЬ КАЛЕКЦЫЮ',
			'bio.feature.worksValue' => '200+',
			'bio.feature.worksLabel' => 'Твораў мастацтва',
			'bio.feature.panelsValue' => '6+',
			'bio.feature.panelsLabel' => 'Манументальныя пано ў Мінску',
			'bio.feature.guinnessValue' => '1',
			'bio.feature.guinnessLabel' => 'Рэкорд Гінеса ў мастацтве',
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
			_ => null,
		};
	}
}
