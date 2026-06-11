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
	@override late final _Translations$app$es app = _Translations$app$es._(_root);
	@override late final _Translations$navigation$es navigation = _Translations$navigation$es._(_root);
	@override late final _Translations$catalog$es catalog = _Translations$catalog$es._(_root);
	@override late final _Translations$common$es common = _Translations$common$es._(_root);
	@override late final _Translations$tour$es tour = _Translations$tour$es._(_root);
	@override late final _Translations$language$es language = _Translations$language$es._(_root);
	@override late final _Translations$archiveFeed$es archiveFeed = _Translations$archiveFeed$es._(_root);
	@override late final _Translations$films$es films = _Translations$films$es._(_root);
	@override late final _Translations$newsFeed$es newsFeed = _Translations$newsFeed$es._(_root);
	@override late final _Translations$bio$es bio = _Translations$bio$es._(_root);
	@override late final _Translations$contacts$es contacts = _Translations$contacts$es._(_root);
	@override late final _Translations$seo$es seo = _Translations$seo$es._(_root);
}

// Path: app
class _Translations$app$es extends Translations$app$ru {
	_Translations$app$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'KISHCHANKA.ART';
	@override String get brandTagline => 'Colección de Bellas Artes';
	@override String get logoMark => 'KA';
}

// Path: navigation
class _Translations$navigation$es extends Translations$navigation$ru {
	_Translations$navigation$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get aboutAuthor => 'Sobre el autor';
	@override String get news => 'Noticias';
	@override String get catalogOfWorks => 'Catalogo de obras';
	@override String get films => 'Peliculas';
	@override String get archive => 'Archivo';
	@override String get contacts => 'Contactos';
}

// Path: catalog
class _Translations$catalog$es extends Translations$catalog$ru {
	_Translations$catalog$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get workPrefix => 'Obra';
	@override String get errorTitle => 'No se pudieron cargar las pinturas';
	@override String errorWithDetails({required Object message}) => 'No se pudieron cargar las pinturas. ${message}';
	@override late final _Translations$catalog$decade$es decade = _Translations$catalog$decade$es._(_root);
	@override late final _Translations$catalog$paintingNames$es paintingNames = _Translations$catalog$paintingNames$es._(_root);
	@override late final _Translations$catalog$paintingMediums$es paintingMediums = _Translations$catalog$paintingMediums$es._(_root);
}

// Path: common
class _Translations$common$es extends Translations$common$ru {
	_Translations$common$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get pageNotFound => 'Página no encontrada';
	@override String get viewCatalog => 'VER CATÁLOGO';
	@override String get learnMore => 'SABER MÁS';
	@override late final _Translations$common$video$es video = _Translations$common$video$es._(_root);
}

// Path: tour
class _Translations$tour$es extends Translations$tour$ru {
	_Translations$tour$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get next => 'Siguiente';
	@override String get gotIt => 'Entendido';
	@override String get back => 'Atrás';
	@override String get chernobylBody => 'El tapiz «Chernóbil» (1991), donado a las Naciones Unidas, sigue adornando su sede de Nueva York. El Secretario General de la ONU lo comparó con el «Guernica» de Picasso.';
}

// Path: language
class _Translations$language$es extends Translations$language$ru {
	_Translations$language$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'Idioma';
	@override String get russian => 'Ruso';
	@override String get english => 'Ingles';
	@override String get spanish => 'Espanol';
	@override String get french => 'Frances';
	@override String get german => 'Aleman';
	@override String get belarusian => 'Bielorruso';
}

// Path: archiveFeed
class _Translations$archiveFeed$es extends Translations$archiveFeed$ru {
	_Translations$archiveFeed$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Archivo y publicaciones';
	@override String get latestLabel => 'Publicacion mas reciente';
	@override String get moreLabel => 'Noticias y referencias';
	@override String get openArticle => 'Abrir articulo';
	@override String get sourceLabel => 'Fuente';
	@override String yearLabel({required Object year}) => '${year}';
	@override late final _Translations$archiveFeed$items$es items = _Translations$archiveFeed$items$es._(_root);
}

// Path: films
class _Translations$films$es extends Translations$films$ru {
	_Translations$films$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Peliculas y documentales';
	@override String get subtitle => 'Archivo audiovisual sobre A. Kishchenko';
	@override String get latestLabel => 'Pelicula destacada';
	@override String get sourceLabel => 'Fuente';
	@override String get instagramTitle => 'Instagram';
	@override String get instagramSubtitle => 'Videos cortos e historias';
	@override late final _Translations$films$watchOn$es watchOn = _Translations$films$watchOn$es._(_root);
	@override late final _Translations$films$items$es items = _Translations$films$items$es._(_root);
}

// Path: newsFeed
class _Translations$newsFeed$es extends Translations$newsFeed$ru {
	_Translations$newsFeed$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Noticias';
	@override String get subtitle => 'Publicaciones, exposiciones y eventos';
	@override String get emptyState => 'Aun no hay noticias. Vuelve pronto.';
	@override String get errorTitle => 'No se pudieron cargar las noticias';
	@override String get retry => 'Reintentar';
	@override String get back => 'Volver a las noticias';
	@override String get sourceLabel => 'Fuente';
	@override String get readTimeLabel => 'Tiempo de lectura';
	@override String readTimeValue({required Object minutes}) => '${minutes} min';
	@override String get viewsLabel => 'Vistas';
	@override String get publishedLabel => 'Publicado';
}

// Path: bio
class _Translations$bio$es extends Translations$bio$ru {
	_Translations$bio$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get heroTitle => 'ARTE DE ESCALA CÓSMICA';
	@override String get heroSubtitle => 'Un arte que borra las fronteras entre lo terrenal y lo eterno. Artista del Pueblo de la República de Bielorrusia, creador del tapiz más grande del mundo «El Tapiz del Siglo».';
	@override String get heroBrandName => 'Alexander Mikhailovich Kishchanka';
	@override String get name => 'Alexander Mikhailovich Kishchanka (1933–1997)';
	@override String get tagline => 'Pintor. Filósofo. Monumentalista. Fundador del Realismo Universal.';
	@override String get intro => 'Alexander Kishchanka es una figura de escala renacentista en el arte del siglo XX. Un hombre que logró transformar el suave hilo del tapiz en una poderosa declaración arquitectónica, y las paredes de las ciudades en libros abiertos de significados filosóficos. Su obra es un puente entre lo arcaico y el cosmos, entre el dolor de la tierra y la luz de galaxias lejanas.';
	@override late final _Translations$bio$feature$es feature = _Translations$bio$feature$es._(_root);
	@override late final _Translations$bio$universalRealism$es universalRealism = _Translations$bio$universalRealism$es._(_root);
	@override late final _Translations$bio$tapestry$es tapestry = _Translations$bio$tapestry$es._(_root);
	@override late final _Translations$bio$chernobyl$es chernobyl = _Translations$bio$chernobyl$es._(_root);
	@override late final _Translations$bio$mosaic$es mosaic = _Translations$bio$mosaic$es._(_root);
	@override late final _Translations$bio$legacy$es legacy = _Translations$bio$legacy$es._(_root);
	@override String get quote => 'El arte es un fenómeno divino. Sólo a él le es dado detener el tiempo. El arte puede descifrar el misterio del futuro y también restaurar el pasado perdido.';
	@override String get quoteAuthor => '— Alexander Kishchanka';
	@override String get wikipediaLinkLabel => 'LEER EN WIKIPEDIA';
}

// Path: contacts
class _Translations$contacts$es extends Translations$contacts$ru {
	_Translations$contacts$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Contactos';
	@override String get tagline => 'Póngase en contacto con el estudio.';
	@override String get phoneSectionLabel => 'Teléfono';
	@override String get phoneSectionHint => 'Llamadas y WhatsApp';
	@override String get instagramSectionLabel => 'Instagram';
	@override String get instagramHandle => '@kishchenko.art';
	@override String get vkSectionLabel => 'VK';
	@override String get vkHandle => 'aleksandrkishchenko';
	@override String get vkScanQrHint => 'Escanee el QR para abrir VK';
	@override String get studioSectionTitle => 'Taller del autor';
	@override String get studioAddress => 'Minsk, calle Surganova 44 — 7.ª planta';
	@override String get openInOsm => 'ABRIR EN OPENSTREETMAP';
	@override String get mapAttribution => '© Colaboradores de OpenStreetMap';
}

// Path: seo
class _Translations$seo$es extends Translations$seo$ru {
	_Translations$seo$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _Translations$seo$aboutAuthor$es aboutAuthor = _Translations$seo$aboutAuthor$es._(_root);
	@override late final _Translations$seo$catalog$es catalog = _Translations$seo$catalog$es._(_root);
	@override late final _Translations$seo$news$es news = _Translations$seo$news$es._(_root);
	@override late final _Translations$seo$films$es films = _Translations$seo$films$es._(_root);
	@override late final _Translations$seo$archive$es archive = _Translations$seo$archive$es._(_root);
	@override late final _Translations$seo$contacts$es contacts = _Translations$seo$contacts$es._(_root);
}

// Path: catalog.decade
class _Translations$catalog$decade$es extends Translations$catalog$decade$ru {
	_Translations$catalog$decade$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get all => 'Todas';
	@override String get sixties => 'Años 60';
	@override String get seventies => 'Años 70';
	@override String get eighties => 'Años 80';
	@override String get nineties => 'Años 90';
}

// Path: catalog.paintingNames
class _Translations$catalog$paintingNames$es extends Translations$catalog$paintingNames$ru {
	_Translations$catalog$paintingNames$es._(TranslationsEs root) : this._root = root, super.internal(root);

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

// Path: catalog.paintingMediums
class _Translations$catalog$paintingMediums$es extends Translations$catalog$paintingMediums$ru {
	_Translations$catalog$paintingMediums$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get canvasOil => 'Lienzo, óleo';
	@override String get hardboardOil => 'Tablero DM, óleo';
	@override String get cardboard => 'Cartón';
	@override String get woolLinenWeaving => 'Lana, lino, tejido';
}

// Path: common.video
class _Translations$common$video$es extends Translations$common$video$ru {
	_Translations$common$video$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get loadError => 'No se pudo cargar la transmisión de video';
	@override String get openExternally => 'Abrir externamente';
}

// Path: archiveFeed.items
class _Translations$archiveFeed$items$es extends Translations$archiveFeed$items$ru {
	_Translations$archiveFeed$items$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _Translations$archiveFeed$items$boguchar2026$es boguchar2026 = _Translations$archiveFeed$items$boguchar2026$es._(_root);
	@override late final _Translations$archiveFeed$items$priorbankChtobyChuvstvovat$es priorbankChtobyChuvstvovat = _Translations$archiveFeed$items$priorbankChtobyChuvstvovat$es._(_root);
	@override late final _Translations$archiveFeed$items$nitiSudby$es nitiSudby = _Translations$archiveFeed$items$nitiSudby$es._(_root);
	@override late final _Translations$archiveFeed$items$boguchar2024$es boguchar2024 = _Translations$archiveFeed$items$boguchar2024$es._(_root);
	@override late final _Translations$archiveFeed$items$belgazprombankKraskiPobedy$es belgazprombankKraskiPobedy = _Translations$archiveFeed$items$belgazprombankKraskiPobedy$es._(_root);
	@override late final _Translations$archiveFeed$items$nebaZiamlja$es nebaZiamlja = _Translations$archiveFeed$items$nebaZiamlja$es._(_root);
}

// Path: films.watchOn
class _Translations$films$watchOn$es extends Translations$films$watchOn$ru {
	_Translations$films$watchOn$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get youtube => 'Ver en YouTube';
	@override String get googleDrive => 'Ver en Google Drive';
	@override String get instagram => 'Abrir en Instagram';
}

// Path: films.items
class _Translations$films$items$es extends Translations$films$items$ru {
	_Translations$films$items$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _Translations$films$items$ispovedVremeni$es ispovedVremeni = _Translations$films$items$ispovedVremeni$es._(_root);
	@override late final _Translations$films$items$aleksandrKishchenko$es aleksandrKishchenko = _Translations$films$items$aleksandrKishchenko$es._(_root);
	@override late final _Translations$films$items$voronezhKramskoyExhibition$es voronezhKramskoyExhibition = _Translations$films$items$voronezhKramskoyExhibition$es._(_root);
	@override late final _Translations$films$items$mastersOfSovietArt1988$es mastersOfSovietArt1988 = _Translations$films$items$mastersOfSovietArt1988$es._(_root);
	@override late final _Translations$films$items$bogucharLecture$es bogucharLecture = _Translations$films$items$bogucharLecture$es._(_root);
	@override late final _Translations$films$items$culturalCodesTapestries$es culturalCodesTapestries = _Translations$films$items$culturalCodesTapestries$es._(_root);
	@override late final _Translations$films$items$tapestryOfCenturyMinsk$es tapestryOfCenturyMinsk = _Translations$films$items$tapestryOfCenturyMinsk$es._(_root);
	@override late final _Translations$films$items$chernobylTapestryFacts$es chernobylTapestryFacts = _Translations$films$items$chernobylTapestryFacts$es._(_root);
	@override late final _Translations$films$items$kishchenkoReel1$es kishchenkoReel1 = _Translations$films$items$kishchenkoReel1$es._(_root);
}

// Path: bio.feature
class _Translations$bio$feature$es extends Translations$bio$feature$ru {
	_Translations$bio$feature$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'LEGADO DE ESCALA MUNDIAL';
	@override String get body => 'Esta colección reúne obras de un maestro excepcional cuyo arte cambió para siempre la idea de la pintura monumental y del tapiz. Desde los grandiosos mosaicos que se convirtieron en el código visual de Minsk hasta el célebre Tapiz del Siglo y la obra Chernóbil, que adorna la sede de las Naciones Unidas en Nueva York. Cada obra de Kishchanka es un tratado filosófico sobre la conexión de los tiempos, el cosmos y el espíritu humano indestructible.';
	@override String get cta => 'EXPLORAR LA COLECCIÓN';
	@override String get worksValue => '500+';
	@override String get worksLabel => 'Obras de arte en todo el mundo';
	@override String get panelsValue => '6+';
	@override String get panelsLabel => 'Paneles monumentales en Minsk';
	@override String get guinnessValue => '1';
	@override String get guinnessLabel => 'Récord Guinness en el arte';
	@override String get unGiftValue => '';
	@override String get unGiftLabel => 'Un regalo a la ONU';
}

// Path: bio.universalRealism
class _Translations$bio$universalRealism$es extends Translations$bio$universalRealism$ru {
	_Translations$bio$universalRealism$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fundador del Realismo Universal';
	@override String get body => 'Kishchanka no sólo representaba la realidad — creaba un nuevo sistema de coordenadas, al que llamó Realismo Universal. La base de su método es la convicción de que el artista es un tejedor del tiempo, obligado a conectar el pasado y el futuro. Su arte trascendió las fronteras nacionales, operando en términos del drama humano global. Para Kishchanka, el hombre es un semidiós cuyos actos resuenan a escala universal. En sus obras, las sombras se convierten en formas independientes, y el color en música cósmica sujeta a un estricto orden superior.';
}

// Path: bio.tapestry
class _Translations$bio$tapestry$es extends Translations$bio$tapestry$ru {
	_Translations$bio$tapestry$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'El Tapiz del Siglo: La Cima del Arte Textil Mundial';
	@override String get intro => 'Alexander Kishchanka entró en la historia como el autor del tapiz más grande del mundo, registrado oficialmente en el Libro Guinness de los Récords.';
	@override String get scaleLabel => 'Dimensiones';
	@override String get scale => 'Un lienzo de 19 × 14 metros (aproximadamente 300 m²), con un peso superior a una tonelada.';
	@override String get conceptLabel => 'Concepto';
	@override String get concept => 'Una grandiosa trama de la historia, donde se entrelazan los destinos de 80 personalidades icónicas — desde Cristo y la Madonna hasta Churchill, Castro y Gorbachov.';
	@override String get meaningLabel => 'Significado';
	@override String get meaning => 'Esta obra es un templo, en cuyo centro se desarrolla el eterno conflicto entre la creación y la destrucción. Fue reconocida como patrimonio nacional de Bielorrusia.';
}

// Path: bio.chernobyl
class _Translations$bio$chernobyl$es extends Translations$bio$chernobyl$ru {
	_Translations$bio$chernobyl$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Chernóbil: La Voz de una Nación en las Salas de la ONU';
	@override String get body => 'Una de las obras más emocionalmente poderosas del maestro fue el tapiz Chernóbil (1991). Entregado como obsequio a las Naciones Unidas, hoy sigue adornando la sede de la ONU en Nueva York. Cuando el mundo vio esta obra, el Secretario General de la ONU Javier Pérez de Cuéllar la comparó con la Guernica de Picasso. Para Kishchanka, este tapiz no era sólo un memorial a la tragedia, sino los ojos de Bielorrusia — una advertencia planetaria sobre la fragilidad de la vida, tejida por las manos de grandes artesanas bielorrusas.';
}

// Path: bio.mosaic
class _Translations$bio$mosaic$es extends Translations$bio$mosaic$ru {
	_Translations$bio$mosaic$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'El Rostro de la Ciudad: Los Mosaicos Vostok';
	@override String get intro => 'Kishchanka formó el código visual del Minsk moderno. Sus famosos mosaicos en edificios de viviendas del distrito Vostok-1 se convirtieron en la tarjeta de visita de la capital.';
	@override String get panelsLabel => 'Cuatro obras monumentales';
	@override String get panels => 'Ciudad-guerrera, Ciudad de la Ciencia, Ciudad de la Cultura y Ciudad-constructora.';
	@override String get panelsMeaning => 'Estas obras transformaron la construcción estándar en un espacio artístico, donde a través del esmalte y la piedra se celebra el triunfo del espíritu humano.';
}

// Path: bio.legacy
class _Translations$bio$legacy$es extends Translations$bio$legacy$ru {
	_Translations$bio$legacy$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Legado';
	@override String get body => 'Alexander Kishchanka dejó tras de sí no sólo lienzos conservados en la Galería Tretiakov y colecciones privadas de líderes mundiales (B. Clinton, F. Mitterrand), sino toda una escuela del tapiz monumental bielorruso. El Combinado de Artes Decorativas y Aplicadas de Borisov, donde se crearon sus grandes tapices, lleva hoy su nombre.';
}

// Path: seo.aboutAuthor
class _Translations$seo$aboutAuthor$es extends Translations$seo$aboutAuthor$ru {
	_Translations$seo$aboutAuthor$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Alexander Kishchanka — Artista del Pueblo de Bielorrusia | KISHCHANKA.ART';
	@override String get description => 'Alexander Mijáilovich Kishchanka (1933–1997) — Artista del Pueblo de la República de Bielorrusia, pintor y monumentalista. Autor del tapiz más grande del mundo y del tapiz de Chernóbil en la ONU.';
	@override String get keywords => 'Alexander Kishchanka, biografía, artista bielorruso, monumentalista, tapiz';
}

// Path: seo.catalog
class _Translations$seo$catalog$es extends Translations$seo$catalog$ru {
	_Translations$seo$catalog$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Catálogo de obras de Alexander Kishchanka | KISHCHANKA.ART';
	@override String get description => 'Catálogo de pinturas y tapices de Alexander Kishchanka: retratos, paisajes y obras filosóficas de 1958–1997.';
	@override String get keywords => 'catálogo Kishchanka, pinturas, tapices, comprar arte Kishchanka';
}

// Path: seo.news
class _Translations$seo$news$es extends Translations$seo$news$ru {
	_Translations$seo$news$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Noticias y exposiciones | KISHCHANKA.ART';
	@override String get description => 'Noticias, exposiciones y eventos relacionados con el legado de Alexander Kishchanka y la galería KISHCHANKA.ART.';
	@override String get keywords => 'exposiciones Kishchanka, noticias de la galería, eventos';
}

// Path: seo.films
class _Translations$seo$films$es extends Translations$seo$films$ru {
	_Translations$seo$films$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Documentales sobre A. Kishchanka | KISHCHANKA.ART';
	@override String get description => 'Documentales y videos sobre Alexander Kishchanka, su arte y obras monumentales.';
	@override String get keywords => 'documental Kishchanka, película, Tapiz del Siglo, video';
}

// Path: seo.archive
class _Translations$seo$archive$es extends Translations$seo$archive$ru {
	_Translations$seo$archive$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Archivo y publicaciones | KISHCHANKA.ART';
	@override String get description => 'Archivo de publicaciones y materiales sobre el arte y las exposiciones de Alexander Kishchanka.';
	@override String get keywords => 'archivo Kishchanka, publicaciones, prensa, artículos';
}

// Path: seo.contacts
class _Translations$seo$contacts$es extends Translations$seo$contacts$ru {
	_Translations$seo$contacts$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Contacto | KISHCHANKA.ART';
	@override String get description => 'Contacte con la galería KISHCHANKA.ART: taller en Minsk, teléfono, Instagram y VK.';
	@override String get keywords => 'contacto galería Kishchanka, taller Minsk, comprar pintura';
}

// Path: archiveFeed.items.boguchar2026
class _Translations$archiveFeed$items$boguchar2026$es extends Translations$archiveFeed$items$boguchar2026$ru {
	_Translations$archiveFeed$items$boguchar2026$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Visita guiada «La historia de vida de M. A. Kishchenko»';
	@override String get excerpt => 'El 19 de febrero de 2026 el Museo de Boguchar acogio una visita guiada para los alumnos de la escuela de la aldea Diachenkovo (movimiento «Pervyh») dedicada a conocer la vida y la obra del destacado artista Alexander Mijailovich Kishchenko.';
}

// Path: archiveFeed.items.priorbankChtobyChuvstvovat
class _Translations$archiveFeed$items$priorbankChtobyChuvstvovat$es extends Translations$archiveFeed$items$priorbankChtobyChuvstvovat$ru {
	_Translations$archiveFeed$items$priorbankChtobyChuvstvovat$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Exposicion «Para sentir» — la coleccion de Priorbank';
	@override String get excerpt => 'Priorbank presenta por primera vez al publico su coleccion corporativa de pintura bielorrusa de los anos 1960 a 2000, reunida durante mas de 30 anos. La exposicion «Para sentir», en el palacio de los Rumiantsev y los Paskevich, podra visitarse del 10 de abril al 7 de junio y reune mas de 70 obras unicas, entre ellas tres pinturas de Alexander Kishchenko.';
}

// Path: archiveFeed.items.nitiSudby
class _Translations$archiveFeed$items$nitiSudby$es extends Translations$archiveFeed$items$nitiSudby$ru {
	_Translations$archiveFeed$items$nitiSudby$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Alexander Kishchenko. Hilos del destino';
	@override String get excerpt => 'En el museo tuvo lugar la inauguracion solemne de la exposicion «Alexander Kishchenko. Hilos del destino» (12+), dedicada a la obra del destacado artista bielorruso, originario del distrito de Boguchar en la region de Voronezh. La exposicion se organiza con motivo del 300 aniversario de la gobernacion de Voronezh y forma parte del intercambio cultural de la region con la Republica de Belarus.';
}

// Path: archiveFeed.items.boguchar2024
class _Translations$archiveFeed$items$boguchar2024$es extends Translations$archiveFeed$items$boguchar2024$ru {
	_Translations$archiveFeed$items$boguchar2024$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Visita guiada «La historia de vida de A. M. Kishchenko»';
	@override String get excerpt => 'Alexander Mijailovich Kishchenko fue una de las personalidades mas talentosas de la region de Boguchar: artista popular de la Republica de Belarus y ciudadano de honor del distrito de Boguchar. Miembro de la Union de Artistas de la URSS y galardonado con el Premio Estatal, dejo una huella vivida en la historia del arte.';
}

// Path: archiveFeed.items.belgazprombankKraskiPobedy
class _Translations$archiveFeed$items$belgazprombankKraskiPobedy$es extends Translations$archiveFeed$items$belgazprombankKraskiPobedy$ru {
	_Translations$archiveFeed$items$belgazprombankKraskiPobedy$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Belgazprombank invita a la exposicion «Los colores de la Gran Victoria»';
	@override String get excerpt => '28 de junio de 2024. En visperas del 80 aniversario de la liberacion de Belarus de los invasores nazi-alemanes, en el vestibulo de la sede central de Belgazprombank se inauguro solemnemente la exposicion tematica «Los colores de la Gran Victoria». Reune obras de artistas bielorrusos que conocieron de primera mano los horrores de la guerra: A. Kishchenko, V. Protaseni, I. Stasevich, N. Churabo, I. Rey, P. Daneliya y otros.';
}

// Path: archiveFeed.items.nebaZiamlja
class _Translations$archiveFeed$items$nebaZiamlja$es extends Translations$archiveFeed$items$nebaZiamlja$ru {
	_Translations$archiveFeed$items$nebaZiamlja$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'El cielo y la tierra de Alexander Kishchenko';
	@override String get excerpt => 'El 6 de mayo de 2023 el Museo Nacional de Arte de la Republica de Belarus abre la exposicion «El cielo y la tierra de Alexander Kishchenko», dedicada a la magnitud de su pensamiento artistico y a la importancia del legado del maestro.';
}

// Path: films.items.ispovedVremeni
class _Translations$films$items$ispovedVremeni$es extends Translations$films$items$ispovedVremeni$ru {
	_Translations$films$items$ispovedVremeni$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'A. Kishchenko. Confesion del Tiempo';
	@override String get excerpt => 'Documental sobre Alexander Mijailovich Kishchenko (1933–1997), Artista del Pueblo de Belarus y autor del tapiz mas grande del mundo. Direccion: V. Korolyov; rodaje y montaje: E. Milkovskiy.';
}

// Path: films.items.aleksandrKishchenko
class _Translations$films$items$aleksandrKishchenko$es extends Translations$films$items$aleksandrKishchenko$ru {
	_Translations$films$items$aleksandrKishchenko$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Alexander Kishchenko';
	@override String get excerpt => 'Reportaje televisivo sobre la vida y obra de Alexander Kishchenko: los murales monumentales de Minsk, el «Tapiz del Siglo» y la filosofia del realismo universal del maestro.';
}

// Path: films.items.voronezhKramskoyExhibition
class _Translations$films$items$voronezhKramskoyExhibition$es extends Translations$films$items$voronezhKramskoyExhibition$ru {
	_Translations$films$items$voronezhKramskoyExhibition$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Exposicion de A. M. Kishchenko en el Museo de Bellas Artes I. N. Kramskoy de Voronezh';
	@override String get excerpt => 'Reportaje sobre la exposicion de obras del reconocido artista bielorruso Alexander Kishchenko en el Museo Regional de Bellas Artes I. N. Kramskoy de Voronezh.';
}

// Path: films.items.mastersOfSovietArt1988
class _Translations$films$items$mastersOfSovietArt1988$es extends Translations$films$items$mastersOfSovietArt1988$ru {
	_Translations$films$items$mastersOfSovietArt1988$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'A. Kishchenko. Serie «Maestros del arte sovietico». Album de 1988';
	@override String get excerpt => 'Resena en video del album de 1988 de la serie «Maestros del arte sovietico», dedicado a la pintura y obras monumentales de Alexander Kishchenko.';
}

// Path: films.items.bogucharLecture
class _Translations$films$items$bogucharLecture$es extends Translations$films$items$bogucharLecture$ru {
	_Translations$films$items$bogucharLecture$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Conferencia «Un paisano de renombre mundial». A. M. Kishchenko. Museo de Boguchar';
	@override String get excerpt => 'Conferencia del Museo de Historia Local de Boguchar sobre Alexander Mijailovich Kishchenko — un paisano de renombre mundial, oriundo del distrito de Boguchar.';
}

// Path: films.items.culturalCodesTapestries
class _Translations$films$items$culturalCodesTapestries$es extends Translations$films$items$culturalCodesTapestries$ru {
	_Translations$films$items$culturalCodesTapestries$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Codigos culturales de la nacion: Donde estan ahora los tapices del Artista del Pueblo Kishchenko? Emision principal';
	@override String get excerpt => 'El programa «Emision principal», en su seccion «Codigos culturales de la nacion», investiga donde se encuentran actualmente los tapices del Artista del Pueblo de Belarus Alexander Kishchenko.';
}

// Path: films.items.tapestryOfCenturyMinsk
class _Translations$films$items$tapestryOfCenturyMinsk$es extends Translations$films$items$tapestryOfCenturyMinsk$ru {
	_Translations$films$items$tapestryOfCenturyMinsk$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Como se preparo «El Tapiz del Siglo» para su exposicion en el Banco de Desarrollo de Minsk';
	@override String get excerpt => 'Reportaje sobre la preparacion de la obra «El Tapiz del Siglo» del artista bielorruso Alexander Kishchenko para su exposicion en el Banco de Desarrollo de Minsk.';
}

// Path: films.items.chernobylTapestryFacts
class _Translations$films$items$chernobylTapestryFacts$es extends Translations$films$items$chernobylTapestryFacts$ru {
	_Translations$films$items$chernobylTapestryFacts$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Los tapices «Siglo» y «Chernobil». Datos interesantes';
	@override String get excerpt => 'Video sobre los iconicos tapices de Alexander Kishchenko — «El Tapiz del Siglo» y «Chernobil»: su historia, simbolismo y datos curiosos.';
}

// Path: films.items.kishchenkoReel1
class _Translations$films$items$kishchenkoReel1$es extends Translations$films$items$kishchenkoReel1$ru {
	_Translations$films$items$kishchenkoReel1$es._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'A. Kishchenko en Instagram';
	@override String get excerpt => 'Clip breve sobre las obras de Alexander Kishchenko desde redes sociales.';
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'KISHCHANKA.ART',
			'app.brandTagline' => 'Colección de Bellas Artes',
			'app.logoMark' => 'KA',
			'navigation.aboutAuthor' => 'Sobre el autor',
			'navigation.news' => 'Noticias',
			'navigation.catalogOfWorks' => 'Catalogo de obras',
			'navigation.films' => 'Peliculas',
			'navigation.archive' => 'Archivo',
			'navigation.contacts' => 'Contactos',
			'catalog.workPrefix' => 'Obra',
			'catalog.errorTitle' => 'No se pudieron cargar las pinturas',
			'catalog.errorWithDetails' => ({required Object message}) => 'No se pudieron cargar las pinturas. ${message}',
			'catalog.decade.all' => 'Todas',
			'catalog.decade.sixties' => 'Años 60',
			'catalog.decade.seventies' => 'Años 70',
			'catalog.decade.eighties' => 'Años 80',
			'catalog.decade.nineties' => 'Años 90',
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
			'catalog.paintingMediums.canvasOil' => 'Lienzo, óleo',
			'catalog.paintingMediums.hardboardOil' => 'Tablero DM, óleo',
			'catalog.paintingMediums.cardboard' => 'Cartón',
			'catalog.paintingMediums.woolLinenWeaving' => 'Lana, lino, tejido',
			'common.pageNotFound' => 'Página no encontrada',
			'common.viewCatalog' => 'VER CATÁLOGO',
			'common.learnMore' => 'SABER MÁS',
			'common.video.loadError' => 'No se pudo cargar la transmisión de video',
			'common.video.openExternally' => 'Abrir externamente',
			'tour.next' => 'Siguiente',
			'tour.gotIt' => 'Entendido',
			'tour.back' => 'Atrás',
			'tour.chernobylBody' => 'El tapiz «Chernóbil» (1991), donado a las Naciones Unidas, sigue adornando su sede de Nueva York. El Secretario General de la ONU lo comparó con el «Guernica» de Picasso.',
			'language.label' => 'Idioma',
			'language.russian' => 'Ruso',
			'language.english' => 'Ingles',
			'language.spanish' => 'Espanol',
			'language.french' => 'Frances',
			'language.german' => 'Aleman',
			'language.belarusian' => 'Bielorruso',
			'archiveFeed.title' => 'Archivo y publicaciones',
			'archiveFeed.latestLabel' => 'Publicacion mas reciente',
			'archiveFeed.moreLabel' => 'Noticias y referencias',
			'archiveFeed.openArticle' => 'Abrir articulo',
			'archiveFeed.sourceLabel' => 'Fuente',
			'archiveFeed.yearLabel' => ({required Object year}) => '${year}',
			'archiveFeed.items.boguchar2026.title' => 'Visita guiada «La historia de vida de M. A. Kishchenko»',
			'archiveFeed.items.boguchar2026.excerpt' => 'El 19 de febrero de 2026 el Museo de Boguchar acogio una visita guiada para los alumnos de la escuela de la aldea Diachenkovo (movimiento «Pervyh») dedicada a conocer la vida y la obra del destacado artista Alexander Mijailovich Kishchenko.',
			'archiveFeed.items.priorbankChtobyChuvstvovat.title' => 'Exposicion «Para sentir» — la coleccion de Priorbank',
			'archiveFeed.items.priorbankChtobyChuvstvovat.excerpt' => 'Priorbank presenta por primera vez al publico su coleccion corporativa de pintura bielorrusa de los anos 1960 a 2000, reunida durante mas de 30 anos. La exposicion «Para sentir», en el palacio de los Rumiantsev y los Paskevich, podra visitarse del 10 de abril al 7 de junio y reune mas de 70 obras unicas, entre ellas tres pinturas de Alexander Kishchenko.',
			'archiveFeed.items.nitiSudby.title' => 'Alexander Kishchenko. Hilos del destino',
			'archiveFeed.items.nitiSudby.excerpt' => 'En el museo tuvo lugar la inauguracion solemne de la exposicion «Alexander Kishchenko. Hilos del destino» (12+), dedicada a la obra del destacado artista bielorruso, originario del distrito de Boguchar en la region de Voronezh. La exposicion se organiza con motivo del 300 aniversario de la gobernacion de Voronezh y forma parte del intercambio cultural de la region con la Republica de Belarus.',
			'archiveFeed.items.boguchar2024.title' => 'Visita guiada «La historia de vida de A. M. Kishchenko»',
			'archiveFeed.items.boguchar2024.excerpt' => 'Alexander Mijailovich Kishchenko fue una de las personalidades mas talentosas de la region de Boguchar: artista popular de la Republica de Belarus y ciudadano de honor del distrito de Boguchar. Miembro de la Union de Artistas de la URSS y galardonado con el Premio Estatal, dejo una huella vivida en la historia del arte.',
			'archiveFeed.items.belgazprombankKraskiPobedy.title' => 'Belgazprombank invita a la exposicion «Los colores de la Gran Victoria»',
			'archiveFeed.items.belgazprombankKraskiPobedy.excerpt' => '28 de junio de 2024. En visperas del 80 aniversario de la liberacion de Belarus de los invasores nazi-alemanes, en el vestibulo de la sede central de Belgazprombank se inauguro solemnemente la exposicion tematica «Los colores de la Gran Victoria». Reune obras de artistas bielorrusos que conocieron de primera mano los horrores de la guerra: A. Kishchenko, V. Protaseni, I. Stasevich, N. Churabo, I. Rey, P. Daneliya y otros.',
			'archiveFeed.items.nebaZiamlja.title' => 'El cielo y la tierra de Alexander Kishchenko',
			'archiveFeed.items.nebaZiamlja.excerpt' => 'El 6 de mayo de 2023 el Museo Nacional de Arte de la Republica de Belarus abre la exposicion «El cielo y la tierra de Alexander Kishchenko», dedicada a la magnitud de su pensamiento artistico y a la importancia del legado del maestro.',
			'films.title' => 'Peliculas y documentales',
			'films.subtitle' => 'Archivo audiovisual sobre A. Kishchenko',
			'films.latestLabel' => 'Pelicula destacada',
			'films.sourceLabel' => 'Fuente',
			'films.instagramTitle' => 'Instagram',
			'films.instagramSubtitle' => 'Videos cortos e historias',
			'films.watchOn.youtube' => 'Ver en YouTube',
			'films.watchOn.googleDrive' => 'Ver en Google Drive',
			'films.watchOn.instagram' => 'Abrir en Instagram',
			'films.items.ispovedVremeni.title' => 'A. Kishchenko. Confesion del Tiempo',
			'films.items.ispovedVremeni.excerpt' => 'Documental sobre Alexander Mijailovich Kishchenko (1933–1997), Artista del Pueblo de Belarus y autor del tapiz mas grande del mundo. Direccion: V. Korolyov; rodaje y montaje: E. Milkovskiy.',
			'films.items.aleksandrKishchenko.title' => 'Alexander Kishchenko',
			'films.items.aleksandrKishchenko.excerpt' => 'Reportaje televisivo sobre la vida y obra de Alexander Kishchenko: los murales monumentales de Minsk, el «Tapiz del Siglo» y la filosofia del realismo universal del maestro.',
			'films.items.voronezhKramskoyExhibition.title' => 'Exposicion de A. M. Kishchenko en el Museo de Bellas Artes I. N. Kramskoy de Voronezh',
			'films.items.voronezhKramskoyExhibition.excerpt' => 'Reportaje sobre la exposicion de obras del reconocido artista bielorruso Alexander Kishchenko en el Museo Regional de Bellas Artes I. N. Kramskoy de Voronezh.',
			'films.items.mastersOfSovietArt1988.title' => 'A. Kishchenko. Serie «Maestros del arte sovietico». Album de 1988',
			'films.items.mastersOfSovietArt1988.excerpt' => 'Resena en video del album de 1988 de la serie «Maestros del arte sovietico», dedicado a la pintura y obras monumentales de Alexander Kishchenko.',
			'films.items.bogucharLecture.title' => 'Conferencia «Un paisano de renombre mundial». A. M. Kishchenko. Museo de Boguchar',
			'films.items.bogucharLecture.excerpt' => 'Conferencia del Museo de Historia Local de Boguchar sobre Alexander Mijailovich Kishchenko — un paisano de renombre mundial, oriundo del distrito de Boguchar.',
			'films.items.culturalCodesTapestries.title' => 'Codigos culturales de la nacion: Donde estan ahora los tapices del Artista del Pueblo Kishchenko? Emision principal',
			'films.items.culturalCodesTapestries.excerpt' => 'El programa «Emision principal», en su seccion «Codigos culturales de la nacion», investiga donde se encuentran actualmente los tapices del Artista del Pueblo de Belarus Alexander Kishchenko.',
			'films.items.tapestryOfCenturyMinsk.title' => 'Como se preparo «El Tapiz del Siglo» para su exposicion en el Banco de Desarrollo de Minsk',
			'films.items.tapestryOfCenturyMinsk.excerpt' => 'Reportaje sobre la preparacion de la obra «El Tapiz del Siglo» del artista bielorruso Alexander Kishchenko para su exposicion en el Banco de Desarrollo de Minsk.',
			'films.items.chernobylTapestryFacts.title' => 'Los tapices «Siglo» y «Chernobil». Datos interesantes',
			'films.items.chernobylTapestryFacts.excerpt' => 'Video sobre los iconicos tapices de Alexander Kishchenko — «El Tapiz del Siglo» y «Chernobil»: su historia, simbolismo y datos curiosos.',
			'films.items.kishchenkoReel1.title' => 'A. Kishchenko en Instagram',
			'films.items.kishchenkoReel1.excerpt' => 'Clip breve sobre las obras de Alexander Kishchenko desde redes sociales.',
			'newsFeed.title' => 'Noticias',
			'newsFeed.subtitle' => 'Publicaciones, exposiciones y eventos',
			'newsFeed.emptyState' => 'Aun no hay noticias. Vuelve pronto.',
			'newsFeed.errorTitle' => 'No se pudieron cargar las noticias',
			'newsFeed.retry' => 'Reintentar',
			'newsFeed.back' => 'Volver a las noticias',
			'newsFeed.sourceLabel' => 'Fuente',
			'newsFeed.readTimeLabel' => 'Tiempo de lectura',
			'newsFeed.readTimeValue' => ({required Object minutes}) => '${minutes} min',
			'newsFeed.viewsLabel' => 'Vistas',
			'newsFeed.publishedLabel' => 'Publicado',
			'bio.heroTitle' => 'ARTE DE ESCALA CÓSMICA',
			'bio.heroSubtitle' => 'Un arte que borra las fronteras entre lo terrenal y lo eterno. Artista del Pueblo de la República de Bielorrusia, creador del tapiz más grande del mundo «El Tapiz del Siglo».',
			'bio.heroBrandName' => 'Alexander Mikhailovich Kishchanka',
			'bio.name' => 'Alexander Mikhailovich Kishchanka (1933–1997)',
			'bio.tagline' => 'Pintor. Filósofo. Monumentalista. Fundador del Realismo Universal.',
			'bio.intro' => 'Alexander Kishchanka es una figura de escala renacentista en el arte del siglo XX. Un hombre que logró transformar el suave hilo del tapiz en una poderosa declaración arquitectónica, y las paredes de las ciudades en libros abiertos de significados filosóficos. Su obra es un puente entre lo arcaico y el cosmos, entre el dolor de la tierra y la luz de galaxias lejanas.',
			'bio.feature.title' => 'LEGADO DE ESCALA MUNDIAL',
			'bio.feature.body' => 'Esta colección reúne obras de un maestro excepcional cuyo arte cambió para siempre la idea de la pintura monumental y del tapiz. Desde los grandiosos mosaicos que se convirtieron en el código visual de Minsk hasta el célebre Tapiz del Siglo y la obra Chernóbil, que adorna la sede de las Naciones Unidas en Nueva York. Cada obra de Kishchanka es un tratado filosófico sobre la conexión de los tiempos, el cosmos y el espíritu humano indestructible.',
			'bio.feature.cta' => 'EXPLORAR LA COLECCIÓN',
			'bio.feature.worksValue' => '500+',
			'bio.feature.worksLabel' => 'Obras de arte en todo el mundo',
			'bio.feature.panelsValue' => '6+',
			'bio.feature.panelsLabel' => 'Paneles monumentales en Minsk',
			'bio.feature.guinnessValue' => '1',
			'bio.feature.guinnessLabel' => 'Récord Guinness en el arte',
			'bio.feature.unGiftValue' => '',
			'bio.feature.unGiftLabel' => 'Un regalo a la ONU',
			'bio.universalRealism.title' => 'Fundador del Realismo Universal',
			'bio.universalRealism.body' => 'Kishchanka no sólo representaba la realidad — creaba un nuevo sistema de coordenadas, al que llamó Realismo Universal. La base de su método es la convicción de que el artista es un tejedor del tiempo, obligado a conectar el pasado y el futuro. Su arte trascendió las fronteras nacionales, operando en términos del drama humano global. Para Kishchanka, el hombre es un semidiós cuyos actos resuenan a escala universal. En sus obras, las sombras se convierten en formas independientes, y el color en música cósmica sujeta a un estricto orden superior.',
			'bio.tapestry.title' => 'El Tapiz del Siglo: La Cima del Arte Textil Mundial',
			'bio.tapestry.intro' => 'Alexander Kishchanka entró en la historia como el autor del tapiz más grande del mundo, registrado oficialmente en el Libro Guinness de los Récords.',
			'bio.tapestry.scaleLabel' => 'Dimensiones',
			'bio.tapestry.scale' => 'Un lienzo de 19 × 14 metros (aproximadamente 300 m²), con un peso superior a una tonelada.',
			'bio.tapestry.conceptLabel' => 'Concepto',
			'bio.tapestry.concept' => 'Una grandiosa trama de la historia, donde se entrelazan los destinos de 80 personalidades icónicas — desde Cristo y la Madonna hasta Churchill, Castro y Gorbachov.',
			'bio.tapestry.meaningLabel' => 'Significado',
			'bio.tapestry.meaning' => 'Esta obra es un templo, en cuyo centro se desarrolla el eterno conflicto entre la creación y la destrucción. Fue reconocida como patrimonio nacional de Bielorrusia.',
			'bio.chernobyl.title' => 'Chernóbil: La Voz de una Nación en las Salas de la ONU',
			'bio.chernobyl.body' => 'Una de las obras más emocionalmente poderosas del maestro fue el tapiz Chernóbil (1991). Entregado como obsequio a las Naciones Unidas, hoy sigue adornando la sede de la ONU en Nueva York. Cuando el mundo vio esta obra, el Secretario General de la ONU Javier Pérez de Cuéllar la comparó con la Guernica de Picasso. Para Kishchanka, este tapiz no era sólo un memorial a la tragedia, sino los ojos de Bielorrusia — una advertencia planetaria sobre la fragilidad de la vida, tejida por las manos de grandes artesanas bielorrusas.',
			'bio.mosaic.title' => 'El Rostro de la Ciudad: Los Mosaicos Vostok',
			'bio.mosaic.intro' => 'Kishchanka formó el código visual del Minsk moderno. Sus famosos mosaicos en edificios de viviendas del distrito Vostok-1 se convirtieron en la tarjeta de visita de la capital.',
			'bio.mosaic.panelsLabel' => 'Cuatro obras monumentales',
			'bio.mosaic.panels' => 'Ciudad-guerrera, Ciudad de la Ciencia, Ciudad de la Cultura y Ciudad-constructora.',
			'bio.mosaic.panelsMeaning' => 'Estas obras transformaron la construcción estándar en un espacio artístico, donde a través del esmalte y la piedra se celebra el triunfo del espíritu humano.',
			'bio.legacy.title' => 'Legado',
			'bio.legacy.body' => 'Alexander Kishchanka dejó tras de sí no sólo lienzos conservados en la Galería Tretiakov y colecciones privadas de líderes mundiales (B. Clinton, F. Mitterrand), sino toda una escuela del tapiz monumental bielorruso. El Combinado de Artes Decorativas y Aplicadas de Borisov, donde se crearon sus grandes tapices, lleva hoy su nombre.',
			'bio.quote' => 'El arte es un fenómeno divino. Sólo a él le es dado detener el tiempo. El arte puede descifrar el misterio del futuro y también restaurar el pasado perdido.',
			'bio.quoteAuthor' => '— Alexander Kishchanka',
			'bio.wikipediaLinkLabel' => 'LEER EN WIKIPEDIA',
			'contacts.title' => 'Contactos',
			'contacts.tagline' => 'Póngase en contacto con el estudio.',
			'contacts.phoneSectionLabel' => 'Teléfono',
			'contacts.phoneSectionHint' => 'Llamadas y WhatsApp',
			'contacts.instagramSectionLabel' => 'Instagram',
			'contacts.instagramHandle' => '@kishchenko.art',
			'contacts.vkSectionLabel' => 'VK',
			'contacts.vkHandle' => 'aleksandrkishchenko',
			'contacts.vkScanQrHint' => 'Escanee el QR para abrir VK',
			'contacts.studioSectionTitle' => 'Taller del autor',
			'contacts.studioAddress' => 'Minsk, calle Surganova 44 — 7.ª planta',
			'contacts.openInOsm' => 'ABRIR EN OPENSTREETMAP',
			'contacts.mapAttribution' => '© Colaboradores de OpenStreetMap',
			'seo.aboutAuthor.title' => 'Alexander Kishchanka — Artista del Pueblo de Bielorrusia | KISHCHANKA.ART',
			'seo.aboutAuthor.description' => 'Alexander Mijáilovich Kishchanka (1933–1997) — Artista del Pueblo de la República de Bielorrusia, pintor y monumentalista. Autor del tapiz más grande del mundo y del tapiz de Chernóbil en la ONU.',
			'seo.aboutAuthor.keywords' => 'Alexander Kishchanka, biografía, artista bielorruso, monumentalista, tapiz',
			'seo.catalog.title' => 'Catálogo de obras de Alexander Kishchanka | KISHCHANKA.ART',
			'seo.catalog.description' => 'Catálogo de pinturas y tapices de Alexander Kishchanka: retratos, paisajes y obras filosóficas de 1958–1997.',
			'seo.catalog.keywords' => 'catálogo Kishchanka, pinturas, tapices, comprar arte Kishchanka',
			'seo.news.title' => 'Noticias y exposiciones | KISHCHANKA.ART',
			'seo.news.description' => 'Noticias, exposiciones y eventos relacionados con el legado de Alexander Kishchanka y la galería KISHCHANKA.ART.',
			'seo.news.keywords' => 'exposiciones Kishchanka, noticias de la galería, eventos',
			'seo.films.title' => 'Documentales sobre A. Kishchanka | KISHCHANKA.ART',
			'seo.films.description' => 'Documentales y videos sobre Alexander Kishchanka, su arte y obras monumentales.',
			'seo.films.keywords' => 'documental Kishchanka, película, Tapiz del Siglo, video',
			'seo.archive.title' => 'Archivo y publicaciones | KISHCHANKA.ART',
			'seo.archive.description' => 'Archivo de publicaciones y materiales sobre el arte y las exposiciones de Alexander Kishchanka.',
			'seo.archive.keywords' => 'archivo Kishchanka, publicaciones, prensa, artículos',
			'seo.contacts.title' => 'Contacto | KISHCHANKA.ART',
			'seo.contacts.description' => 'Contacte con la galería KISHCHANKA.ART: taller en Minsk, teléfono, Instagram y VK.',
			'seo.contacts.keywords' => 'contacto galería Kishchanka, taller Minsk, comprar pintura',
			_ => null,
		};
	}
}
