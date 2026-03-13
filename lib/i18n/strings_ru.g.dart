///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsRu = Translations; // ignore: unused_element
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
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAppRu app = TranslationsAppRu.internal(_root);
	late final TranslationsNavigationRu navigation = TranslationsNavigationRu.internal(_root);
	late final TranslationsCatalogRu catalog = TranslationsCatalogRu.internal(_root);
	late final TranslationsCommonRu common = TranslationsCommonRu.internal(_root);
	late final TranslationsLanguageRu language = TranslationsLanguageRu.internal(_root);
}

// Path: app
class TranslationsAppRu {
	TranslationsAppRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Арт-галерея'
	String get title => 'Арт-галерея';
}

// Path: navigation
class TranslationsNavigationRu {
	TranslationsNavigationRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Об авторе'
	String get aboutAuthor => 'Об авторе';

	/// ru: 'Новости'
	String get news => 'Новости';

	/// ru: 'Каталог работ'
	String get catalogOfWorks => 'Каталог работ';

	/// ru: 'Архив'
	String get archive => 'Архив';

	/// ru: 'Контакты'
	String get contacts => 'Контакты';
}

// Path: catalog
class TranslationsCatalogRu {
	TranslationsCatalogRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Работа'
	String get workPrefix => 'Работа';

	late final TranslationsCatalogPaintingNamesRu paintingNames = TranslationsCatalogPaintingNamesRu.internal(_root);
}

// Path: common
class TranslationsCommonRu {
	TranslationsCommonRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Страница не найдена'
	String get pageNotFound => 'Страница не найдена';
}

// Path: language
class TranslationsLanguageRu {
	TranslationsLanguageRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Язык'
	String get label => 'Язык';

	/// ru: 'Русский'
	String get russian => 'Русский';

	/// ru: 'English'
	String get english => 'English';

	/// ru: 'Español'
	String get spanish => 'Español';

	/// ru: 'Français'
	String get french => 'Français';

	/// ru: 'Deutsch'
	String get german => 'Deutsch';
}

// Path: catalog.paintingNames
class TranslationsCatalogPaintingNamesRu {
	TranslationsCatalogPaintingNamesRu.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Окраина. Старая мельница'
	String get id1958_1 => 'Окраина. Старая мельница';

	/// ru: 'Ангелина'
	String get id1958_2 => 'Ангелина';

	/// ru: 'Туалет'
	String get id1958_3 => 'Туалет';

	/// ru: 'Женский портрет'
	String get id1959_1 => 'Женский портрет';

	/// ru: 'Композиция №1'
	String get id1960_1 => 'Композиция №1';

	/// ru: 'Женский портрет в зеленой гамме'
	String get id1960_2 => 'Женский портрет в зеленой гамме';

	/// ru: 'Первый снег'
	String get id1960_3 => 'Первый снег';

	/// ru: 'Женщина в кресле'
	String get id1960_4 => 'Женщина в кресле';

	/// ru: 'Портрет художника Владимира Урищенко'
	String get id1960_5 => 'Портрет художника Владимира Урищенко';

	/// ru: 'Девочка с бантом'
	String get id1960_6 => 'Девочка с бантом';

	/// ru: 'Женский портрет'
	String get id1960_7 => 'Женский портрет';

	/// ru: 'Женский портрет'
	String get id1960_8 => 'Женский портрет';

	/// ru: 'Ожидание'
	String get id1960_9 => 'Ожидание';

	/// ru: 'Северянка (Женщина с севера)'
	String get id1962_1 => 'Северянка (Женщина с севера)';

	/// ru: 'Женский портрет'
	String get id1965_1 => 'Женский портрет';

	/// ru: 'Цирковой мальчик'
	String get id1965_2 => 'Цирковой мальчик';

	/// ru: 'Искушение'
	String get id1965_3 => 'Искушение';

	/// ru: 'Зоя Литвинова'
	String get id1967_1 => 'Зоя Литвинова';

	/// ru: 'Две жизни'
	String get id1967_2 => 'Две жизни';

	/// ru: 'Натюрморт с грушами'
	String get id1968_1 => 'Натюрморт с грушами';

	/// ru: 'Ангел'
	String get id1969_1 => 'Ангел';

	/// ru: 'Учительница'
	String get id1970_1 => 'Учительница';

	/// ru: 'Последний севастополец'
	String get id1970_2 => 'Последний севастополец';

	/// ru: 'Портрет Жени Мусинской'
	String get id1972_1 => 'Портрет Жени Мусинской';

	/// ru: 'Девушка в русском костюме'
	String get id1974_1 => 'Девушка в русском костюме';

	/// ru: 'Первенец'
	String get id1975_1 => 'Первенец';

	/// ru: 'Девушка в красном с золотом (Зеленый виноград)'
	String get id1976_1 => 'Девушка в красном с золотом (Зеленый виноград)';

	/// ru: 'Мать с ребенком'
	String get id1979_1 => 'Мать с ребенком';

	/// ru: 'Наташа'
	String get id1979_2 => 'Наташа';

	/// ru: 'Убийство семьи Громовых. Действие 1943. Тамань.'
	String get id1979_3 => 'Убийство семьи Громовых. Действие 1943. Тамань.';

	/// ru: 'Эскиз к работе "Боль поэта"'
	String get id1979_4 => 'Эскиз к работе "Боль поэта"';

	/// ru: 'Радость. Материнство'
	String get id1979_5 => 'Радость. Материнство';

	/// ru: 'Фрагмент к картине "Мед"'
	String get id1980_1 => 'Фрагмент к картине "Мед"';

	/// ru: 'Портрет мамы'
	String get id1980_2 => 'Портрет мамы';

	/// ru: 'Нина'
	String get id1980_3 => 'Нина';

	/// ru: 'Наташа Марченко'
	String get id1980_4 => 'Наташа Марченко';

	/// ru: 'Наташа'
	String get id1980_5 => 'Наташа';

	/// ru: 'Раздумье'
	String get id1981_1 => 'Раздумье';

	/// ru: 'Портрет Елены Образцовой'
	String get id1981_2 => 'Портрет Елены Образцовой';

	/// ru: 'Автопортрет'
	String get id1982_1 => 'Автопортрет';

	/// ru: 'Адам и Ева'
	String get id1982_2 => 'Адам и Ева';

	/// ru: 'Осквернение храма'
	String get id1982_3 => 'Осквернение храма';

	/// ru: 'Мракобесы'
	String get id1982_4 => 'Мракобесы';

	/// ru: 'Подсолнухи'
	String get id1982_5 => 'Подсолнухи';

	/// ru: 'Пейзаж'
	String get id1982_6 => 'Пейзаж';

	/// ru: 'Мадонна'
	String get id1983_1 => 'Мадонна';

	/// ru: 'Заговор (Клятва масонов)'
	String get id1983_2 => 'Заговор (Клятва масонов)';

	/// ru: 'Нина'
	String get id1983_3 => 'Нина';

	/// ru: 'Портрет Марии Биешу'
	String get id1983_4 => 'Портрет Марии Биешу';

	/// ru: 'Зов моря'
	String get id1983_5 => 'Зов моря';

	/// ru: 'Плач'
	String get id1983_6 => 'Плач';

	/// ru: 'Наташа'
	String get id1983_7 => 'Наташа';

	/// ru: 'Нина'
	String get id1984_1 => 'Нина';

	/// ru: 'Нина'
	String get id1984_2 => 'Нина';

	/// ru: 'Дядя Ваня'
	String get id1985_1 => 'Дядя Ваня';

	/// ru: 'Девочка в красной шляпе'
	String get id1985_2 => 'Девочка в красной шляпе';

	/// ru: 'Женский образ. Наташа Татаренко'
	String get id1985_3 => 'Женский образ. Наташа Татаренко';

	/// ru: 'Мужской портрет'
	String get id1985_4 => 'Мужской портрет';

	/// ru: 'Летний душ'
	String get id1985_5 => 'Летний душ';

	/// ru: 'Портрет девочки'
	String get id1986_1 => 'Портрет девочки';

	/// ru: 'Портрет кинооператора А. Абадовского'
	String get id1986_2 => 'Портрет кинооператора А. Абадовского';

	/// ru: 'Последние дни сентября'
	String get id1986_3 => 'Последние дни сентября';

	/// ru: 'Портрет Бущика'
	String get id1986_4 => 'Портрет Бущика';

	/// ru: 'Портрет Наташи Марченко'
	String get id1986_5 => 'Портрет Наташи Марченко';

	/// ru: 'Он будет жить. Чернобыль'
	String get id1987_1 => 'Он будет жить. Чернобыль';

	/// ru: 'Женский портрет'
	String get id1987_2 => 'Женский портрет';

	/// ru: 'Портрет Маши'
	String get id1988_1 => 'Портрет Маши';

	/// ru: 'Мужская голова'
	String get id1988_2 => 'Мужская голова';

	/// ru: 'Профиль'
	String get id1988_3 => 'Профиль';

	/// ru: 'Идущая'
	String get id1988_4 => 'Идущая';

	/// ru: 'На берегу Дона'
	String get id1989_1 => 'На берегу Дона';

	/// ru: 'Утро'
	String get id1989_2 => 'Утро';

	/// ru: 'Портрет художницы Тамары Кирщиной'
	String get id1989_3 => 'Портрет художницы Тамары Кирщиной';

	/// ru: 'Обнаженная в пространстве музыка'
	String get id1989_4 => 'Обнаженная в пространстве музыка';

	/// ru: 'Идущая (Вселенная)'
	String get id1989_5 => 'Идущая (Вселенная)';

	/// ru: 'Нина'
	String get id1989_6 => 'Нина';

	/// ru: 'Брат и сестра Елькины'
	String get id1989_7 => 'Брат и сестра Елькины';

	/// ru: 'Нина'
	String get id1989_8 => 'Нина';

	/// ru: 'Обнаженная'
	String get id1989_9 => 'Обнаженная';

	/// ru: 'В пространстве (Обнаженная)'
	String get id1990_1 => 'В пространстве (Обнаженная)';

	/// ru: 'Дары планет'
	String get id1990_2 => 'Дары планет';

	/// ru: 'Зоя'
	String get id1990_3 => 'Зоя';

	/// ru: 'Мужской портрет'
	String get id1990_4 => 'Мужской портрет';

	/// ru: 'На балконе'
	String get id1990_5 => 'На балконе';

	/// ru: 'Девочка с медом (Вселенная)'
	String get id1991_1 => 'Девочка с медом (Вселенная)';

	/// ru: 'Мечта'
	String get id1991_2 => 'Мечта';

	/// ru: 'Вечная'
	String get id1991_3 => 'Вечная';

	/// ru: 'Портрет с морской раковиной'
	String get id1992_1 => 'Портрет с морской раковиной';

	/// ru: 'Сатир и Нимфа'
	String get id1992_2 => 'Сатир и Нимфа';

	/// ru: 'Мальчик с петухом'
	String get id1992_3 => 'Мальчик с петухом';

	/// ru: 'Нина и Максим'
	String get id1992_4 => 'Нина и Максим';

	/// ru: 'Русский мужик'
	String get id1992_5 => 'Русский мужик';

	/// ru: 'Портрет Франца Коха'
	String get id1992_6 => 'Портрет Франца Коха';

	/// ru: 'Нина'
	String get id1992_7 => 'Нина';

	/// ru: 'Ольга'
	String get id1992_8 => 'Ольга';

	/// ru: 'Не балуйся, Максим!'
	String get id1992_9 => 'Не балуйся, Максим!';

	/// ru: 'Гобелен "Подсолнухи"'
	String get id1992_10 => 'Гобелен "Подсолнухи"';

	/// ru: 'Вечное'
	String get id1993_1 => 'Вечное';

	/// ru: 'Портрет скульптура Лены Хараберюш'
	String get id1993_2 => 'Портрет скульптура Лены Хараберюш';

	/// ru: 'Аптекарь'
	String get id1993_3 => 'Аптекарь';

	/// ru: 'Оля'
	String get id1993_4 => 'Оля';

	/// ru: 'Мать и дитя'
	String get id1993_5 => 'Мать и дитя';

	/// ru: 'Христос'
	String get id1993_6 => 'Христос';

	/// ru: 'Наташа'
	String get id1993_7 => 'Наташа';

	/// ru: 'Портрет неизвестной'
	String get id1993_8 => 'Портрет неизвестной';

	/// ru: 'Роман'
	String get id1993_9 => 'Роман';

	/// ru: 'Под созвездием Льва'
	String get id1994_1 => 'Под созвездием Льва';

	/// ru: 'Портрет Зои'
	String get id1994_2 => 'Портрет Зои';

	/// ru: 'Заброшенный двор'
	String get id1994_3 => 'Заброшенный двор';

	/// ru: 'Наташа'
	String get id1994_4 => 'Наташа';

	/// ru: 'Песня'
	String get id1994_5 => 'Песня';

	/// ru: 'Девочка с натюрмортом с яблоками'
	String get id1994_6 => 'Девочка с натюрмортом с яблоками';

	/// ru: 'Кричащая'
	String get id1994_7 => 'Кричащая';

	/// ru: 'Наташа'
	String get id1994_8 => 'Наташа';

	/// ru: 'Вакханалья'
	String get id1994_9 => 'Вакханалья';

	/// ru: 'Маленький фантазер'
	String get id1995_1 => 'Маленький фантазер';

	/// ru: 'Моя Родина'
	String get id1995_2 => 'Моя Родина';

	/// ru: 'Ню'
	String get id1995_3 => 'Ню';

	/// ru: 'Ольга Колтакова'
	String get id1995_4 => 'Ольга Колтакова';

	/// ru: 'Тамара Кирщина со спины'
	String get id1995_5 => 'Тамара Кирщина со спины';

	/// ru: 'Оля'
	String get id1995_6 => 'Оля';

	/// ru: 'Печаль'
	String get id1995_7 => 'Печаль';

	/// ru: 'Портрет девочки'
	String get id1995_8 => 'Портрет девочки';

	/// ru: 'Вселенная'
	String get id1995_9 => 'Вселенная';

	/// ru: 'Леша'
	String get id1995_10 => 'Леша';

	/// ru: 'Портрет Ростикова'
	String get id1995_11 => 'Портрет Ростикова';

	/// ru: 'Искусствовед Надя'
	String get id1995_12 => 'Искусствовед Надя';

	/// ru: 'Мелодия'
	String get id1995_13 => 'Мелодия';

	/// ru: 'Таня'
	String get id1995_14 => 'Таня';

	/// ru: 'Эскиз картины «Портрет Нины»'
	String get id1995_15 => 'Эскиз картины «Портрет Нины»';

	/// ru: 'Натюрморт'
	String get id1995_16 => 'Натюрморт';

	/// ru: 'Гобелен "Море" ("Волна")'
	String get id1995_17 => 'Гобелен "Море" ("Волна")';

	/// ru: 'Натюрморт с яблоками'
	String get id1996_1 => 'Натюрморт с яблоками';

	/// ru: 'Обнаженная'
	String get id1996_2 => 'Обнаженная';

	/// ru: 'Максим с арбузом'
	String get id1996_3 => 'Максим с арбузом';

	/// ru: 'Гимн (Восторг)'
	String get id1996_4 => 'Гимн (Восторг)';

	/// ru: 'Нина'
	String get id1996_5 => 'Нина';

	/// ru: 'Инна'
	String get id1996_6 => 'Инна';

	/// ru: 'Алла Астахович'
	String get id1996_7 => 'Алла Астахович';

	/// ru: 'Лена'
	String get id1996_8 => 'Лена';

	/// ru: 'Женский портрет (Нина №1)'
	String get id1996_9 => 'Женский портрет (Нина №1)';

	/// ru: 'Вселен'
	String get id1996_10 => 'Вселен';

	/// ru: 'Плывущие в лодке'
	String get id1996_11 => 'Плывущие в лодке';

	/// ru: 'Женский портрет с шалью'
	String get id1996_12 => 'Женский портрет с шалью';

	/// ru: 'Мама'
	String get id1996_13 => 'Мама';

	/// ru: 'Филарет Минский'
	String get id1996_14 => 'Филарет Минский';

	/// ru: 'Натюрморт в пространстве'
	String get id1996_15 => 'Натюрморт в пространстве';

	/// ru: 'Портрет Кучинского'
	String get id1996_16 => 'Портрет Кучинского';

	/// ru: 'Женский портрет'
	String get id1996_17 => 'Женский портрет';

	/// ru: 'Моя Вселенная'
	String get id1996_18 => 'Моя Вселенная';

	/// ru: 'Иван'
	String get id1997_1 => 'Иван';

	/// ru: 'Портрет архитектора Владимира Салазкина'
	String get id1997_2 => 'Портрет архитектора Владимира Салазкина';

	/// ru: 'Война миров (последняя работа)'
	String get id1997_3 => 'Война миров (последняя работа)';

	/// ru: 'Автопортрет'
	String get id1997_4 => 'Автопортрет';

	/// ru: 'Лето в Богучаре'
	String get id1997_5 => 'Лето в Богучаре';

	/// ru: 'Две вдовы'
	String get id1997_6 => 'Две вдовы';

	/// ru: 'Разлив'
	String get idunknown_1 => 'Разлив';

	/// ru: 'Женский портрет'
	String get idunknown_2 => 'Женский портрет';

	/// ru: 'Голубые колючки'
	String get idunknown_3 => 'Голубые колючки';

	/// ru: 'Нина'
	String get idunknown_4 => 'Нина';

	/// ru: 'Нина'
	String get idunknown_5 => 'Нина';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'Арт-галерея',
			'navigation.aboutAuthor' => 'Об авторе',
			'navigation.news' => 'Новости',
			'navigation.catalogOfWorks' => 'Каталог работ',
			'navigation.archive' => 'Архив',
			'navigation.contacts' => 'Контакты',
			'catalog.workPrefix' => 'Работа',
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
			'common.pageNotFound' => 'Страница не найдена',
			'language.label' => 'Язык',
			'language.russian' => 'Русский',
			'language.english' => 'English',
			'language.spanish' => 'Español',
			'language.french' => 'Français',
			'language.german' => 'Deutsch',
			_ => null,
		};
	}
}
