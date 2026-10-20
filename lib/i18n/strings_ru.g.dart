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
class TranslationsRu with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$ru app = _Translations$app$ru._(_root);
	@override late final _Translations$navigation$ru navigation = _Translations$navigation$ru._(_root);
	@override late final _Translations$catalog$ru catalog = _Translations$catalog$ru._(_root);
	@override late final _Translations$common$ru common = _Translations$common$ru._(_root);
	@override late final _Translations$tour$ru tour = _Translations$tour$ru._(_root);
	@override late final _Translations$language$ru language = _Translations$language$ru._(_root);
	@override late final _Translations$archiveFeed$ru archiveFeed = _Translations$archiveFeed$ru._(_root);
	@override late final _Translations$films$ru films = _Translations$films$ru._(_root);
	@override late final _Translations$newsFeed$ru newsFeed = _Translations$newsFeed$ru._(_root);
	@override late final _Translations$bio$ru bio = _Translations$bio$ru._(_root);
	@override late final _Translations$contacts$ru contacts = _Translations$contacts$ru._(_root);
	@override late final _Translations$seo$ru seo = _Translations$seo$ru._(_root);
}

// Path: app
class _Translations$app$ru implements Translations$app$en {
	_Translations$app$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'КИЩЕНКО-АРТ';
	@override String get brandTagline => 'Коллекция изобразительного искусства';
	@override String get logoMark => 'КА';
}

// Path: navigation
class _Translations$navigation$ru implements Translations$navigation$en {
	_Translations$navigation$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get aboutAuthor => 'Об авторе';
	@override String get news => 'Новости';
	@override String get catalogOfWorks => 'Каталог работ';
	@override String get films => 'Фильмы';
	@override String get archive => 'Архив';
	@override String get contacts => 'Контакты';
}

// Path: catalog
class _Translations$catalog$ru implements Translations$catalog$en {
	_Translations$catalog$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get workPrefix => 'Работа';
	@override String get errorTitle => 'Не удалось загрузить картины';
	@override String errorWithDetails({required Object message}) => 'Не удалось загрузить картины. ${message}';
	@override late final _Translations$catalog$decade$ru decade = _Translations$catalog$decade$ru._(_root);
	@override late final _Translations$catalog$paintingNames$ru paintingNames = _Translations$catalog$paintingNames$ru._(_root);
	@override late final _Translations$catalog$paintingMediums$ru paintingMediums = _Translations$catalog$paintingMediums$ru._(_root);
}

// Path: common
class _Translations$common$ru implements Translations$common$en {
	_Translations$common$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get pageNotFound => 'Страница не найдена';
	@override String get retry => 'Повторить';
	@override String get errorTitle => 'Что-то пошло не так';
	@override String get viewCatalog => 'СМОТРЕТЬ КАТАЛОГ';
	@override String get learnMore => 'ПОДРОБНЕЕ';
	@override late final _Translations$common$video$ru video = _Translations$common$video$ru._(_root);
}

// Path: tour
class _Translations$tour$ru implements Translations$tour$en {
	_Translations$tour$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get next => 'Далее';
	@override String get gotIt => 'Понятно';
	@override String get back => 'Назад';
	@override String get chernobylBody => 'Также Кищенко А. М. является автором гобелена «Чернобыль» (1991), который был передан в дар ООН и сегодня украшает её штаб-квартиру в Нью-Йорке. Генеральный секретарь ООН сравнил его с «Герникой» Пикассо.';
	@override String get originsTitle => 'У истоков «Вселенского реализма»';
	@override String get originsBody => 'Александр Михайлович Кищенко (1933–1997). Живописец. Философ. Монументалист. Родился в хуторе Белый Колодезь (ныне Богучарский район, Воронежская область) и обрёл мировую известность как автор самого большого в мире «Гобелена века».';
	@override String get scaleTitle => 'Масштаб гобелена века';
	@override String get scaleBody => '«Гобелен века» — это полотно, выполненное в технике ручного ткачества, размером 19 × 14 метров (эквивалентно пятиэтажному зданию), весом более тонны. Внесён в Книгу рекордов Гиннесса в 1999 году как самый большой в мире гобелен.';
}

// Path: language
class _Translations$language$ru implements Translations$language$en {
	_Translations$language$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Язык';
	@override String get russian => 'Русский';
	@override String get english => 'English';
	@override String get spanish => 'Español';
	@override String get french => 'Français';
	@override String get german => 'Deutsch';
	@override String get belarusian => 'Белорусский';
}

// Path: archiveFeed
class _Translations$archiveFeed$ru implements Translations$archiveFeed$en {
	_Translations$archiveFeed$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Архив публикаций';
	@override String get latestLabel => 'Последняя публикация';
	@override String get moreLabel => 'Материалы и новости';
	@override String get openArticle => 'Открыть статью';
	@override String get sourceLabel => 'Источник';
	@override String yearLabel({required Object year}) => '${year} год';
	@override late final _Translations$archiveFeed$items$ru items = _Translations$archiveFeed$items$ru._(_root);
}

// Path: films
class _Translations$films$ru implements Translations$films$en {
	_Translations$films$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Фильмы и документальные ленты';
	@override String get subtitle => 'Видеоархив об А. Кищенко';
	@override String get latestLabel => 'Главный фильм';
	@override String get sourceLabel => 'Источник';
	@override String get instagramTitle => 'Instagram';
	@override String get instagramSubtitle => 'Короткие видео и истории';
	@override late final _Translations$films$watchOn$ru watchOn = _Translations$films$watchOn$ru._(_root);
	@override late final _Translations$films$items$ru items = _Translations$films$items$ru._(_root);
}

// Path: newsFeed
class _Translations$newsFeed$ru implements Translations$newsFeed$en {
	_Translations$newsFeed$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Новости';
	@override String get subtitle => 'Публикации, выставки и события';
	@override String get emptyState => 'Новостей пока нет. Загляните позже.';
	@override String get errorTitle => 'Не удалось загрузить новости';
	@override String get retry => 'Повторить';
	@override String get back => 'К списку новостей';
	@override String get sourceLabel => 'Источник';
	@override String get readTimeLabel => 'На чтение';
	@override String readTimeValue({required Object minutes}) => '${minutes} мин';
	@override String get viewsLabel => 'Просмотров';
	@override String get publishedLabel => 'Опубликовано';
}

// Path: bio
class _Translations$bio$ru implements Translations$bio$en {
	_Translations$bio$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get heroTitle => 'ИСКУССТВО КОСМИЧЕСКОГО МАСШТАБА';
	@override String get heroSubtitle => 'Искусство, стирающее границы между земным и вечным. Народный художник Республики Беларусь, создатель самого большого в мире «Гобелена века»';
	@override String get heroBrandName => 'Александр Михайлович Кищенко';
	@override String get name => 'Александр Михайлович Кищенко (1933–1997)';
	@override String get tagline => 'Живописец. Философ. Монументалист. Родоначальник «Вселенского реализма».';
	@override String get intro => 'Александр Кищенко — фигура ренессансного масштаба в искусстве XX века. Человек, сумевший превратить мягкую нить гобелена в мощное архитектурное высказывание, а стены городов — в открытые книги философских смыслов. Его творчество — это мост между архаикой и космосом, между болью земли и светом далеких галактик.';
	@override late final _Translations$bio$feature$ru feature = _Translations$bio$feature$ru._(_root);
	@override late final _Translations$bio$universalRealism$ru universalRealism = _Translations$bio$universalRealism$ru._(_root);
	@override late final _Translations$bio$tapestry$ru tapestry = _Translations$bio$tapestry$ru._(_root);
	@override late final _Translations$bio$chernobyl$ru chernobyl = _Translations$bio$chernobyl$ru._(_root);
	@override late final _Translations$bio$mosaic$ru mosaic = _Translations$bio$mosaic$ru._(_root);
	@override late final _Translations$bio$legacy$ru legacy = _Translations$bio$legacy$ru._(_root);
	@override String get quote => 'Искусство – это божественное явление. Только ему дано остановить время. Искусство может разгадать Тайну будущего, А также восстановить Потерянное прошлое.';
	@override String get quoteAuthor => '— Александр Кищенко';
	@override String get wikipediaLinkLabel => 'ЧИТАТЬ В ВИКИПЕДИИ';
}

// Path: contacts
class _Translations$contacts$ru implements Translations$contacts$en {
	_Translations$contacts$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Контакты';
	@override String get tagline => 'Свяжитесь со студией.';
	@override String get phoneSectionLabel => 'Телефон';
	@override String get phoneSectionHint => 'Звонки и WhatsApp';
	@override String get instagramSectionLabel => 'Instagram';
	@override String get instagramHandle => '@kishchenko.art';
	@override String get vkSectionLabel => 'ВКонтакте';
	@override String get vkHandle => 'aleksandrkishchenko';
	@override String get vkScanQrHint => 'Отсканируйте QR, чтобы открыть страницу ВКонтакте';
	@override String get studioSectionTitle => 'Мастерская автора';
	@override String get studioAddress => 'Минск, ул. Сурганова, 44 — 7 этаж';
	@override String get openInOsm => 'ОТКРЫТЬ В OPENSTREETMAP';
	@override String get mapAttribution => '© OpenStreetMap contributors';
}

// Path: seo
class _Translations$seo$ru implements Translations$seo$en {
	_Translations$seo$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$seo$aboutAuthor$ru aboutAuthor = _Translations$seo$aboutAuthor$ru._(_root);
	@override late final _Translations$seo$catalog$ru catalog = _Translations$seo$catalog$ru._(_root);
	@override late final _Translations$seo$news$ru news = _Translations$seo$news$ru._(_root);
	@override late final _Translations$seo$films$ru films = _Translations$seo$films$ru._(_root);
	@override late final _Translations$seo$archive$ru archive = _Translations$seo$archive$ru._(_root);
	@override late final _Translations$seo$contacts$ru contacts = _Translations$seo$contacts$ru._(_root);
}

// Path: catalog.decade
class _Translations$catalog$decade$ru implements Translations$catalog$decade$en {
	_Translations$catalog$decade$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get all => 'Все';
	@override String get sixties => '60-е';
	@override String get seventies => '70-е';
	@override String get eighties => '80-е';
	@override String get nineties => '90-е';
}

// Path: catalog.paintingNames
class _Translations$catalog$paintingNames$ru implements Translations$catalog$paintingNames$en {
	_Translations$catalog$paintingNames$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get id1958_1 => 'Окраина. Старая мельница';
	@override String get id1958_2 => 'Ангелина';
	@override String get id1958_3 => 'Туалет';
	@override String get id1959_1 => 'Женский портрет';
	@override String get id1960_1 => 'Композиция №1';
	@override String get id1960_2 => 'Женский портрет в зеленой гамме';
	@override String get id1960_3 => 'Первый снег';
	@override String get id1960_4 => 'Женщина в кресле';
	@override String get id1960_5 => 'Портрет художника Владимира Урищенко';
	@override String get id1960_6 => 'Девочка с бантом';
	@override String get id1960_7 => 'Женский портрет';
	@override String get id1960_8 => 'Женский портрет';
	@override String get id1960_9 => 'Ожидание';
	@override String get id1962_1 => 'Северянка (Женщина с севера)';
	@override String get id1965_1 => 'Женский портрет';
	@override String get id1965_2 => 'Цирковой мальчик';
	@override String get id1965_3 => 'Искушение';
	@override String get id1967_1 => 'Зоя Литвинова';
	@override String get id1967_2 => 'Две жизни';
	@override String get id1968_1 => 'Натюрморт с грушами';
	@override String get id1969_1 => 'Ангел';
	@override String get id1970_1 => 'Учительница';
	@override String get id1970_2 => 'Последний севастополец';
	@override String get id1972_1 => 'Портрет Жени Мусинской';
	@override String get id1974_1 => 'Девушка в русском костюме';
	@override String get id1975_1 => 'Первенец';
	@override String get id1976_1 => 'Девушка в красном с золотом (Зеленый виноград)';
	@override String get id1979_1 => 'Мать с ребенком';
	@override String get id1979_2 => 'Наташа';
	@override String get id1979_3 => 'Убийство семьи Громовых. Действие 1943. Тамань.';
	@override String get id1979_4 => 'Эскиз к работе "Боль поэта"';
	@override String get id1979_5 => 'Радость. Материнство';
	@override String get id1980_1 => 'Фрагмент к картине "Мед"';
	@override String get id1980_2 => 'Портрет мамы';
	@override String get id1980_3 => 'Нина';
	@override String get id1980_4 => 'Наташа Марченко';
	@override String get id1980_5 => 'Наташа';
	@override String get id1981_1 => 'Раздумье';
	@override String get id1981_2 => 'Портрет Елены Образцовой';
	@override String get id1982_1 => 'Автопортрет';
	@override String get id1982_2 => 'Адам и Ева';
	@override String get id1982_3 => 'Осквернение храма';
	@override String get id1982_4 => 'Мракобесы';
	@override String get id1982_5 => 'Подсолнухи';
	@override String get id1982_6 => 'Пейзаж';
	@override String get id1983_1 => 'Мадонна';
	@override String get id1983_2 => 'Заговор (Клятва масонов)';
	@override String get id1983_3 => 'Нина';
	@override String get id1983_4 => 'Портрет Марии Биешу';
	@override String get id1983_5 => 'Зов моря';
	@override String get id1983_6 => 'Плач';
	@override String get id1983_7 => 'Наташа';
	@override String get id1984_1 => 'Нина';
	@override String get id1984_2 => 'Нина';
	@override String get id1985_1 => 'Дядя Ваня';
	@override String get id1985_2 => 'Девочка в красной шляпе';
	@override String get id1985_3 => 'Женский образ. Наташа Татаренко';
	@override String get id1985_4 => 'Мужской портрет';
	@override String get id1985_5 => 'Летний душ';
	@override String get id1986_1 => 'Портрет девочки';
	@override String get id1986_2 => 'Портрет кинооператора А. Абадовского';
	@override String get id1986_3 => 'Последние дни сентября';
	@override String get id1986_4 => 'Портрет Бущика';
	@override String get id1986_5 => 'Портрет Наташи Марченко';
	@override String get id1987_1 => 'Он будет жить. Чернобыль';
	@override String get id1987_2 => 'Женский портрет';
	@override String get id1988_1 => 'Портрет Маши';
	@override String get id1988_2 => 'Мужская голова';
	@override String get id1988_3 => 'Профиль';
	@override String get id1988_4 => 'Идущая';
	@override String get id1989_1 => 'На берегу Дона';
	@override String get id1989_2 => 'Утро';
	@override String get id1989_3 => 'Портрет художницы Тамары Кирщиной';
	@override String get id1989_4 => 'Обнаженная в пространстве музыка';
	@override String get id1989_5 => 'Идущая (Вселенная)';
	@override String get id1989_6 => 'Нина';
	@override String get id1989_7 => 'Брат и сестра Елькины';
	@override String get id1989_8 => 'Нина';
	@override String get id1989_9 => 'Обнаженная';
	@override String get id1990_1 => 'В пространстве (Обнаженная)';
	@override String get id1990_2 => 'Дары планет';
	@override String get id1990_3 => 'Зоя';
	@override String get id1990_4 => 'Мужской портрет';
	@override String get id1990_5 => 'На балконе';
	@override String get id1991_1 => 'Девочка с медом (Вселенная)';
	@override String get id1991_2 => 'Мечта';
	@override String get id1991_3 => 'Вечная';
	@override String get id1992_1 => 'Портрет с морской раковиной';
	@override String get id1992_2 => 'Сатир и Нимфа';
	@override String get id1992_3 => 'Мальчик с петухом';
	@override String get id1992_4 => 'Нина и Максим';
	@override String get id1992_5 => 'Русский мужик';
	@override String get id1992_6 => 'Портрет Франца Коха';
	@override String get id1992_7 => 'Нина';
	@override String get id1992_8 => 'Ольга';
	@override String get id1992_9 => 'Не балуйся, Максим!';
	@override String get id1992_10 => 'Гобелен "Подсолнухи"';
	@override String get id1993_1 => 'Вечное';
	@override String get id1993_2 => 'Портрет скульптура Лены Хараберюш';
	@override String get id1993_3 => 'Аптекарь';
	@override String get id1993_4 => 'Оля';
	@override String get id1993_5 => 'Мать и дитя';
	@override String get id1993_6 => 'Христос';
	@override String get id1993_7 => 'Наташа';
	@override String get id1993_8 => 'Портрет неизвестной';
	@override String get id1993_9 => 'Роман';
	@override String get id1994_1 => 'Под созвездием Льва';
	@override String get id1994_2 => 'Портрет Зои';
	@override String get id1994_3 => 'Заброшенный двор';
	@override String get id1994_4 => 'Наташа';
	@override String get id1994_5 => 'Песня';
	@override String get id1994_6 => 'Девочка с натюрмортом с яблоками';
	@override String get id1994_7 => 'Кричащая';
	@override String get id1994_8 => 'Наташа';
	@override String get id1994_9 => 'Вакханалья';
	@override String get id1995_1 => 'Маленький фантазер';
	@override String get id1995_2 => 'Моя Родина';
	@override String get id1995_3 => 'Ню';
	@override String get id1995_4 => 'Ольга Колтакова';
	@override String get id1995_5 => 'Тамара Кирщина со спины';
	@override String get id1995_6 => 'Оля';
	@override String get id1995_7 => 'Печаль';
	@override String get id1995_8 => 'Портрет девочки';
	@override String get id1995_9 => 'Вселенная';
	@override String get id1995_10 => 'Леша';
	@override String get id1995_11 => 'Портрет Ростикова';
	@override String get id1995_12 => 'Искусствовед Надя';
	@override String get id1995_13 => 'Мелодия';
	@override String get id1995_14 => 'Таня';
	@override String get id1995_15 => 'Эскиз картины «Портрет Нины»';
	@override String get id1995_16 => 'Натюрморт';
	@override String get id1995_17 => 'Гобелен "Море" ("Волна")';
	@override String get id1996_1 => 'Натюрморт с яблоками';
	@override String get id1996_2 => 'Обнаженная';
	@override String get id1996_3 => 'Максим с арбузом';
	@override String get id1996_4 => 'Гимн (Восторг)';
	@override String get id1996_5 => 'Нина';
	@override String get id1996_6 => 'Инна';
	@override String get id1996_7 => 'Алла Астахович';
	@override String get id1996_8 => 'Лена';
	@override String get id1996_9 => 'Женский портрет (Нина №1)';
	@override String get id1996_10 => 'Вселен';
	@override String get id1996_11 => 'Плывущие в лодке';
	@override String get id1996_12 => 'Женский портрет с шалью';
	@override String get id1996_13 => 'Мама';
	@override String get id1996_14 => 'Филарет Минский';
	@override String get id1996_15 => 'Натюрморт в пространстве';
	@override String get id1996_16 => 'Портрет Кучинского';
	@override String get id1996_17 => 'Женский портрет';
	@override String get id1996_18 => 'Моя Вселенная';
	@override String get id1997_1 => 'Иван';
	@override String get id1997_2 => 'Портрет архитектора Владимира Салазкина';
	@override String get id1997_3 => 'Война миров (последняя работа)';
	@override String get id1997_4 => 'Автопортрет';
	@override String get id1997_5 => 'Лето в Богучаре';
	@override String get id1997_6 => 'Две вдовы';
	@override String get idunknown_1 => 'Разлив';
	@override String get idunknown_2 => 'Женский портрет';
	@override String get idunknown_3 => 'Голубые колючки';
	@override String get idunknown_4 => 'Нина';
	@override String get idunknown_5 => 'Нина';
}

// Path: catalog.paintingMediums
class _Translations$catalog$paintingMediums$ru implements Translations$catalog$paintingMediums$en {
	_Translations$catalog$paintingMediums$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get canvasOil => 'Холст, масло';
	@override String get hardboardOil => 'ДВП, масло';
	@override String get cardboard => 'Картон';
	@override String get woolLinenWeaving => 'Шерсть, лён, ткачество';
}

// Path: common.video
class _Translations$common$video$ru implements Translations$common$video$en {
	_Translations$common$video$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get loadError => 'Не удалось загрузить видео';
	@override String get openExternally => 'Открыть во внешнем плеере';
}

// Path: archiveFeed.items
class _Translations$archiveFeed$items$ru implements Translations$archiveFeed$items$en {
	_Translations$archiveFeed$items$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$archiveFeed$items$boguchar2026$ru boguchar2026 = _Translations$archiveFeed$items$boguchar2026$ru._(_root);
	@override late final _Translations$archiveFeed$items$priorbankChtobyChuvstvovat$ru priorbankChtobyChuvstvovat = _Translations$archiveFeed$items$priorbankChtobyChuvstvovat$ru._(_root);
	@override late final _Translations$archiveFeed$items$nitiSudby$ru nitiSudby = _Translations$archiveFeed$items$nitiSudby$ru._(_root);
	@override late final _Translations$archiveFeed$items$boguchar2024$ru boguchar2024 = _Translations$archiveFeed$items$boguchar2024$ru._(_root);
	@override late final _Translations$archiveFeed$items$belgazprombankKraskiPobedy$ru belgazprombankKraskiPobedy = _Translations$archiveFeed$items$belgazprombankKraskiPobedy$ru._(_root);
	@override late final _Translations$archiveFeed$items$nebaZiamlja$ru nebaZiamlja = _Translations$archiveFeed$items$nebaZiamlja$ru._(_root);
}

// Path: films.watchOn
class _Translations$films$watchOn$ru implements Translations$films$watchOn$en {
	_Translations$films$watchOn$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get youtube => 'Смотреть на YouTube';
	@override String get googleDrive => 'Смотреть на Google Диске';
	@override String get instagram => 'Открыть в Instagram';
}

// Path: films.items
class _Translations$films$items$ru implements Translations$films$items$en {
	_Translations$films$items$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _Translations$films$items$ispovedVremeni$ru ispovedVremeni = _Translations$films$items$ispovedVremeni$ru._(_root);
	@override late final _Translations$films$items$aleksandrKishchenko$ru aleksandrKishchenko = _Translations$films$items$aleksandrKishchenko$ru._(_root);
	@override late final _Translations$films$items$voronezhKramskoyExhibition$ru voronezhKramskoyExhibition = _Translations$films$items$voronezhKramskoyExhibition$ru._(_root);
	@override late final _Translations$films$items$mastersOfSovietArt1988$ru mastersOfSovietArt1988 = _Translations$films$items$mastersOfSovietArt1988$ru._(_root);
	@override late final _Translations$films$items$bogucharLecture$ru bogucharLecture = _Translations$films$items$bogucharLecture$ru._(_root);
	@override late final _Translations$films$items$culturalCodesTapestries$ru culturalCodesTapestries = _Translations$films$items$culturalCodesTapestries$ru._(_root);
	@override late final _Translations$films$items$tapestryOfCenturyMinsk$ru tapestryOfCenturyMinsk = _Translations$films$items$tapestryOfCenturyMinsk$ru._(_root);
	@override late final _Translations$films$items$chernobylTapestryFacts$ru chernobylTapestryFacts = _Translations$films$items$chernobylTapestryFacts$ru._(_root);
	@override late final _Translations$films$items$kishchenkoReel1$ru kishchenkoReel1 = _Translations$films$items$kishchenkoReel1$ru._(_root);
}

// Path: bio.feature
class _Translations$bio$feature$ru implements Translations$bio$feature$en {
	_Translations$bio$feature$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'НАСЛЕДИЕ МИРОВОГО МАСШТАБА';
	@override String get body => 'В этой коллекции собраны работы выдающегося мастера, чье искусство навсегда изменило представление о монументальной живописи и ткачестве. От грандиозных мозаик, ставших визуальным кодом Минска, до знаменитого «Гобелена века» и полотна «Чернобыль», украшающего штаб-квартиру ООН в Нью-Йорке. Каждое произведение Кищенко — это философский трактат о связи времен, космосе и несокрушимом человеческом духе.';
	@override String get cta => 'ИССЛЕДОВАТЬ КОЛЛЕКЦИЮ';
	@override String get worksValue => '500+';
	@override String get worksLabel => 'Работ искусства по всему миру';
	@override String get panelsValue => '6+';
	@override String get panelsLabel => 'Монументальные панно в Минске';
	@override String get guinnessValue => '';
	@override String get guinnessLabel => 'Рекорд Гиннесса в искусстве';
	@override String get unGiftValue => '';
	@override String get unGiftLabel => 'Подарок ООН от Республики Беларусь';
}

// Path: bio.universalRealism
class _Translations$bio$universalRealism$ru implements Translations$bio$universalRealism$en {
	_Translations$bio$universalRealism$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Родоначальник «Вселенского реализма»';
	@override String get body => 'Кищенко не просто отображал действительность — он создавал новую систему координат, которую назвал Вселенским реализмом. В основе его метода лежит убеждение, что художник — это «ткач времени», обязанный соединять прошлое и будущее. Его искусство вышло за рамки национальных границ, оперируя категориями глобальной человеческой драмы. Для Кищенко человек — это полубог, чьи поступки резонируют в масштабах Вселенной. В его работах тени становятся самостоятельными формами, а цвет — «космической музыкой», подчиненной строгому высшему порядку.';
}

// Path: bio.tapestry
class _Translations$bio$tapestry$ru implements Translations$bio$tapestry$en {
	_Translations$bio$tapestry$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '«Гобелен века»: Вершина мирового ткачества';
	@override String get intro => 'Александр Кищенко вошел в историю как автор самого большого гобелена в мире, официально внесенного в Книгу рекордов Гиннесса.';
	@override String get scaleLabel => 'Масштаб';
	@override String get scale => 'Полотно размером 19 × 14 метров (около 300 кв. м), весом более тонны.';
	@override String get conceptLabel => 'Замысел';
	@override String get concept => 'Грандиозная ткань истории, где переплетены судьбы 80 знаковых личностей (от Христа и Мадонны до Черчилля, Кастро и Горбачева).';
	@override String get meaningLabel => 'Смысл';
	@override String get meaning => 'Это произведение-храм, в центре которого разворачивается вечный конфликт между созиданием и разрушением. Работа была признана национальным достоянием Беларуси.';
}

// Path: bio.chernobyl
class _Translations$bio$chernobyl$ru implements Translations$bio$chernobyl$en {
	_Translations$bio$chernobyl$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => '«Чернобыль»: Голос нации в стенах ООН';
	@override String get body => 'Одним из самых эмоционально сильных произведений мастера стал гобелен «Чернобыль» (1991). Переданный в дар Организации Объединенных Наций, он и сегодня украшает штаб-квартиру ООН в Нью-Йорке. Когда мир увидел это полотно, Генеральный секретарь ООН Перес де Куэльяр сравнил его с «Герникой» Пикассо. Для Кищенко этот гобелен был не просто памятью о трагедии, а «глазами Беларуси» — планетарным предупреждением о хрупкости жизни, вытканным руками великих белорусских мастериц.';
}

// Path: bio.mosaic
class _Translations$bio$mosaic$ru implements Translations$bio$mosaic$en {
	_Translations$bio$mosaic$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Лицо города: Мозаичные панно «Восток»';
	@override String get intro => 'Кищенко сформировал визуальный код современного Минска. Его знаменитые мозаики на жилых высотках в микрорайоне Восток-1 стали визитной карточкой столицы.';
	@override String get panelsLabel => 'Четыре монументальных полотна';
	@override String get panels => '«Город-воин», «Город науки», «Город культуры» и «Город-строитель».';
	@override String get panelsMeaning => 'Эти работы превратили типовую застройку в художественное пространство, где через смальту и камень воспевается триумф человеческого духа.';
}

// Path: bio.legacy
class _Translations$bio$legacy$ru implements Translations$bio$legacy$en {
	_Translations$bio$legacy$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Наследие';
	@override String get body => 'Александр Кищенко оставил после себя не только полотна, хранящиеся в Третьяковской галерее и частных коллекциях мировых лидеров (Б. Клинтона, Ф. Миттерана), но и целую школу белорусского монументального гобелена. Его имя носит Борисовский комбинат декоративно-прикладного искусства, где создавались его великие шпалеры.';
}

// Path: seo.aboutAuthor
class _Translations$seo$aboutAuthor$ru implements Translations$seo$aboutAuthor$en {
	_Translations$seo$aboutAuthor$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Александр Кищенко — народный художник Беларуси | КИЩЕНКО-АРТ';
	@override String get description => 'Александр Михайлович Кищенко (1933–1997) — народный художник Республики Беларусь, живописец и монументалист. Автор самого большого гобелена в мире и «Чернобыля» в штаб-квартире ООН.';
	@override String get keywords => 'Александр Кищенко, биография, белорусский художник, монументалист, гобелен';
}

// Path: seo.catalog
class _Translations$seo$catalog$ru implements Translations$seo$catalog$en {
	_Translations$seo$catalog$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Каталог работ Александра Кищенко | КИЩЕНКО-АРТ';
	@override String get description => 'Каталог живописи и гобеленов Александра Кищенко: портреты, пейзажи, философские полотна 1958–1997 годов.';
	@override String get keywords => 'каталог работ Кищенко, живопись, гобелены, купить картину Кищенко';
}

// Path: seo.news
class _Translations$seo$news$ru implements Translations$seo$news$en {
	_Translations$seo$news$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Новости и выставки | КИЩЕНКО-АРТ';
	@override String get description => 'Новости, выставки и события, связанные с наследием Александра Кищенко и галереей КИЩЕНКО-АРТ.';
	@override String get keywords => 'выставки Кищенко, новости галереи, события';
}

// Path: seo.films
class _Translations$seo$films$ru implements Translations$seo$films$en {
	_Translations$seo$films$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Документальные фильмы об А. Кищенко | КИЩЕНКО-АРТ';
	@override String get description => 'Документальные фильмы и видеоматериалы об Александре Кищенко, его творчестве и монументальных произведениях.';
	@override String get keywords => 'фильм о Кищенко, документальный фильм, гобелен века, видео';
}

// Path: seo.archive
class _Translations$seo$archive$ru implements Translations$seo$archive$en {
	_Translations$seo$archive$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Архив публикаций | КИЩЕНКО-АРТ';
	@override String get description => 'Архив публикаций и материалов о творчестве и выставках Александра Михайловича Кищенко.';
	@override String get keywords => 'архив Кищенко, публикации, статьи, пресса';
}

// Path: seo.contacts
class _Translations$seo$contacts$ru implements Translations$seo$contacts$en {
	_Translations$seo$contacts$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Контакты | КИЩЕНКО-АРТ';
	@override String get description => 'Контакты галереи КИЩЕНКО-АРТ: мастерская в Минске, телефон, Instagram и ВКонтакте.';
	@override String get keywords => 'контакты галереи Кищенко, мастерская Минск, купить картину';
}

// Path: archiveFeed.items.boguchar2026
class _Translations$archiveFeed$items$boguchar2026$ru implements Translations$archiveFeed$items$boguchar2026$en {
	_Translations$archiveFeed$items$boguchar2026$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Экскурсия «История жизни М. А. Кищенко»';
	@override String get excerpt => '19 февраля 2026 года в стенах Богучарского музея состоялась экскурсия для учащихся школы села Дьяченково («Движение первых»), посвящённая знакомству с жизнью и творчеством известного художника Александра Михайловича Кищенко.';
}

// Path: archiveFeed.items.priorbankChtobyChuvstvovat
class _Translations$archiveFeed$items$priorbankChtobyChuvstvovat$ru implements Translations$archiveFeed$items$priorbankChtobyChuvstvovat$en {
	_Translations$archiveFeed$items$priorbankChtobyChuvstvovat$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Выставка «Чтобы чувствовать» — коллекция Приорбанка';
	@override String get excerpt => 'Приорбанк впервые представляет публике свою корпоративную коллекцию белорусской живописи 1960–2000-х годов, формировавшуюся более 30 лет. На выставке «Чтобы чувствовать» во дворце Румянцевых и Паскевичей с 10 апреля по 7 июня показаны более 70 уникальных полотен, среди которых три работы Александра Кищенко.';
}

// Path: archiveFeed.items.nitiSudby
class _Translations$archiveFeed$items$nitiSudby$ru implements Translations$archiveFeed$items$nitiSudby$en {
	_Translations$archiveFeed$items$nitiSudby$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Александр Кищенко. Нити судьбы';
	@override String get excerpt => 'В музее состоялось торжественное открытие выставки «Александр Кищенко. Нити судьбы» (12+), посвященной творчеству выдающегося белорусского художника, уроженца Богучарского района Воронежской области. Выставка организована в честь 300-летия Воронежской губернии, став частью культурного взаимодействия региона с Республикой Беларусь.';
}

// Path: archiveFeed.items.boguchar2024
class _Translations$archiveFeed$items$boguchar2024$ru implements Translations$archiveFeed$items$boguchar2024$en {
	_Translations$archiveFeed$items$boguchar2024$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Экскурсия «История жизни А. М. Кищенко»';
	@override String get excerpt => 'Одним из самых талантливых людей Богучарского края был Александр Михайлович Кищенко — народный художник Республики Беларусь и почётный гражданин Богучарского района. Член Союза художников СССР и лауреат Государственной премии, он оставил яркий след в истории искусства.';
}

// Path: archiveFeed.items.belgazprombankKraskiPobedy
class _Translations$archiveFeed$items$belgazprombankKraskiPobedy$ru implements Translations$archiveFeed$items$belgazprombankKraskiPobedy$en {
	_Translations$archiveFeed$items$belgazprombankKraskiPobedy$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Белгазпромбанк приглашает на выставку «Краски Великой Победы»';
	@override String get excerpt => '28 июня 2024 года. В преддверии 80-й годовщины освобождения Беларуси от немецко-фашистских захватчиков в фойе головного офиса Белгазпромбанка торжественно открылась тематическая выставка «Краски Великой Победы». Она объединила работы белорусских авторов, не понаслышке знакомых с ужасами войны, — А. Кищенко, В. Протасени, И. Стасевича, Н. Чурабо, И. Рэя, П. Данелия и других.';
}

// Path: archiveFeed.items.nebaZiamlja
class _Translations$archiveFeed$items$nebaZiamlja$ru implements Translations$archiveFeed$items$nebaZiamlja$en {
	_Translations$archiveFeed$items$nebaZiamlja$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Небо и земля Александра Кищенко';
	@override String get excerpt => '6 мая 2023 года в Национальном художественном музее Республики Беларусь начинает работать выставка «Небо и земля Александра Кищенко», посвященная масштабу его художественного мышления и значению наследия мастера.';
}

// Path: films.items.ispovedVremeni
class _Translations$films$items$ispovedVremeni$ru implements Translations$films$items$ispovedVremeni$en {
	_Translations$films$items$ispovedVremeni$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'А. Кищенко. Исповедь Времени';
	@override String get excerpt => 'Документальный фильм об Александре Михайловиче Кищенко (1933–1997) — народном художнике Беларуси, авторе самого большого гобелена в мире. Режиссёр В. Королёв; съёмка и монтаж — Е. Милковский.';
}

// Path: films.items.aleksandrKishchenko
class _Translations$films$items$aleksandrKishchenko$ru implements Translations$films$items$aleksandrKishchenko$en {
	_Translations$films$items$aleksandrKishchenko$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Александр Кищенко';
	@override String get excerpt => 'Телевизионный фильм о жизни и творчестве Александра Кищенко: монументальные росписи Минска, «Гобелен века» и философия универсального реализма мастера.';
}

// Path: films.items.voronezhKramskoyExhibition
class _Translations$films$items$voronezhKramskoyExhibition$ru implements Translations$films$items$voronezhKramskoyExhibition$en {
	_Translations$films$items$voronezhKramskoyExhibition$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Выставка А. М. Кищенко в Воронежском художественном музее им. И. Н. Крамского';
	@override String get excerpt => 'Сюжет о выставке работ известного белорусского художника Александра Кищенко в Воронежском областном художественном музее имени И. Н. Крамского.';
}

// Path: films.items.mastersOfSovietArt1988
class _Translations$films$items$mastersOfSovietArt1988$ru implements Translations$films$items$mastersOfSovietArt1988$en {
	_Translations$films$items$mastersOfSovietArt1988$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'А. Кищенко. Серия «Мастера советского искусства». Альбом 1988 г.';
	@override String get excerpt => 'Видеообзор альбома 1988 года из серии «Мастера советского искусства», посвящённого живописи и монументальным работам Александра Кищенко.';
}

// Path: films.items.bogucharLecture
class _Translations$films$items$bogucharLecture$ru implements Translations$films$items$bogucharLecture$en {
	_Translations$films$items$bogucharLecture$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Лекция «Земляк с мировым именем». А. М. Кищенко. Богучарский музей';
	@override String get excerpt => 'Лекция Богучарского историко-краеведческого музея об Александре Михайловиче Кищенко — земляке с мировым именем, родом из Богучарского района.';
}

// Path: films.items.culturalCodesTapestries
class _Translations$films$items$culturalCodesTapestries$ru implements Translations$films$items$culturalCodesTapestries$en {
	_Translations$films$items$culturalCodesTapestries$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Культурные коды нации: Где сейчас гобелены народного художника Кищенко? Главный эфир';
	@override String get excerpt => 'Программа «Главный эфир» в рубрике «Культурные коды нации» рассказывает, где сегодня находятся гобелены народного художника Беларуси Александра Кищенко.';
}

// Path: films.items.tapestryOfCenturyMinsk
class _Translations$films$items$tapestryOfCenturyMinsk$ru implements Translations$films$items$tapestryOfCenturyMinsk$en {
	_Translations$films$items$tapestryOfCenturyMinsk$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Как в Минске готовили к экспозиции «Гобелен века» в Банке развития';
	@override String get excerpt => 'Репортаж о том, как в Минске готовили к экспозиции работу белорусского художника Александра Кищенко «Гобелен века» в Банке развития.';
}

// Path: films.items.chernobylTapestryFacts
class _Translations$films$items$chernobylTapestryFacts$ru implements Translations$films$items$chernobylTapestryFacts$en {
	_Translations$films$items$chernobylTapestryFacts$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Гобелены «Века» и «Чернобыль». Интересные факты';
	@override String get excerpt => 'Видеоматериал об известных гобеленах Александра Кищенко — «Гобелене века» и «Чернобыле»: история создания, символика и интересные факты.';
}

// Path: films.items.kishchenkoReel1
class _Translations$films$items$kishchenkoReel1$ru implements Translations$films$items$kishchenkoReel1$en {
	_Translations$films$items$kishchenkoReel1$ru._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'А. Кищенко в Instagram';
	@override String get excerpt => 'Короткое видео о работах Александра Кищенко из социальной сети.';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'КИЩЕНКО-АРТ',
			'app.brandTagline' => 'Коллекция изобразительного искусства',
			'app.logoMark' => 'КА',
			'navigation.aboutAuthor' => 'Об авторе',
			'navigation.news' => 'Новости',
			'navigation.catalogOfWorks' => 'Каталог работ',
			'navigation.films' => 'Фильмы',
			'navigation.archive' => 'Архив',
			'navigation.contacts' => 'Контакты',
			'catalog.workPrefix' => 'Работа',
			'catalog.errorTitle' => 'Не удалось загрузить картины',
			'catalog.errorWithDetails' => ({required Object message}) => 'Не удалось загрузить картины. ${message}',
			'catalog.decade.all' => 'Все',
			'catalog.decade.sixties' => '60-е',
			'catalog.decade.seventies' => '70-е',
			'catalog.decade.eighties' => '80-е',
			'catalog.decade.nineties' => '90-е',
			'catalog.paintingNames.id1958_1' => 'Окраина. Старая мельница',
			'catalog.paintingNames.id1958_2' => 'Ангелина',
			'catalog.paintingNames.id1958_3' => 'Туалет',
			'catalog.paintingNames.id1959_1' => 'Женский портрет',
			'catalog.paintingNames.id1960_1' => 'Композиция №1',
			'catalog.paintingNames.id1960_2' => 'Женский портрет в зеленой гамме',
			'catalog.paintingNames.id1960_3' => 'Первый снег',
			'catalog.paintingNames.id1960_4' => 'Женщина в кресле',
			'catalog.paintingNames.id1960_5' => 'Портрет художника Владимира Урищенко',
			'catalog.paintingNames.id1960_6' => 'Девочка с бантом',
			'catalog.paintingNames.id1960_7' => 'Женский портрет',
			'catalog.paintingNames.id1960_8' => 'Женский портрет',
			'catalog.paintingNames.id1960_9' => 'Ожидание',
			'catalog.paintingNames.id1962_1' => 'Северянка (Женщина с севера)',
			'catalog.paintingNames.id1965_1' => 'Женский портрет',
			'catalog.paintingNames.id1965_2' => 'Цирковой мальчик',
			'catalog.paintingNames.id1965_3' => 'Искушение',
			'catalog.paintingNames.id1967_1' => 'Зоя Литвинова',
			'catalog.paintingNames.id1967_2' => 'Две жизни',
			'catalog.paintingNames.id1968_1' => 'Натюрморт с грушами',
			'catalog.paintingNames.id1969_1' => 'Ангел',
			'catalog.paintingNames.id1970_1' => 'Учительница',
			'catalog.paintingNames.id1970_2' => 'Последний севастополец',
			'catalog.paintingNames.id1972_1' => 'Портрет Жени Мусинской',
			'catalog.paintingNames.id1974_1' => 'Девушка в русском костюме',
			'catalog.paintingNames.id1975_1' => 'Первенец',
			'catalog.paintingNames.id1976_1' => 'Девушка в красном с золотом (Зеленый виноград)',
			'catalog.paintingNames.id1979_1' => 'Мать с ребенком',
			'catalog.paintingNames.id1979_2' => 'Наташа',
			'catalog.paintingNames.id1979_3' => 'Убийство семьи Громовых. Действие 1943. Тамань.',
			'catalog.paintingNames.id1979_4' => 'Эскиз к работе "Боль поэта"',
			'catalog.paintingNames.id1979_5' => 'Радость. Материнство',
			'catalog.paintingNames.id1980_1' => 'Фрагмент к картине "Мед"',
			'catalog.paintingNames.id1980_2' => 'Портрет мамы',
			'catalog.paintingNames.id1980_3' => 'Нина',
			'catalog.paintingNames.id1980_4' => 'Наташа Марченко',
			'catalog.paintingNames.id1980_5' => 'Наташа',
			'catalog.paintingNames.id1981_1' => 'Раздумье',
			'catalog.paintingNames.id1981_2' => 'Портрет Елены Образцовой',
			'catalog.paintingNames.id1982_1' => 'Автопортрет',
			'catalog.paintingNames.id1982_2' => 'Адам и Ева',
			'catalog.paintingNames.id1982_3' => 'Осквернение храма',
			'catalog.paintingNames.id1982_4' => 'Мракобесы',
			'catalog.paintingNames.id1982_5' => 'Подсолнухи',
			'catalog.paintingNames.id1982_6' => 'Пейзаж',
			'catalog.paintingNames.id1983_1' => 'Мадонна',
			'catalog.paintingNames.id1983_2' => 'Заговор (Клятва масонов)',
			'catalog.paintingNames.id1983_3' => 'Нина',
			'catalog.paintingNames.id1983_4' => 'Портрет Марии Биешу',
			'catalog.paintingNames.id1983_5' => 'Зов моря',
			'catalog.paintingNames.id1983_6' => 'Плач',
			'catalog.paintingNames.id1983_7' => 'Наташа',
			'catalog.paintingNames.id1984_1' => 'Нина',
			'catalog.paintingNames.id1984_2' => 'Нина',
			'catalog.paintingNames.id1985_1' => 'Дядя Ваня',
			'catalog.paintingNames.id1985_2' => 'Девочка в красной шляпе',
			'catalog.paintingNames.id1985_3' => 'Женский образ. Наташа Татаренко',
			'catalog.paintingNames.id1985_4' => 'Мужской портрет',
			'catalog.paintingNames.id1985_5' => 'Летний душ',
			'catalog.paintingNames.id1986_1' => 'Портрет девочки',
			'catalog.paintingNames.id1986_2' => 'Портрет кинооператора А. Абадовского',
			'catalog.paintingNames.id1986_3' => 'Последние дни сентября',
			'catalog.paintingNames.id1986_4' => 'Портрет Бущика',
			'catalog.paintingNames.id1986_5' => 'Портрет Наташи Марченко',
			'catalog.paintingNames.id1987_1' => 'Он будет жить. Чернобыль',
			'catalog.paintingNames.id1987_2' => 'Женский портрет',
			'catalog.paintingNames.id1988_1' => 'Портрет Маши',
			'catalog.paintingNames.id1988_2' => 'Мужская голова',
			'catalog.paintingNames.id1988_3' => 'Профиль',
			'catalog.paintingNames.id1988_4' => 'Идущая',
			'catalog.paintingNames.id1989_1' => 'На берегу Дона',
			'catalog.paintingNames.id1989_2' => 'Утро',
			'catalog.paintingNames.id1989_3' => 'Портрет художницы Тамары Кирщиной',
			'catalog.paintingNames.id1989_4' => 'Обнаженная в пространстве музыка',
			'catalog.paintingNames.id1989_5' => 'Идущая (Вселенная)',
			'catalog.paintingNames.id1989_6' => 'Нина',
			'catalog.paintingNames.id1989_7' => 'Брат и сестра Елькины',
			'catalog.paintingNames.id1989_8' => 'Нина',
			'catalog.paintingNames.id1989_9' => 'Обнаженная',
			'catalog.paintingNames.id1990_1' => 'В пространстве (Обнаженная)',
			'catalog.paintingNames.id1990_2' => 'Дары планет',
			'catalog.paintingNames.id1990_3' => 'Зоя',
			'catalog.paintingNames.id1990_4' => 'Мужской портрет',
			'catalog.paintingNames.id1990_5' => 'На балконе',
			'catalog.paintingNames.id1991_1' => 'Девочка с медом (Вселенная)',
			'catalog.paintingNames.id1991_2' => 'Мечта',
			'catalog.paintingNames.id1991_3' => 'Вечная',
			'catalog.paintingNames.id1992_1' => 'Портрет с морской раковиной',
			'catalog.paintingNames.id1992_2' => 'Сатир и Нимфа',
			'catalog.paintingNames.id1992_3' => 'Мальчик с петухом',
			'catalog.paintingNames.id1992_4' => 'Нина и Максим',
			'catalog.paintingNames.id1992_5' => 'Русский мужик',
			'catalog.paintingNames.id1992_6' => 'Портрет Франца Коха',
			'catalog.paintingNames.id1992_7' => 'Нина',
			'catalog.paintingNames.id1992_8' => 'Ольга',
			'catalog.paintingNames.id1992_9' => 'Не балуйся, Максим!',
			'catalog.paintingNames.id1992_10' => 'Гобелен "Подсолнухи"',
			'catalog.paintingNames.id1993_1' => 'Вечное',
			'catalog.paintingNames.id1993_2' => 'Портрет скульптура Лены Хараберюш',
			'catalog.paintingNames.id1993_3' => 'Аптекарь',
			'catalog.paintingNames.id1993_4' => 'Оля',
			'catalog.paintingNames.id1993_5' => 'Мать и дитя',
			'catalog.paintingNames.id1993_6' => 'Христос',
			'catalog.paintingNames.id1993_7' => 'Наташа',
			'catalog.paintingNames.id1993_8' => 'Портрет неизвестной',
			'catalog.paintingNames.id1993_9' => 'Роман',
			'catalog.paintingNames.id1994_1' => 'Под созвездием Льва',
			'catalog.paintingNames.id1994_2' => 'Портрет Зои',
			'catalog.paintingNames.id1994_3' => 'Заброшенный двор',
			'catalog.paintingNames.id1994_4' => 'Наташа',
			'catalog.paintingNames.id1994_5' => 'Песня',
			'catalog.paintingNames.id1994_6' => 'Девочка с натюрмортом с яблоками',
			'catalog.paintingNames.id1994_7' => 'Кричащая',
			'catalog.paintingNames.id1994_8' => 'Наташа',
			'catalog.paintingNames.id1994_9' => 'Вакханалья',
			'catalog.paintingNames.id1995_1' => 'Маленький фантазер',
			'catalog.paintingNames.id1995_2' => 'Моя Родина',
			'catalog.paintingNames.id1995_3' => 'Ню',
			'catalog.paintingNames.id1995_4' => 'Ольга Колтакова',
			'catalog.paintingNames.id1995_5' => 'Тамара Кирщина со спины',
			'catalog.paintingNames.id1995_6' => 'Оля',
			'catalog.paintingNames.id1995_7' => 'Печаль',
			'catalog.paintingNames.id1995_8' => 'Портрет девочки',
			'catalog.paintingNames.id1995_9' => 'Вселенная',
			'catalog.paintingNames.id1995_10' => 'Леша',
			'catalog.paintingNames.id1995_11' => 'Портрет Ростикова',
			'catalog.paintingNames.id1995_12' => 'Искусствовед Надя',
			'catalog.paintingNames.id1995_13' => 'Мелодия',
			'catalog.paintingNames.id1995_14' => 'Таня',
			'catalog.paintingNames.id1995_15' => 'Эскиз картины «Портрет Нины»',
			'catalog.paintingNames.id1995_16' => 'Натюрморт',
			'catalog.paintingNames.id1995_17' => 'Гобелен "Море" ("Волна")',
			'catalog.paintingNames.id1996_1' => 'Натюрморт с яблоками',
			'catalog.paintingNames.id1996_2' => 'Обнаженная',
			'catalog.paintingNames.id1996_3' => 'Максим с арбузом',
			'catalog.paintingNames.id1996_4' => 'Гимн (Восторг)',
			'catalog.paintingNames.id1996_5' => 'Нина',
			'catalog.paintingNames.id1996_6' => 'Инна',
			'catalog.paintingNames.id1996_7' => 'Алла Астахович',
			'catalog.paintingNames.id1996_8' => 'Лена',
			'catalog.paintingNames.id1996_9' => 'Женский портрет (Нина №1)',
			'catalog.paintingNames.id1996_10' => 'Вселен',
			'catalog.paintingNames.id1996_11' => 'Плывущие в лодке',
			'catalog.paintingNames.id1996_12' => 'Женский портрет с шалью',
			'catalog.paintingNames.id1996_13' => 'Мама',
			'catalog.paintingNames.id1996_14' => 'Филарет Минский',
			'catalog.paintingNames.id1996_15' => 'Натюрморт в пространстве',
			'catalog.paintingNames.id1996_16' => 'Портрет Кучинского',
			'catalog.paintingNames.id1996_17' => 'Женский портрет',
			'catalog.paintingNames.id1996_18' => 'Моя Вселенная',
			'catalog.paintingNames.id1997_1' => 'Иван',
			'catalog.paintingNames.id1997_2' => 'Портрет архитектора Владимира Салазкина',
			'catalog.paintingNames.id1997_3' => 'Война миров (последняя работа)',
			'catalog.paintingNames.id1997_4' => 'Автопортрет',
			'catalog.paintingNames.id1997_5' => 'Лето в Богучаре',
			'catalog.paintingNames.id1997_6' => 'Две вдовы',
			'catalog.paintingNames.idunknown_1' => 'Разлив',
			'catalog.paintingNames.idunknown_2' => 'Женский портрет',
			'catalog.paintingNames.idunknown_3' => 'Голубые колючки',
			'catalog.paintingNames.idunknown_4' => 'Нина',
			'catalog.paintingNames.idunknown_5' => 'Нина',
			'catalog.paintingMediums.canvasOil' => 'Холст, масло',
			'catalog.paintingMediums.hardboardOil' => 'ДВП, масло',
			'catalog.paintingMediums.cardboard' => 'Картон',
			'catalog.paintingMediums.woolLinenWeaving' => 'Шерсть, лён, ткачество',
			'common.pageNotFound' => 'Страница не найдена',
			'common.retry' => 'Повторить',
			'common.errorTitle' => 'Что-то пошло не так',
			'common.viewCatalog' => 'СМОТРЕТЬ КАТАЛОГ',
			'common.learnMore' => 'ПОДРОБНЕЕ',
			'common.video.loadError' => 'Не удалось загрузить видео',
			'common.video.openExternally' => 'Открыть во внешнем плеере',
			'tour.next' => 'Далее',
			'tour.gotIt' => 'Понятно',
			'tour.back' => 'Назад',
			'tour.chernobylBody' => 'Также Кищенко А. М. является автором гобелена «Чернобыль» (1991), который был передан в дар ООН и сегодня украшает её штаб-квартиру в Нью-Йорке. Генеральный секретарь ООН сравнил его с «Герникой» Пикассо.',
			'tour.originsTitle' => 'У истоков «Вселенского реализма»',
			'tour.originsBody' => 'Александр Михайлович Кищенко (1933–1997). Живописец. Философ. Монументалист. Родился в хуторе Белый Колодезь (ныне Богучарский район, Воронежская область) и обрёл мировую известность как автор самого большого в мире «Гобелена века».',
			'tour.scaleTitle' => 'Масштаб гобелена века',
			'tour.scaleBody' => '«Гобелен века» — это полотно, выполненное в технике ручного ткачества, размером 19 × 14 метров (эквивалентно пятиэтажному зданию), весом более тонны. Внесён в Книгу рекордов Гиннесса в 1999 году как самый большой в мире гобелен.',
			'language.label' => 'Язык',
			'language.russian' => 'Русский',
			'language.english' => 'English',
			'language.spanish' => 'Español',
			'language.french' => 'Français',
			'language.german' => 'Deutsch',
			'language.belarusian' => 'Белорусский',
			'archiveFeed.title' => 'Архив публикаций',
			'archiveFeed.latestLabel' => 'Последняя публикация',
			'archiveFeed.moreLabel' => 'Материалы и новости',
			'archiveFeed.openArticle' => 'Открыть статью',
			'archiveFeed.sourceLabel' => 'Источник',
			'archiveFeed.yearLabel' => ({required Object year}) => '${year} год',
			'archiveFeed.items.boguchar2026.title' => 'Экскурсия «История жизни М. А. Кищенко»',
			'archiveFeed.items.boguchar2026.excerpt' => '19 февраля 2026 года в стенах Богучарского музея состоялась экскурсия для учащихся школы села Дьяченково («Движение первых»), посвящённая знакомству с жизнью и творчеством известного художника Александра Михайловича Кищенко.',
			'archiveFeed.items.priorbankChtobyChuvstvovat.title' => 'Выставка «Чтобы чувствовать» — коллекция Приорбанка',
			'archiveFeed.items.priorbankChtobyChuvstvovat.excerpt' => 'Приорбанк впервые представляет публике свою корпоративную коллекцию белорусской живописи 1960–2000-х годов, формировавшуюся более 30 лет. На выставке «Чтобы чувствовать» во дворце Румянцевых и Паскевичей с 10 апреля по 7 июня показаны более 70 уникальных полотен, среди которых три работы Александра Кищенко.',
			'archiveFeed.items.nitiSudby.title' => 'Александр Кищенко. Нити судьбы',
			'archiveFeed.items.nitiSudby.excerpt' => 'В музее состоялось торжественное открытие выставки «Александр Кищенко. Нити судьбы» (12+), посвященной творчеству выдающегося белорусского художника, уроженца Богучарского района Воронежской области. Выставка организована в честь 300-летия Воронежской губернии, став частью культурного взаимодействия региона с Республикой Беларусь.',
			'archiveFeed.items.boguchar2024.title' => 'Экскурсия «История жизни А. М. Кищенко»',
			'archiveFeed.items.boguchar2024.excerpt' => 'Одним из самых талантливых людей Богучарского края был Александр Михайлович Кищенко — народный художник Республики Беларусь и почётный гражданин Богучарского района. Член Союза художников СССР и лауреат Государственной премии, он оставил яркий след в истории искусства.',
			'archiveFeed.items.belgazprombankKraskiPobedy.title' => 'Белгазпромбанк приглашает на выставку «Краски Великой Победы»',
			'archiveFeed.items.belgazprombankKraskiPobedy.excerpt' => '28 июня 2024 года. В преддверии 80-й годовщины освобождения Беларуси от немецко-фашистских захватчиков в фойе головного офиса Белгазпромбанка торжественно открылась тематическая выставка «Краски Великой Победы». Она объединила работы белорусских авторов, не понаслышке знакомых с ужасами войны, — А. Кищенко, В. Протасени, И. Стасевича, Н. Чурабо, И. Рэя, П. Данелия и других.',
			'archiveFeed.items.nebaZiamlja.title' => 'Небо и земля Александра Кищенко',
			'archiveFeed.items.nebaZiamlja.excerpt' => '6 мая 2023 года в Национальном художественном музее Республики Беларусь начинает работать выставка «Небо и земля Александра Кищенко», посвященная масштабу его художественного мышления и значению наследия мастера.',
			'films.title' => 'Фильмы и документальные ленты',
			'films.subtitle' => 'Видеоархив об А. Кищенко',
			'films.latestLabel' => 'Главный фильм',
			'films.sourceLabel' => 'Источник',
			'films.instagramTitle' => 'Instagram',
			'films.instagramSubtitle' => 'Короткие видео и истории',
			'films.watchOn.youtube' => 'Смотреть на YouTube',
			'films.watchOn.googleDrive' => 'Смотреть на Google Диске',
			'films.watchOn.instagram' => 'Открыть в Instagram',
			'films.items.ispovedVremeni.title' => 'А. Кищенко. Исповедь Времени',
			'films.items.ispovedVremeni.excerpt' => 'Документальный фильм об Александре Михайловиче Кищенко (1933–1997) — народном художнике Беларуси, авторе самого большого гобелена в мире. Режиссёр В. Королёв; съёмка и монтаж — Е. Милковский.',
			'films.items.aleksandrKishchenko.title' => 'Александр Кищенко',
			'films.items.aleksandrKishchenko.excerpt' => 'Телевизионный фильм о жизни и творчестве Александра Кищенко: монументальные росписи Минска, «Гобелен века» и философия универсального реализма мастера.',
			'films.items.voronezhKramskoyExhibition.title' => 'Выставка А. М. Кищенко в Воронежском художественном музее им. И. Н. Крамского',
			'films.items.voronezhKramskoyExhibition.excerpt' => 'Сюжет о выставке работ известного белорусского художника Александра Кищенко в Воронежском областном художественном музее имени И. Н. Крамского.',
			'films.items.mastersOfSovietArt1988.title' => 'А. Кищенко. Серия «Мастера советского искусства». Альбом 1988 г.',
			'films.items.mastersOfSovietArt1988.excerpt' => 'Видеообзор альбома 1988 года из серии «Мастера советского искусства», посвящённого живописи и монументальным работам Александра Кищенко.',
			'films.items.bogucharLecture.title' => 'Лекция «Земляк с мировым именем». А. М. Кищенко. Богучарский музей',
			'films.items.bogucharLecture.excerpt' => 'Лекция Богучарского историко-краеведческого музея об Александре Михайловиче Кищенко — земляке с мировым именем, родом из Богучарского района.',
			'films.items.culturalCodesTapestries.title' => 'Культурные коды нации: Где сейчас гобелены народного художника Кищенко? Главный эфир',
			'films.items.culturalCodesTapestries.excerpt' => 'Программа «Главный эфир» в рубрике «Культурные коды нации» рассказывает, где сегодня находятся гобелены народного художника Беларуси Александра Кищенко.',
			'films.items.tapestryOfCenturyMinsk.title' => 'Как в Минске готовили к экспозиции «Гобелен века» в Банке развития',
			'films.items.tapestryOfCenturyMinsk.excerpt' => 'Репортаж о том, как в Минске готовили к экспозиции работу белорусского художника Александра Кищенко «Гобелен века» в Банке развития.',
			'films.items.chernobylTapestryFacts.title' => 'Гобелены «Века» и «Чернобыль». Интересные факты',
			'films.items.chernobylTapestryFacts.excerpt' => 'Видеоматериал об известных гобеленах Александра Кищенко — «Гобелене века» и «Чернобыле»: история создания, символика и интересные факты.',
			'films.items.kishchenkoReel1.title' => 'А. Кищенко в Instagram',
			'films.items.kishchenkoReel1.excerpt' => 'Короткое видео о работах Александра Кищенко из социальной сети.',
			'newsFeed.title' => 'Новости',
			'newsFeed.subtitle' => 'Публикации, выставки и события',
			'newsFeed.emptyState' => 'Новостей пока нет. Загляните позже.',
			'newsFeed.errorTitle' => 'Не удалось загрузить новости',
			'newsFeed.retry' => 'Повторить',
			'newsFeed.back' => 'К списку новостей',
			'newsFeed.sourceLabel' => 'Источник',
			'newsFeed.readTimeLabel' => 'На чтение',
			'newsFeed.readTimeValue' => ({required Object minutes}) => '${minutes} мин',
			'newsFeed.viewsLabel' => 'Просмотров',
			'newsFeed.publishedLabel' => 'Опубликовано',
			'bio.heroTitle' => 'ИСКУССТВО КОСМИЧЕСКОГО МАСШТАБА',
			'bio.heroSubtitle' => 'Искусство, стирающее границы между земным и вечным. Народный художник Республики Беларусь, создатель самого большого в мире «Гобелена века»',
			'bio.heroBrandName' => 'Александр Михайлович Кищенко',
			'bio.name' => 'Александр Михайлович Кищенко (1933–1997)',
			'bio.tagline' => 'Живописец. Философ. Монументалист. Родоначальник «Вселенского реализма».',
			'bio.intro' => 'Александр Кищенко — фигура ренессансного масштаба в искусстве XX века. Человек, сумевший превратить мягкую нить гобелена в мощное архитектурное высказывание, а стены городов — в открытые книги философских смыслов. Его творчество — это мост между архаикой и космосом, между болью земли и светом далеких галактик.',
			'bio.feature.title' => 'НАСЛЕДИЕ МИРОВОГО МАСШТАБА',
			'bio.feature.body' => 'В этой коллекции собраны работы выдающегося мастера, чье искусство навсегда изменило представление о монументальной живописи и ткачестве. От грандиозных мозаик, ставших визуальным кодом Минска, до знаменитого «Гобелена века» и полотна «Чернобыль», украшающего штаб-квартиру ООН в Нью-Йорке. Каждое произведение Кищенко — это философский трактат о связи времен, космосе и несокрушимом человеческом духе.',
			'bio.feature.cta' => 'ИССЛЕДОВАТЬ КОЛЛЕКЦИЮ',
			'bio.feature.worksValue' => '500+',
			'bio.feature.worksLabel' => 'Работ искусства по всему миру',
			'bio.feature.panelsValue' => '6+',
			'bio.feature.panelsLabel' => 'Монументальные панно в Минске',
			'bio.feature.guinnessValue' => '',
			'bio.feature.guinnessLabel' => 'Рекорд Гиннесса в искусстве',
			'bio.feature.unGiftValue' => '',
			'bio.feature.unGiftLabel' => 'Подарок ООН от Республики Беларусь',
			'bio.universalRealism.title' => 'Родоначальник «Вселенского реализма»',
			'bio.universalRealism.body' => 'Кищенко не просто отображал действительность — он создавал новую систему координат, которую назвал Вселенским реализмом. В основе его метода лежит убеждение, что художник — это «ткач времени», обязанный соединять прошлое и будущее. Его искусство вышло за рамки национальных границ, оперируя категориями глобальной человеческой драмы. Для Кищенко человек — это полубог, чьи поступки резонируют в масштабах Вселенной. В его работах тени становятся самостоятельными формами, а цвет — «космической музыкой», подчиненной строгому высшему порядку.',
			'bio.tapestry.title' => '«Гобелен века»: Вершина мирового ткачества',
			'bio.tapestry.intro' => 'Александр Кищенко вошел в историю как автор самого большого гобелена в мире, официально внесенного в Книгу рекордов Гиннесса.',
			'bio.tapestry.scaleLabel' => 'Масштаб',
			'bio.tapestry.scale' => 'Полотно размером 19 × 14 метров (около 300 кв. м), весом более тонны.',
			'bio.tapestry.conceptLabel' => 'Замысел',
			'bio.tapestry.concept' => 'Грандиозная ткань истории, где переплетены судьбы 80 знаковых личностей (от Христа и Мадонны до Черчилля, Кастро и Горбачева).',
			'bio.tapestry.meaningLabel' => 'Смысл',
			'bio.tapestry.meaning' => 'Это произведение-храм, в центре которого разворачивается вечный конфликт между созиданием и разрушением. Работа была признана национальным достоянием Беларуси.',
			'bio.chernobyl.title' => '«Чернобыль»: Голос нации в стенах ООН',
			'bio.chernobyl.body' => 'Одним из самых эмоционально сильных произведений мастера стал гобелен «Чернобыль» (1991). Переданный в дар Организации Объединенных Наций, он и сегодня украшает штаб-квартиру ООН в Нью-Йорке. Когда мир увидел это полотно, Генеральный секретарь ООН Перес де Куэльяр сравнил его с «Герникой» Пикассо. Для Кищенко этот гобелен был не просто памятью о трагедии, а «глазами Беларуси» — планетарным предупреждением о хрупкости жизни, вытканным руками великих белорусских мастериц.',
			'bio.mosaic.title' => 'Лицо города: Мозаичные панно «Восток»',
			'bio.mosaic.intro' => 'Кищенко сформировал визуальный код современного Минска. Его знаменитые мозаики на жилых высотках в микрорайоне Восток-1 стали визитной карточкой столицы.',
			'bio.mosaic.panelsLabel' => 'Четыре монументальных полотна',
			'bio.mosaic.panels' => '«Город-воин», «Город науки», «Город культуры» и «Город-строитель».',
			'bio.mosaic.panelsMeaning' => 'Эти работы превратили типовую застройку в художественное пространство, где через смальту и камень воспевается триумф человеческого духа.',
			'bio.legacy.title' => 'Наследие',
			'bio.legacy.body' => 'Александр Кищенко оставил после себя не только полотна, хранящиеся в Третьяковской галерее и частных коллекциях мировых лидеров (Б. Клинтона, Ф. Миттерана), но и целую школу белорусского монументального гобелена. Его имя носит Борисовский комбинат декоративно-прикладного искусства, где создавались его великие шпалеры.',
			'bio.quote' => 'Искусство – это божественное явление. Только ему дано остановить время. Искусство может разгадать Тайну будущего, А также восстановить Потерянное прошлое.',
			'bio.quoteAuthor' => '— Александр Кищенко',
			'bio.wikipediaLinkLabel' => 'ЧИТАТЬ В ВИКИПЕДИИ',
			'contacts.title' => 'Контакты',
			'contacts.tagline' => 'Свяжитесь со студией.',
			'contacts.phoneSectionLabel' => 'Телефон',
			'contacts.phoneSectionHint' => 'Звонки и WhatsApp',
			'contacts.instagramSectionLabel' => 'Instagram',
			'contacts.instagramHandle' => '@kishchenko.art',
			'contacts.vkSectionLabel' => 'ВКонтакте',
			'contacts.vkHandle' => 'aleksandrkishchenko',
			'contacts.vkScanQrHint' => 'Отсканируйте QR, чтобы открыть страницу ВКонтакте',
			'contacts.studioSectionTitle' => 'Мастерская автора',
			'contacts.studioAddress' => 'Минск, ул. Сурганова, 44 — 7 этаж',
			'contacts.openInOsm' => 'ОТКРЫТЬ В OPENSTREETMAP',
			'contacts.mapAttribution' => '© OpenStreetMap contributors',
			'seo.aboutAuthor.title' => 'Александр Кищенко — народный художник Беларуси | КИЩЕНКО-АРТ',
			'seo.aboutAuthor.description' => 'Александр Михайлович Кищенко (1933–1997) — народный художник Республики Беларусь, живописец и монументалист. Автор самого большого гобелена в мире и «Чернобыля» в штаб-квартире ООН.',
			'seo.aboutAuthor.keywords' => 'Александр Кищенко, биография, белорусский художник, монументалист, гобелен',
			'seo.catalog.title' => 'Каталог работ Александра Кищенко | КИЩЕНКО-АРТ',
			'seo.catalog.description' => 'Каталог живописи и гобеленов Александра Кищенко: портреты, пейзажи, философские полотна 1958–1997 годов.',
			'seo.catalog.keywords' => 'каталог работ Кищенко, живопись, гобелены, купить картину Кищенко',
			'seo.news.title' => 'Новости и выставки | КИЩЕНКО-АРТ',
			'seo.news.description' => 'Новости, выставки и события, связанные с наследием Александра Кищенко и галереей КИЩЕНКО-АРТ.',
			'seo.news.keywords' => 'выставки Кищенко, новости галереи, события',
			'seo.films.title' => 'Документальные фильмы об А. Кищенко | КИЩЕНКО-АРТ',
			'seo.films.description' => 'Документальные фильмы и видеоматериалы об Александре Кищенко, его творчестве и монументальных произведениях.',
			'seo.films.keywords' => 'фильм о Кищенко, документальный фильм, гобелен века, видео',
			'seo.archive.title' => 'Архив публикаций | КИЩЕНКО-АРТ',
			'seo.archive.description' => 'Архив публикаций и материалов о творчестве и выставках Александра Михайловича Кищенко.',
			'seo.archive.keywords' => 'архив Кищенко, публикации, статьи, пресса',
			'seo.contacts.title' => 'Контакты | КИЩЕНКО-АРТ',
			'seo.contacts.description' => 'Контакты галереи КИЩЕНКО-АРТ: мастерская в Минске, телефон, Instagram и ВКонтакте.',
			'seo.contacts.keywords' => 'контакты галереи Кищенко, мастерская Минск, купить картину',
			_ => null,
		};
	}
}
