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
class TranslationsDe extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsDe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.de,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <de>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsDe _root = this; // ignore: unused_field

	@override 
	TranslationsDe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDe(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppDe app = _TranslationsAppDe._(_root);
	@override late final _TranslationsNavigationDe navigation = _TranslationsNavigationDe._(_root);
	@override late final _TranslationsCatalogDe catalog = _TranslationsCatalogDe._(_root);
	@override late final _TranslationsCommonDe common = _TranslationsCommonDe._(_root);
	@override late final _TranslationsLanguageDe language = _TranslationsLanguageDe._(_root);
}

// Path: app
class _TranslationsAppDe extends TranslationsAppRu {
	_TranslationsAppDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kunstgalerie';
}

// Path: navigation
class _TranslationsNavigationDe extends TranslationsNavigationRu {
	_TranslationsNavigationDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get aboutAuthor => 'Uber den Autor';
	@override String get news => 'Neuigkeiten';
	@override String get catalogOfWorks => 'Werkkatalog';
	@override String get archive => 'Archiv';
	@override String get contacts => 'Kontakte';
}

// Path: catalog
class _TranslationsCatalogDe extends TranslationsCatalogRu {
	_TranslationsCatalogDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get workPrefix => 'Werk';
	@override late final _TranslationsCatalogPaintingNamesDe paintingNames = _TranslationsCatalogPaintingNamesDe._(_root);
}

// Path: common
class _TranslationsCommonDe extends TranslationsCommonRu {
	_TranslationsCommonDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get pageNotFound => 'Seite nicht gefunden';
}

// Path: language
class _TranslationsLanguageDe extends TranslationsLanguageRu {
	_TranslationsLanguageDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get label => 'Sprache';
	@override String get russian => 'Russisch';
	@override String get english => 'Englisch';
	@override String get spanish => 'Spanisch';
	@override String get french => 'Franzosisch';
	@override String get german => 'Deutsch';
}

// Path: catalog.paintingNames
class _TranslationsCatalogPaintingNamesDe extends TranslationsCatalogPaintingNamesRu {
	_TranslationsCatalogPaintingNamesDe._(TranslationsDe root) : this._root = root, super.internal(root);

	final TranslationsDe _root; // ignore: unused_field

	// Translations
	@override String get id1958_1 => 'Stadtrand. Alte Mühle';
	@override String get id1958_2 => 'Angelina';
	@override String get id1958_3 => 'Die Toilette';
	@override String get id1959_1 => 'Frauenporträt';
	@override String get id1960_1 => 'Komposition Nr. 1';
	@override String get id1960_2 => 'Frauenporträt in Grüntönen';
	@override String get id1960_3 => 'Erster Schnee';
	@override String get id1960_4 => 'Frau im Sessel';
	@override String get id1960_5 => 'Porträt des Malers Wladimir Urischtschenko';
	@override String get id1960_6 => 'Mädchen mit Schleife';
	@override String get id1960_7 => 'Frauenporträt';
	@override String get id1960_8 => 'Frauenporträt';
	@override String get id1960_9 => 'Erwartung';
	@override String get id1962_1 => 'Nordländerin (Frau aus dem Norden)';
	@override String get id1965_1 => 'Frauenporträt';
	@override String get id1965_2 => 'Zirkusjunge';
	@override String get id1965_3 => 'Versuchung';
	@override String get id1967_1 => 'Soja Litwinowa';
	@override String get id1967_2 => 'Zwei Leben';
	@override String get id1968_1 => 'Stillleben mit Birnen';
	@override String get id1969_1 => 'Engel';
	@override String get id1970_1 => 'Die Lehrerin';
	@override String get id1970_2 => 'Der letzte Sebastopoler';
	@override String get id1972_1 => 'Porträt von Schenja Mussinskaja';
	@override String get id1974_1 => 'Mädchen in russischer Tracht';
	@override String get id1975_1 => 'Der Erstgeborene';
	@override String get id1976_1 => 'Mädchen in Rot mit Gold (Grüne Weintrauben)';
	@override String get id1979_1 => 'Mutter mit Kind';
	@override String get id1979_2 => 'Natascha';
	@override String get id1979_3 => 'Ermordung der Familie Gromow. Aktion 1943. Taman.';
	@override String get id1979_4 => 'Skizze zum Werk "Der Schmerz des Poeten"';
	@override String get id1979_5 => 'Freude. Mutterschaft';
	@override String get id1980_1 => 'Fragment zum Bild "Honig"';
	@override String get id1980_2 => 'Porträt der Mama';
	@override String get id1980_3 => 'Nina';
	@override String get id1980_4 => 'Natascha Martschenko';
	@override String get id1980_5 => 'Natascha';
	@override String get id1981_1 => 'Nachdenken';
	@override String get id1981_2 => 'Porträt von Jelena Obraszowa';
	@override String get id1982_1 => 'Selbstporträt';
	@override String get id1982_2 => 'Adam und Eva';
	@override String get id1982_3 => 'Entweihung des Tempels';
	@override String get id1982_4 => 'Obskuranten';
	@override String get id1982_5 => 'Sonnenblumen';
	@override String get id1982_6 => 'Landschaft';
	@override String get id1983_1 => 'Madonna';
	@override String get id1983_2 => 'Verschwörung (Schwur der Freimaurer)';
	@override String get id1983_3 => 'Nina';
	@override String get id1983_4 => 'Porträt von Maria Bieschu';
	@override String get id1983_5 => 'Ruf des Meeres';
	@override String get id1983_6 => 'Weinen';
	@override String get id1983_7 => 'Natascha';
	@override String get id1984_1 => 'Nina';
	@override String get id1984_2 => 'Nina';
	@override String get id1985_1 => 'Onkel Wanja';
	@override String get id1985_2 => 'Mädchen mit rotem Hut';
	@override String get id1985_3 => 'Frauengestalt. Natascha Tatarenko';
	@override String get id1985_4 => 'Männerporträt';
	@override String get id1985_5 => 'Sommerdusche';
	@override String get id1986_1 => 'Mädchenporträt';
	@override String get id1986_2 => 'Porträt des Kameramanns A. Abadowski';
	@override String get id1986_3 => 'Letzte Septembertage';
	@override String get id1986_4 => 'Porträt von Buschtschik';
	@override String get id1986_5 => 'Porträt von Natascha Martschenko';
	@override String get id1987_1 => 'Er wird leben. Tschernobyl';
	@override String get id1987_2 => 'Frauenporträt';
	@override String get id1988_1 => 'Porträt von Mascha';
	@override String get id1988_2 => 'Männerkopf';
	@override String get id1988_3 => 'Profil';
	@override String get id1988_4 => 'Die Gehende';
	@override String get id1989_1 => 'Am Ufer des Don';
	@override String get id1989_2 => 'Morgen';
	@override String get id1989_3 => 'Porträt der Malerin Tamara Kirschtschina';
	@override String get id1989_4 => 'Akt im Raum Musik';
	@override String get id1989_5 => 'Die Gehende (Universum)';
	@override String get id1989_6 => 'Nina';
	@override String get id1989_7 => 'Geschwister Jelkin';
	@override String get id1989_8 => 'Nina';
	@override String get id1989_9 => 'Akt';
	@override String get id1990_1 => 'Im Raum (Akt)';
	@override String get id1990_2 => 'Gaben der Planeten';
	@override String get id1990_3 => 'Soja';
	@override String get id1990_4 => 'Männerporträt';
	@override String get id1990_5 => 'Auf dem Balkon';
	@override String get id1991_1 => 'Mädchen mit Honig (Universum)';
	@override String get id1991_2 => 'Traum';
	@override String get id1991_3 => 'Die Ewige';
	@override String get id1992_1 => 'Porträt mit Muschel';
	@override String get id1992_2 => 'Satyr und Nymphe';
	@override String get id1992_3 => 'Junge mit Hahn';
	@override String get id1992_4 => 'Nina und Maxim';
	@override String get id1992_5 => 'Russischer Bauer';
	@override String get id1992_6 => 'Porträt von Franz Koch';
	@override String get id1992_7 => 'Nina';
	@override String get id1992_8 => 'Olga';
	@override String get id1992_9 => 'Mach keinen Unsinn, Maxim!';
	@override String get id1992_10 => 'Wandteppich "Sonnenblumen"';
	@override String get id1993_1 => 'Das Ewige';
	@override String get id1993_2 => 'Porträt der Bildhauerin Lena Charaberjusch';
	@override String get id1993_3 => 'Der Apotheker';
	@override String get id1993_4 => 'Olja';
	@override String get id1993_5 => 'Mutter und Kind';
	@override String get id1993_6 => 'Christus';
	@override String get id1993_7 => 'Natascha';
	@override String get id1993_8 => 'Porträt einer Unbekannten';
	@override String get id1993_9 => 'Roman';
	@override String get id1994_1 => 'Unter dem Sternbild des Löwen';
	@override String get id1994_2 => 'Porträt von Soja';
	@override String get id1994_3 => 'Verlassener Hof';
	@override String get id1994_4 => 'Natascha';
	@override String get id1994_5 => 'Lied';
	@override String get id1994_6 => 'Mädchen mit Apfel-Stillleben';
	@override String get id1994_7 => 'Die Schreiende';
	@override String get id1994_8 => 'Natascha';
	@override String get id1994_9 => 'Bacchanal';
	@override String get id1995_1 => 'Kleiner Träumer';
	@override String get id1995_2 => 'Meine Heimat';
	@override String get id1995_3 => 'Akt';
	@override String get id1995_4 => 'Olga Koltakowa';
	@override String get id1995_5 => 'Tamara Kirschtschina von hinten';
	@override String get id1995_6 => 'Olja';
	@override String get id1995_7 => 'Traurigkeit';
	@override String get id1995_8 => 'Mädchenporträt';
	@override String get id1995_9 => 'Universum';
	@override String get id1995_10 => 'Ljoscha';
	@override String get id1995_11 => 'Porträt von Rostikow';
	@override String get id1995_12 => 'Kunstkritikerin Nadja';
	@override String get id1995_13 => 'Melodie';
	@override String get id1995_14 => 'Tanja';
	@override String get id1995_15 => 'Skizze zum Bild «Porträt von Nina»';
	@override String get id1995_16 => 'Stillleben';
	@override String get id1995_17 => 'Wandteppich "Meer" ("Welle")';
	@override String get id1996_1 => 'Stillleben mit Äpfeln';
	@override String get id1996_2 => 'Akt';
	@override String get id1996_3 => 'Maxim mit Wassermelone';
	@override String get id1996_4 => 'Hymne (Verzückung)';
	@override String get id1996_5 => 'Nina';
	@override String get id1996_6 => 'Inna';
	@override String get id1996_7 => 'Alla Astachowitsch';
	@override String get id1996_8 => 'Lena';
	@override String get id1996_9 => 'Frauenporträt (Nina Nr. 1)';
	@override String get id1996_10 => 'Universum';
	@override String get id1996_11 => 'Im Boot fahrend';
	@override String get id1996_12 => 'Frauenporträt mit Schal';
	@override String get id1996_13 => 'Mama';
	@override String get id1996_14 => 'Philaret von Minsk';
	@override String get id1996_15 => 'Stillleben im Raum';
	@override String get id1996_16 => 'Porträt von Kutschinski';
	@override String get id1996_17 => 'Frauenporträt';
	@override String get id1996_18 => 'Mein Universum';
	@override String get id1997_1 => 'Iwan';
	@override String get id1997_2 => 'Porträt des Architekten Wladimir Salaskin';
	@override String get id1997_3 => 'Krieg der Welten (letztes Werk)';
	@override String get id1997_4 => 'Selbstporträt';
	@override String get id1997_5 => 'Sommer in Bogutschar';
	@override String get id1997_6 => 'Zwei Witwen';
	@override String get idunknown_1 => 'Hochwasser';
	@override String get idunknown_2 => 'Frauenporträt';
	@override String get idunknown_3 => 'Blaue Dornen';
	@override String get idunknown_4 => 'Nina';
	@override String get idunknown_5 => 'Nina';
}

/// The flat map containing all translations for locale <de>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsDe {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'Kunstgalerie',
			'navigation.aboutAuthor' => 'Uber den Autor',
			'navigation.news' => 'Neuigkeiten',
			'navigation.catalogOfWorks' => 'Werkkatalog',
			'navigation.archive' => 'Archiv',
			'navigation.contacts' => 'Kontakte',
			'catalog.workPrefix' => 'Werk',
			'catalog.paintingNames.id1958_1' => 'Stadtrand. Alte Mühle',
			'catalog.paintingNames.id1958_2' => 'Angelina',
			'catalog.paintingNames.id1958_3' => 'Die Toilette',
			'catalog.paintingNames.id1959_1' => 'Frauenporträt',
			'catalog.paintingNames.id1960_1' => 'Komposition Nr. 1',
			'catalog.paintingNames.id1960_2' => 'Frauenporträt in Grüntönen',
			'catalog.paintingNames.id1960_3' => 'Erster Schnee',
			'catalog.paintingNames.id1960_4' => 'Frau im Sessel',
			'catalog.paintingNames.id1960_5' => 'Porträt des Malers Wladimir Urischtschenko',
			'catalog.paintingNames.id1960_6' => 'Mädchen mit Schleife',
			'catalog.paintingNames.id1960_7' => 'Frauenporträt',
			'catalog.paintingNames.id1960_8' => 'Frauenporträt',
			'catalog.paintingNames.id1960_9' => 'Erwartung',
			'catalog.paintingNames.id1962_1' => 'Nordländerin (Frau aus dem Norden)',
			'catalog.paintingNames.id1965_1' => 'Frauenporträt',
			'catalog.paintingNames.id1965_2' => 'Zirkusjunge',
			'catalog.paintingNames.id1965_3' => 'Versuchung',
			'catalog.paintingNames.id1967_1' => 'Soja Litwinowa',
			'catalog.paintingNames.id1967_2' => 'Zwei Leben',
			'catalog.paintingNames.id1968_1' => 'Stillleben mit Birnen',
			'catalog.paintingNames.id1969_1' => 'Engel',
			'catalog.paintingNames.id1970_1' => 'Die Lehrerin',
			'catalog.paintingNames.id1970_2' => 'Der letzte Sebastopoler',
			'catalog.paintingNames.id1972_1' => 'Porträt von Schenja Mussinskaja',
			'catalog.paintingNames.id1974_1' => 'Mädchen in russischer Tracht',
			'catalog.paintingNames.id1975_1' => 'Der Erstgeborene',
			'catalog.paintingNames.id1976_1' => 'Mädchen in Rot mit Gold (Grüne Weintrauben)',
			'catalog.paintingNames.id1979_1' => 'Mutter mit Kind',
			'catalog.paintingNames.id1979_2' => 'Natascha',
			'catalog.paintingNames.id1979_3' => 'Ermordung der Familie Gromow. Aktion 1943. Taman.',
			'catalog.paintingNames.id1979_4' => 'Skizze zum Werk "Der Schmerz des Poeten"',
			'catalog.paintingNames.id1979_5' => 'Freude. Mutterschaft',
			'catalog.paintingNames.id1980_1' => 'Fragment zum Bild "Honig"',
			'catalog.paintingNames.id1980_2' => 'Porträt der Mama',
			'catalog.paintingNames.id1980_3' => 'Nina',
			'catalog.paintingNames.id1980_4' => 'Natascha Martschenko',
			'catalog.paintingNames.id1980_5' => 'Natascha',
			'catalog.paintingNames.id1981_1' => 'Nachdenken',
			'catalog.paintingNames.id1981_2' => 'Porträt von Jelena Obraszowa',
			'catalog.paintingNames.id1982_1' => 'Selbstporträt',
			'catalog.paintingNames.id1982_2' => 'Adam und Eva',
			'catalog.paintingNames.id1982_3' => 'Entweihung des Tempels',
			'catalog.paintingNames.id1982_4' => 'Obskuranten',
			'catalog.paintingNames.id1982_5' => 'Sonnenblumen',
			'catalog.paintingNames.id1982_6' => 'Landschaft',
			'catalog.paintingNames.id1983_1' => 'Madonna',
			'catalog.paintingNames.id1983_2' => 'Verschwörung (Schwur der Freimaurer)',
			'catalog.paintingNames.id1983_3' => 'Nina',
			'catalog.paintingNames.id1983_4' => 'Porträt von Maria Bieschu',
			'catalog.paintingNames.id1983_5' => 'Ruf des Meeres',
			'catalog.paintingNames.id1983_6' => 'Weinen',
			'catalog.paintingNames.id1983_7' => 'Natascha',
			'catalog.paintingNames.id1984_1' => 'Nina',
			'catalog.paintingNames.id1984_2' => 'Nina',
			'catalog.paintingNames.id1985_1' => 'Onkel Wanja',
			'catalog.paintingNames.id1985_2' => 'Mädchen mit rotem Hut',
			'catalog.paintingNames.id1985_3' => 'Frauengestalt. Natascha Tatarenko',
			'catalog.paintingNames.id1985_4' => 'Männerporträt',
			'catalog.paintingNames.id1985_5' => 'Sommerdusche',
			'catalog.paintingNames.id1986_1' => 'Mädchenporträt',
			'catalog.paintingNames.id1986_2' => 'Porträt des Kameramanns A. Abadowski',
			'catalog.paintingNames.id1986_3' => 'Letzte Septembertage',
			'catalog.paintingNames.id1986_4' => 'Porträt von Buschtschik',
			'catalog.paintingNames.id1986_5' => 'Porträt von Natascha Martschenko',
			'catalog.paintingNames.id1987_1' => 'Er wird leben. Tschernobyl',
			'catalog.paintingNames.id1987_2' => 'Frauenporträt',
			'catalog.paintingNames.id1988_1' => 'Porträt von Mascha',
			'catalog.paintingNames.id1988_2' => 'Männerkopf',
			'catalog.paintingNames.id1988_3' => 'Profil',
			'catalog.paintingNames.id1988_4' => 'Die Gehende',
			'catalog.paintingNames.id1989_1' => 'Am Ufer des Don',
			'catalog.paintingNames.id1989_2' => 'Morgen',
			'catalog.paintingNames.id1989_3' => 'Porträt der Malerin Tamara Kirschtschina',
			'catalog.paintingNames.id1989_4' => 'Akt im Raum Musik',
			'catalog.paintingNames.id1989_5' => 'Die Gehende (Universum)',
			'catalog.paintingNames.id1989_6' => 'Nina',
			'catalog.paintingNames.id1989_7' => 'Geschwister Jelkin',
			'catalog.paintingNames.id1989_8' => 'Nina',
			'catalog.paintingNames.id1989_9' => 'Akt',
			'catalog.paintingNames.id1990_1' => 'Im Raum (Akt)',
			'catalog.paintingNames.id1990_2' => 'Gaben der Planeten',
			'catalog.paintingNames.id1990_3' => 'Soja',
			'catalog.paintingNames.id1990_4' => 'Männerporträt',
			'catalog.paintingNames.id1990_5' => 'Auf dem Balkon',
			'catalog.paintingNames.id1991_1' => 'Mädchen mit Honig (Universum)',
			'catalog.paintingNames.id1991_2' => 'Traum',
			'catalog.paintingNames.id1991_3' => 'Die Ewige',
			'catalog.paintingNames.id1992_1' => 'Porträt mit Muschel',
			'catalog.paintingNames.id1992_2' => 'Satyr und Nymphe',
			'catalog.paintingNames.id1992_3' => 'Junge mit Hahn',
			'catalog.paintingNames.id1992_4' => 'Nina und Maxim',
			'catalog.paintingNames.id1992_5' => 'Russischer Bauer',
			'catalog.paintingNames.id1992_6' => 'Porträt von Franz Koch',
			'catalog.paintingNames.id1992_7' => 'Nina',
			'catalog.paintingNames.id1992_8' => 'Olga',
			'catalog.paintingNames.id1992_9' => 'Mach keinen Unsinn, Maxim!',
			'catalog.paintingNames.id1992_10' => 'Wandteppich "Sonnenblumen"',
			'catalog.paintingNames.id1993_1' => 'Das Ewige',
			'catalog.paintingNames.id1993_2' => 'Porträt der Bildhauerin Lena Charaberjusch',
			'catalog.paintingNames.id1993_3' => 'Der Apotheker',
			'catalog.paintingNames.id1993_4' => 'Olja',
			'catalog.paintingNames.id1993_5' => 'Mutter und Kind',
			'catalog.paintingNames.id1993_6' => 'Christus',
			'catalog.paintingNames.id1993_7' => 'Natascha',
			'catalog.paintingNames.id1993_8' => 'Porträt einer Unbekannten',
			'catalog.paintingNames.id1993_9' => 'Roman',
			'catalog.paintingNames.id1994_1' => 'Unter dem Sternbild des Löwen',
			'catalog.paintingNames.id1994_2' => 'Porträt von Soja',
			'catalog.paintingNames.id1994_3' => 'Verlassener Hof',
			'catalog.paintingNames.id1994_4' => 'Natascha',
			'catalog.paintingNames.id1994_5' => 'Lied',
			'catalog.paintingNames.id1994_6' => 'Mädchen mit Apfel-Stillleben',
			'catalog.paintingNames.id1994_7' => 'Die Schreiende',
			'catalog.paintingNames.id1994_8' => 'Natascha',
			'catalog.paintingNames.id1994_9' => 'Bacchanal',
			'catalog.paintingNames.id1995_1' => 'Kleiner Träumer',
			'catalog.paintingNames.id1995_2' => 'Meine Heimat',
			'catalog.paintingNames.id1995_3' => 'Akt',
			'catalog.paintingNames.id1995_4' => 'Olga Koltakowa',
			'catalog.paintingNames.id1995_5' => 'Tamara Kirschtschina von hinten',
			'catalog.paintingNames.id1995_6' => 'Olja',
			'catalog.paintingNames.id1995_7' => 'Traurigkeit',
			'catalog.paintingNames.id1995_8' => 'Mädchenporträt',
			'catalog.paintingNames.id1995_9' => 'Universum',
			'catalog.paintingNames.id1995_10' => 'Ljoscha',
			'catalog.paintingNames.id1995_11' => 'Porträt von Rostikow',
			'catalog.paintingNames.id1995_12' => 'Kunstkritikerin Nadja',
			'catalog.paintingNames.id1995_13' => 'Melodie',
			'catalog.paintingNames.id1995_14' => 'Tanja',
			'catalog.paintingNames.id1995_15' => 'Skizze zum Bild «Porträt von Nina»',
			'catalog.paintingNames.id1995_16' => 'Stillleben',
			'catalog.paintingNames.id1995_17' => 'Wandteppich "Meer" ("Welle")',
			'catalog.paintingNames.id1996_1' => 'Stillleben mit Äpfeln',
			'catalog.paintingNames.id1996_2' => 'Akt',
			'catalog.paintingNames.id1996_3' => 'Maxim mit Wassermelone',
			'catalog.paintingNames.id1996_4' => 'Hymne (Verzückung)',
			'catalog.paintingNames.id1996_5' => 'Nina',
			'catalog.paintingNames.id1996_6' => 'Inna',
			'catalog.paintingNames.id1996_7' => 'Alla Astachowitsch',
			'catalog.paintingNames.id1996_8' => 'Lena',
			'catalog.paintingNames.id1996_9' => 'Frauenporträt (Nina Nr. 1)',
			'catalog.paintingNames.id1996_10' => 'Universum',
			'catalog.paintingNames.id1996_11' => 'Im Boot fahrend',
			'catalog.paintingNames.id1996_12' => 'Frauenporträt mit Schal',
			'catalog.paintingNames.id1996_13' => 'Mama',
			'catalog.paintingNames.id1996_14' => 'Philaret von Minsk',
			'catalog.paintingNames.id1996_15' => 'Stillleben im Raum',
			'catalog.paintingNames.id1996_16' => 'Porträt von Kutschinski',
			'catalog.paintingNames.id1996_17' => 'Frauenporträt',
			'catalog.paintingNames.id1996_18' => 'Mein Universum',
			'catalog.paintingNames.id1997_1' => 'Iwan',
			'catalog.paintingNames.id1997_2' => 'Porträt des Architekten Wladimir Salaskin',
			'catalog.paintingNames.id1997_3' => 'Krieg der Welten (letztes Werk)',
			'catalog.paintingNames.id1997_4' => 'Selbstporträt',
			'catalog.paintingNames.id1997_5' => 'Sommer in Bogutschar',
			'catalog.paintingNames.id1997_6' => 'Zwei Witwen',
			'catalog.paintingNames.idunknown_1' => 'Hochwasser',
			'catalog.paintingNames.idunknown_2' => 'Frauenporträt',
			'catalog.paintingNames.idunknown_3' => 'Blaue Dornen',
			'catalog.paintingNames.idunknown_4' => 'Nina',
			'catalog.paintingNames.idunknown_5' => 'Nina',
			'common.pageNotFound' => 'Seite nicht gefunden',
			'language.label' => 'Sprache',
			'language.russian' => 'Russisch',
			'language.english' => 'Englisch',
			'language.spanish' => 'Spanisch',
			'language.french' => 'Franzosisch',
			'language.german' => 'Deutsch',
			_ => null,
		};
	}
}
