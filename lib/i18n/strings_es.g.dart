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
class TranslationsEs extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppEs app = _TranslationsAppEs._(_root);
	@override late final _TranslationsNavigationEs navigation = _TranslationsNavigationEs._(_root);
	@override late final _TranslationsCatalogEs catalog = _TranslationsCatalogEs._(_root);
	@override late final _TranslationsCommonEs common = _TranslationsCommonEs._(_root);
	@override late final _TranslationsLanguageEs language = _TranslationsLanguageEs._(_root);
}

// Path: app
class _TranslationsAppEs extends TranslationsAppRu {
	_TranslationsAppEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Galeria de Arte';
}

// Path: navigation
class _TranslationsNavigationEs extends TranslationsNavigationRu {
	_TranslationsNavigationEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get aboutAuthor => 'Sobre el autor';
	@override String get news => 'Noticias';
	@override String get catalogOfWorks => 'Catalogo de obras';
	@override String get archive => 'Archivo';
	@override String get contacts => 'Contactos';
}

// Path: catalog
class _TranslationsCatalogEs extends TranslationsCatalogRu {
	_TranslationsCatalogEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get workPrefix => 'Obra';
	@override late final _TranslationsCatalogPaintingNamesEs paintingNames = _TranslationsCatalogPaintingNamesEs._(_root);
}

// Path: common
class _TranslationsCommonEs extends TranslationsCommonRu {
	_TranslationsCommonEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get pageNotFound => 'Pagina no encontrada';
}

// Path: language
class _TranslationsLanguageEs extends TranslationsLanguageRu {
	_TranslationsLanguageEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'Idioma';
	@override String get russian => 'Ruso';
	@override String get english => 'Ingles';
	@override String get spanish => 'Espanol';
	@override String get french => 'Frances';
	@override String get german => 'Aleman';
}

// Path: catalog.paintingNames
class _TranslationsCatalogPaintingNamesEs extends TranslationsCatalogPaintingNamesRu {
	_TranslationsCatalogPaintingNamesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get id1958_1 => 'Afueras. Viejo molino';
	@override String get id1958_2 => 'Angelina';
	@override String get id1958_3 => 'El tocador';
	@override String get id1959_1 => 'Retrato de mujer';
	@override String get id1960_1 => 'Composición №1';
	@override String get id1960_2 => 'Retrato de mujer en tonos verdes';
	@override String get id1960_3 => 'Primera nieve';
	@override String get id1960_4 => 'Mujer en el sillón';
	@override String get id1960_5 => 'Retrato del pintor Vladimir Urischenko';
	@override String get id1960_6 => 'Niña con lazo';
	@override String get id1960_7 => 'Retrato de mujer';
	@override String get id1960_8 => 'Retrato de mujer';
	@override String get id1960_9 => 'La espera';
	@override String get id1962_1 => 'Norteña (Mujer del norte)';
	@override String get id1965_1 => 'Retrato de mujer';
	@override String get id1965_2 => 'Niño de circo';
	@override String get id1965_3 => 'Tentación';
	@override String get id1967_1 => 'Zoya Litvinova';
	@override String get id1967_2 => 'Dos vidas';
	@override String get id1968_1 => 'Naturaleza muerta con peras';
	@override String get id1969_1 => 'Ángel';
	@override String get id1970_1 => 'La maestra';
	@override String get id1970_2 => 'El último de Sebastopol';
	@override String get id1972_1 => 'Retrato de Zhenya Musinskaya';
	@override String get id1974_1 => 'Joven con traje ruso';
	@override String get id1975_1 => 'Primogénito';
	@override String get id1976_1 => 'Joven de rojo con oro (Uvas verdes)';
	@override String get id1979_1 => 'Madre con hijo';
	@override String get id1979_2 => 'Natasha';
	@override String get id1979_3 => 'Asesinato de la familia Gromov. Acción 1943. Tamán.';
	@override String get id1979_4 => 'Boceto para la obra "El dolor del poeta"';
	@override String get id1979_5 => 'Alegría. Maternidad';
	@override String get id1980_1 => 'Fragmento para el cuadro "Miel"';
	@override String get id1980_2 => 'Retrato de mamá';
	@override String get id1980_3 => 'Nina';
	@override String get id1980_4 => 'Natasha Marchenko';
	@override String get id1980_5 => 'Natasha';
	@override String get id1981_1 => 'Reflexión';
	@override String get id1981_2 => 'Retrato de Elena Obraztsova';
	@override String get id1982_1 => 'Autorretrato';
	@override String get id1982_2 => 'Adán y Eva';
	@override String get id1982_3 => 'Profanación del templo';
	@override String get id1982_4 => 'Oscurantistas';
	@override String get id1982_5 => 'Girasoles';
	@override String get id1982_6 => 'Paisaje';
	@override String get id1983_1 => 'Madonna';
	@override String get id1983_2 => 'Conspiración (Juramento de los masones)';
	@override String get id1983_3 => 'Nina';
	@override String get id1983_4 => 'Retrato de Maria Bieshu';
	@override String get id1983_5 => 'La llamada del mar';
	@override String get id1983_6 => 'Llanto';
	@override String get id1983_7 => 'Natasha';
	@override String get id1984_1 => 'Nina';
	@override String get id1984_2 => 'Nina';
	@override String get id1985_1 => 'Tío Vania';
	@override String get id1985_2 => 'Niña con sombrero rojo';
	@override String get id1985_3 => 'Imagen femenina. Natasha Tatarenko';
	@override String get id1985_4 => 'Retrato de hombre';
	@override String get id1985_5 => 'Ducha de verano';
	@override String get id1986_1 => 'Retrato de niña';
	@override String get id1986_2 => 'Retrato del director de fotografía A. Abadovsky';
	@override String get id1986_3 => 'Últimos días de septiembre';
	@override String get id1986_4 => 'Retrato de Bushchik';
	@override String get id1986_5 => 'Retrato de Natasha Marchenko';
	@override String get id1987_1 => 'Él vivirá. Chernóbil';
	@override String get id1987_2 => 'Retrato de mujer';
	@override String get id1988_1 => 'Retrato de Masha';
	@override String get id1988_2 => 'Cabeza de hombre';
	@override String get id1988_3 => 'Perfil';
	@override String get id1988_4 => 'La caminante';
	@override String get id1989_1 => 'A orillas del Don';
	@override String get id1989_2 => 'Mañana';
	@override String get id1989_3 => 'Retrato de la pintora Tamara Kirshchina';
	@override String get id1989_4 => 'Desnudo en el espacio música';
	@override String get id1989_5 => 'La caminante (Universo)';
	@override String get id1989_6 => 'Nina';
	@override String get id1989_7 => 'Los hermanos Elkin';
	@override String get id1989_8 => 'Nina';
	@override String get id1989_9 => 'Desnudo';
	@override String get id1990_1 => 'En el espacio (Desnudo)';
	@override String get id1990_2 => 'Dones de los planetas';
	@override String get id1990_3 => 'Zoya';
	@override String get id1990_4 => 'Retrato de hombre';
	@override String get id1990_5 => 'En el balcón';
	@override String get id1991_1 => 'Niña con miel (Universo)';
	@override String get id1991_2 => 'Sueño';
	@override String get id1991_3 => 'Eterna';
	@override String get id1992_1 => 'Retrato con concha marina';
	@override String get id1992_2 => 'Sátiro y Ninfa';
	@override String get id1992_3 => 'Niño con gallo';
	@override String get id1992_4 => 'Nina y Maxim';
	@override String get id1992_5 => 'Campesino ruso';
	@override String get id1992_6 => 'Retrato de Franz Koch';
	@override String get id1992_7 => 'Nina';
	@override String get id1992_8 => 'Olga';
	@override String get id1992_9 => '¡No hagas travesuras, Maxim!';
	@override String get id1992_10 => 'Tapiz "Girasoles"';
	@override String get id1993_1 => 'Lo eterno';
	@override String get id1993_2 => 'Retrato de la escultora Lena Kharaberyush';
	@override String get id1993_3 => 'El boticario';
	@override String get id1993_4 => 'Olya';
	@override String get id1993_5 => 'Madre e hijo';
	@override String get id1993_6 => 'Cristo';
	@override String get id1993_7 => 'Natasha';
	@override String get id1993_8 => 'Retrato de desconocida';
	@override String get id1993_9 => 'Roman';
	@override String get id1994_1 => 'Bajo la constelación de Leo';
	@override String get id1994_2 => 'Retrato de Zoya';
	@override String get id1994_3 => 'Patio abandonado';
	@override String get id1994_4 => 'Natasha';
	@override String get id1994_5 => 'Canción';
	@override String get id1994_6 => 'Niña con naturaleza muerta de manzanas';
	@override String get id1994_7 => 'La que grita';
	@override String get id1994_8 => 'Natasha';
	@override String get id1994_9 => 'Bacanales';
	@override String get id1995_1 => 'Pequeño soñador';
	@override String get id1995_2 => 'Mi Patria';
	@override String get id1995_3 => 'Desnudo (Nu)';
	@override String get id1995_4 => 'Olga Koltakova';
	@override String get id1995_5 => 'Tamara Kirshchina de espaldas';
	@override String get id1995_6 => 'Olya';
	@override String get id1995_7 => 'Tristeza';
	@override String get id1995_8 => 'Retrato de niña';
	@override String get id1995_9 => 'Universo';
	@override String get id1995_10 => 'Lesha';
	@override String get id1995_11 => 'Retrato de Rostikov';
	@override String get id1995_12 => 'Crítica de arte Nadya';
	@override String get id1995_13 => 'Melodía';
	@override String get id1995_14 => 'Tanya';
	@override String get id1995_15 => 'Boceto del cuadro «Retrato de Nina»';
	@override String get id1995_16 => 'Naturaleza muerta';
	@override String get id1995_17 => 'Tapiz "Mar" ("Ola")';
	@override String get id1996_1 => 'Naturaleza muerta con manzanas';
	@override String get id1996_2 => 'Desnudo';
	@override String get id1996_3 => 'Maxim con sandía';
	@override String get id1996_4 => 'Himno (Éxtasis)';
	@override String get id1996_5 => 'Nina';
	@override String get id1996_6 => 'Inna';
	@override String get id1996_7 => 'Alla Astajovich';
	@override String get id1996_8 => 'Lena';
	@override String get id1996_9 => 'Retrato de mujer (Nina №1)';
	@override String get id1996_10 => 'Universo';
	@override String get id1996_11 => 'Navegando en un bote';
	@override String get id1996_12 => 'Retrato de mujer con chal';
	@override String get id1996_13 => 'Mamá';
	@override String get id1996_14 => 'Filareto de Minsk';
	@override String get id1996_15 => 'Naturaleza muerta en el espacio';
	@override String get id1996_16 => 'Retrato de Kuchinsky';
	@override String get id1996_17 => 'Retrato de mujer';
	@override String get id1996_18 => 'Mi Universo';
	@override String get id1997_1 => 'Iván';
	@override String get id1997_2 => 'Retrato del arquitecto Vladimir Salazkin';
	@override String get id1997_3 => 'La guerra de los mundos (última obra)';
	@override String get id1997_4 => 'Autorretrato';
	@override String get id1997_5 => 'Verano en Boguchar';
	@override String get id1997_6 => 'Dos viudas';
	@override String get idunknown_1 => 'Crecida';
	@override String get idunknown_2 => 'Retrato de mujer';
	@override String get idunknown_3 => 'Espinas azules';
	@override String get idunknown_4 => 'Nina';
	@override String get idunknown_5 => 'Nina';
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'Galeria de Arte',
			'navigation.aboutAuthor' => 'Sobre el autor',
			'navigation.news' => 'Noticias',
			'navigation.catalogOfWorks' => 'Catalogo de obras',
			'navigation.archive' => 'Archivo',
			'navigation.contacts' => 'Contactos',
			'catalog.workPrefix' => 'Obra',
			'catalog.paintingNames.id1958_1' => 'Afueras. Viejo molino',
			'catalog.paintingNames.id1958_2' => 'Angelina',
			'catalog.paintingNames.id1958_3' => 'El tocador',
			'catalog.paintingNames.id1959_1' => 'Retrato de mujer',
			'catalog.paintingNames.id1960_1' => 'Composición №1',
			'catalog.paintingNames.id1960_2' => 'Retrato de mujer en tonos verdes',
			'catalog.paintingNames.id1960_3' => 'Primera nieve',
			'catalog.paintingNames.id1960_4' => 'Mujer en el sillón',
			'catalog.paintingNames.id1960_5' => 'Retrato del pintor Vladimir Urischenko',
			'catalog.paintingNames.id1960_6' => 'Niña con lazo',
			'catalog.paintingNames.id1960_7' => 'Retrato de mujer',
			'catalog.paintingNames.id1960_8' => 'Retrato de mujer',
			'catalog.paintingNames.id1960_9' => 'La espera',
			'catalog.paintingNames.id1962_1' => 'Norteña (Mujer del norte)',
			'catalog.paintingNames.id1965_1' => 'Retrato de mujer',
			'catalog.paintingNames.id1965_2' => 'Niño de circo',
			'catalog.paintingNames.id1965_3' => 'Tentación',
			'catalog.paintingNames.id1967_1' => 'Zoya Litvinova',
			'catalog.paintingNames.id1967_2' => 'Dos vidas',
			'catalog.paintingNames.id1968_1' => 'Naturaleza muerta con peras',
			'catalog.paintingNames.id1969_1' => 'Ángel',
			'catalog.paintingNames.id1970_1' => 'La maestra',
			'catalog.paintingNames.id1970_2' => 'El último de Sebastopol',
			'catalog.paintingNames.id1972_1' => 'Retrato de Zhenya Musinskaya',
			'catalog.paintingNames.id1974_1' => 'Joven con traje ruso',
			'catalog.paintingNames.id1975_1' => 'Primogénito',
			'catalog.paintingNames.id1976_1' => 'Joven de rojo con oro (Uvas verdes)',
			'catalog.paintingNames.id1979_1' => 'Madre con hijo',
			'catalog.paintingNames.id1979_2' => 'Natasha',
			'catalog.paintingNames.id1979_3' => 'Asesinato de la familia Gromov. Acción 1943. Tamán.',
			'catalog.paintingNames.id1979_4' => 'Boceto para la obra "El dolor del poeta"',
			'catalog.paintingNames.id1979_5' => 'Alegría. Maternidad',
			'catalog.paintingNames.id1980_1' => 'Fragmento para el cuadro "Miel"',
			'catalog.paintingNames.id1980_2' => 'Retrato de mamá',
			'catalog.paintingNames.id1980_3' => 'Nina',
			'catalog.paintingNames.id1980_4' => 'Natasha Marchenko',
			'catalog.paintingNames.id1980_5' => 'Natasha',
			'catalog.paintingNames.id1981_1' => 'Reflexión',
			'catalog.paintingNames.id1981_2' => 'Retrato de Elena Obraztsova',
			'catalog.paintingNames.id1982_1' => 'Autorretrato',
			'catalog.paintingNames.id1982_2' => 'Adán y Eva',
			'catalog.paintingNames.id1982_3' => 'Profanación del templo',
			'catalog.paintingNames.id1982_4' => 'Oscurantistas',
			'catalog.paintingNames.id1982_5' => 'Girasoles',
			'catalog.paintingNames.id1982_6' => 'Paisaje',
			'catalog.paintingNames.id1983_1' => 'Madonna',
			'catalog.paintingNames.id1983_2' => 'Conspiración (Juramento de los masones)',
			'catalog.paintingNames.id1983_3' => 'Nina',
			'catalog.paintingNames.id1983_4' => 'Retrato de Maria Bieshu',
			'catalog.paintingNames.id1983_5' => 'La llamada del mar',
			'catalog.paintingNames.id1983_6' => 'Llanto',
			'catalog.paintingNames.id1983_7' => 'Natasha',
			'catalog.paintingNames.id1984_1' => 'Nina',
			'catalog.paintingNames.id1984_2' => 'Nina',
			'catalog.paintingNames.id1985_1' => 'Tío Vania',
			'catalog.paintingNames.id1985_2' => 'Niña con sombrero rojo',
			'catalog.paintingNames.id1985_3' => 'Imagen femenina. Natasha Tatarenko',
			'catalog.paintingNames.id1985_4' => 'Retrato de hombre',
			'catalog.paintingNames.id1985_5' => 'Ducha de verano',
			'catalog.paintingNames.id1986_1' => 'Retrato de niña',
			'catalog.paintingNames.id1986_2' => 'Retrato del director de fotografía A. Abadovsky',
			'catalog.paintingNames.id1986_3' => 'Últimos días de septiembre',
			'catalog.paintingNames.id1986_4' => 'Retrato de Bushchik',
			'catalog.paintingNames.id1986_5' => 'Retrato de Natasha Marchenko',
			'catalog.paintingNames.id1987_1' => 'Él vivirá. Chernóbil',
			'catalog.paintingNames.id1987_2' => 'Retrato de mujer',
			'catalog.paintingNames.id1988_1' => 'Retrato de Masha',
			'catalog.paintingNames.id1988_2' => 'Cabeza de hombre',
			'catalog.paintingNames.id1988_3' => 'Perfil',
			'catalog.paintingNames.id1988_4' => 'La caminante',
			'catalog.paintingNames.id1989_1' => 'A orillas del Don',
			'catalog.paintingNames.id1989_2' => 'Mañana',
			'catalog.paintingNames.id1989_3' => 'Retrato de la pintora Tamara Kirshchina',
			'catalog.paintingNames.id1989_4' => 'Desnudo en el espacio música',
			'catalog.paintingNames.id1989_5' => 'La caminante (Universo)',
			'catalog.paintingNames.id1989_6' => 'Nina',
			'catalog.paintingNames.id1989_7' => 'Los hermanos Elkin',
			'catalog.paintingNames.id1989_8' => 'Nina',
			'catalog.paintingNames.id1989_9' => 'Desnudo',
			'catalog.paintingNames.id1990_1' => 'En el espacio (Desnudo)',
			'catalog.paintingNames.id1990_2' => 'Dones de los planetas',
			'catalog.paintingNames.id1990_3' => 'Zoya',
			'catalog.paintingNames.id1990_4' => 'Retrato de hombre',
			'catalog.paintingNames.id1990_5' => 'En el balcón',
			'catalog.paintingNames.id1991_1' => 'Niña con miel (Universo)',
			'catalog.paintingNames.id1991_2' => 'Sueño',
			'catalog.paintingNames.id1991_3' => 'Eterna',
			'catalog.paintingNames.id1992_1' => 'Retrato con concha marina',
			'catalog.paintingNames.id1992_2' => 'Sátiro y Ninfa',
			'catalog.paintingNames.id1992_3' => 'Niño con gallo',
			'catalog.paintingNames.id1992_4' => 'Nina y Maxim',
			'catalog.paintingNames.id1992_5' => 'Campesino ruso',
			'catalog.paintingNames.id1992_6' => 'Retrato de Franz Koch',
			'catalog.paintingNames.id1992_7' => 'Nina',
			'catalog.paintingNames.id1992_8' => 'Olga',
			'catalog.paintingNames.id1992_9' => '¡No hagas travesuras, Maxim!',
			'catalog.paintingNames.id1992_10' => 'Tapiz "Girasoles"',
			'catalog.paintingNames.id1993_1' => 'Lo eterno',
			'catalog.paintingNames.id1993_2' => 'Retrato de la escultora Lena Kharaberyush',
			'catalog.paintingNames.id1993_3' => 'El boticario',
			'catalog.paintingNames.id1993_4' => 'Olya',
			'catalog.paintingNames.id1993_5' => 'Madre e hijo',
			'catalog.paintingNames.id1993_6' => 'Cristo',
			'catalog.paintingNames.id1993_7' => 'Natasha',
			'catalog.paintingNames.id1993_8' => 'Retrato de desconocida',
			'catalog.paintingNames.id1993_9' => 'Roman',
			'catalog.paintingNames.id1994_1' => 'Bajo la constelación de Leo',
			'catalog.paintingNames.id1994_2' => 'Retrato de Zoya',
			'catalog.paintingNames.id1994_3' => 'Patio abandonado',
			'catalog.paintingNames.id1994_4' => 'Natasha',
			'catalog.paintingNames.id1994_5' => 'Canción',
			'catalog.paintingNames.id1994_6' => 'Niña con naturaleza muerta de manzanas',
			'catalog.paintingNames.id1994_7' => 'La que grita',
			'catalog.paintingNames.id1994_8' => 'Natasha',
			'catalog.paintingNames.id1994_9' => 'Bacanales',
			'catalog.paintingNames.id1995_1' => 'Pequeño soñador',
			'catalog.paintingNames.id1995_2' => 'Mi Patria',
			'catalog.paintingNames.id1995_3' => 'Desnudo (Nu)',
			'catalog.paintingNames.id1995_4' => 'Olga Koltakova',
			'catalog.paintingNames.id1995_5' => 'Tamara Kirshchina de espaldas',
			'catalog.paintingNames.id1995_6' => 'Olya',
			'catalog.paintingNames.id1995_7' => 'Tristeza',
			'catalog.paintingNames.id1995_8' => 'Retrato de niña',
			'catalog.paintingNames.id1995_9' => 'Universo',
			'catalog.paintingNames.id1995_10' => 'Lesha',
			'catalog.paintingNames.id1995_11' => 'Retrato de Rostikov',
			'catalog.paintingNames.id1995_12' => 'Crítica de arte Nadya',
			'catalog.paintingNames.id1995_13' => 'Melodía',
			'catalog.paintingNames.id1995_14' => 'Tanya',
			'catalog.paintingNames.id1995_15' => 'Boceto del cuadro «Retrato de Nina»',
			'catalog.paintingNames.id1995_16' => 'Naturaleza muerta',
			'catalog.paintingNames.id1995_17' => 'Tapiz "Mar" ("Ola")',
			'catalog.paintingNames.id1996_1' => 'Naturaleza muerta con manzanas',
			'catalog.paintingNames.id1996_2' => 'Desnudo',
			'catalog.paintingNames.id1996_3' => 'Maxim con sandía',
			'catalog.paintingNames.id1996_4' => 'Himno (Éxtasis)',
			'catalog.paintingNames.id1996_5' => 'Nina',
			'catalog.paintingNames.id1996_6' => 'Inna',
			'catalog.paintingNames.id1996_7' => 'Alla Astajovich',
			'catalog.paintingNames.id1996_8' => 'Lena',
			'catalog.paintingNames.id1996_9' => 'Retrato de mujer (Nina №1)',
			'catalog.paintingNames.id1996_10' => 'Universo',
			'catalog.paintingNames.id1996_11' => 'Navegando en un bote',
			'catalog.paintingNames.id1996_12' => 'Retrato de mujer con chal',
			'catalog.paintingNames.id1996_13' => 'Mamá',
			'catalog.paintingNames.id1996_14' => 'Filareto de Minsk',
			'catalog.paintingNames.id1996_15' => 'Naturaleza muerta en el espacio',
			'catalog.paintingNames.id1996_16' => 'Retrato de Kuchinsky',
			'catalog.paintingNames.id1996_17' => 'Retrato de mujer',
			'catalog.paintingNames.id1996_18' => 'Mi Universo',
			'catalog.paintingNames.id1997_1' => 'Iván',
			'catalog.paintingNames.id1997_2' => 'Retrato del arquitecto Vladimir Salazkin',
			'catalog.paintingNames.id1997_3' => 'La guerra de los mundos (última obra)',
			'catalog.paintingNames.id1997_4' => 'Autorretrato',
			'catalog.paintingNames.id1997_5' => 'Verano en Boguchar',
			'catalog.paintingNames.id1997_6' => 'Dos viudas',
			'catalog.paintingNames.idunknown_1' => 'Crecida',
			'catalog.paintingNames.idunknown_2' => 'Retrato de mujer',
			'catalog.paintingNames.idunknown_3' => 'Espinas azules',
			'catalog.paintingNames.idunknown_4' => 'Nina',
			'catalog.paintingNames.idunknown_5' => 'Nina',
			'common.pageNotFound' => 'Pagina no encontrada',
			'language.label' => 'Idioma',
			'language.russian' => 'Ruso',
			'language.english' => 'Ingles',
			'language.spanish' => 'Espanol',
			'language.french' => 'Frances',
			'language.german' => 'Aleman',
			_ => null,
		};
	}
}
