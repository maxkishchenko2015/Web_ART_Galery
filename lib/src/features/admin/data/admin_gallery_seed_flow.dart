import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:web_art_galery/src/shared/config/firebase/firestore_collections.dart';
import 'package:web_art_galery/src/shared/utils/app_logger.dart';

class AdminGallerySeedFlow {
  AdminGallerySeedFlow({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Future<void> uploadAllPictures() async {
    if (Firebase.apps.isEmpty) {
      throw StateError('Firebase is not initialized.');
    }

    final rows = _parseRows(kGallerySeedRawData);
    final countersByYear = <String, int>{};

    final galleryList = rows
        .map((row) {
          final yearKey = _yearKey(row.yearRaw);
          final nextNumber = (countersByYear[yearKey] ?? 0) + 1;
          countersByYear[yearKey] = nextNumber;
          final pictureId = '$yearKey.$nextNumber';
          final yearOfCreation = int.tryParse(yearKey) ?? 0;

          return <String, dynamic>{
            'pictureId': pictureId,
            'name': row.name,
            'year': yearKey,
            'year_of_creation': yearOfCreation,
            'size': '${row.material}, ${row.size}',
            'painted_on_and_how': '${row.material}, ${row.size}',
            'material': row.material,
            'size_raw': row.size,
            'picture': '',
            'image_url': '',
          };
        })
        .toList(growable: false);

    // Write each painting as an individual document in the subcollection used
    // for Firestore cursor pagination (GaleryItems).
    final itemsCollectionRef = _firestore
        .collection(FirestoreCollections.paintings)
        .doc(FirestoreCollections.paintingsDocumentId)
        .collection(FirestoreCollections.paintingsItemsCollection);

    // Firestore batches are limited to 500 ops; paintings fit well within that.
    final batch = _firestore.batch();
    for (final item in galleryList) {
      final pictureId = item['pictureId'] as String;
      batch.set(itemsCollectionRef.doc(pictureId), item, SetOptions(merge: true));
    }
    await batch.commit();

    await _firestore
        .collection(FirestoreCollections.paintings)
        .doc(FirestoreCollections.paintingsDocumentId)
        .set(<String, dynamic>{
          FirestoreCollections.paintingsListField: galleryList,
        }, SetOptions(merge: true));

    AppLogger.instance.i('Admin seed upload completed: ${galleryList.length} artworks uploaded.');
  }

  List<_SeedRow> _parseRows(String raw) {
    final rows = <_SeedRow>[];

    for (final rawLine in raw.split('\n')) {
      final line = rawLine.trim();
      if (line.isEmpty) {
        continue;
      }

      final columns = line.split(RegExp(r'\t+'));
      if (columns.length < 4) {
        AppLogger.instance.w('Skipped malformed row: $line');
        continue;
      }

      rows.add(
        _SeedRow(
          name: columns[0].trim(),
          yearRaw: columns[1].trim(),
          material: columns[2].trim(),
          size: columns[3].trim(),
        ),
      );
    }

    return rows;
  }

  /// One-time migration: reads paintings from the legacy [GaleryList] array field
  /// and writes each one as an individual document in the [GaleryItems] subcollection
  /// used by Firestore cursor pagination.
  ///
  /// Safe to run multiple times — uses merge:true so existing documents are updated.
  Future<void> migrateToSubcollection() async {
    if (Firebase.apps.isEmpty) {
      throw StateError('Firebase is not initialized.');
    }

    final docRef = _firestore
        .collection(FirestoreCollections.paintings)
        .doc(FirestoreCollections.paintingsDocumentId);

    final snapshot = await docRef.get();
    final data = snapshot.data();
    if (data == null) {
      AppLogger.instance.w('Migration aborted: paintings document not found.');
      return;
    }

    final rawList =
        (data[FirestoreCollections.paintingsListField] as List<dynamic>?) ?? const <dynamic>[];

    final items = rawList.whereType<Map<String, dynamic>>().toList();
    if (items.isEmpty) {
      AppLogger.instance.w('Migration aborted: GaleryList array is empty.');
      return;
    }

    final itemsCollectionRef = docRef.collection(FirestoreCollections.paintingsItemsCollection);

    // Firestore batch limit is 500; split into chunks if needed.
    const chunkSize = 400;
    for (var offset = 0; offset < items.length; offset += chunkSize) {
      final chunk = items.skip(offset).take(chunkSize);
      final batch = _firestore.batch();
      for (final item in chunk) {
        final rawPictureId = item['pictureId'] as String?;
        if (rawPictureId == null || rawPictureId.trim().isEmpty) continue;
        final pictureId = rawPictureId.trim();
        final yearRaw = item['year'] as String? ?? '';
        final yearOfCreation = int.tryParse(yearRaw) ?? 0;
        final merged = <String, dynamic>{
          ...item,
          'pictureId': pictureId,
          'year_of_creation': yearOfCreation,
          'painted_on_and_how': item['painted_on_and_how'] ?? item['size'] ?? '',
          'image_url': item['image_url'] ?? item['picture'] ?? '',
        };
        batch.set(itemsCollectionRef.doc(pictureId), merged, SetOptions(merge: true));
      }
      await batch.commit();
    }

    AppLogger.instance.i('Migration completed: ${items.length} paintings written to GaleryItems.');
  }

  String _yearKey(String yearRaw) {
    final match = RegExp(r'(\d{4})').firstMatch(yearRaw);
    return match?.group(1) ?? 'unknown';
  }
}

class _SeedRow {
  const _SeedRow({
    required this.name,
    required this.yearRaw,
    required this.material,
    required this.size,
  });

  final String name;
  final String yearRaw;
  final String material;
  final String size;
}

const String kGallerySeedRawData = '''Окраина. Старая мельница	1958	Холст, масло	80*100
Ангелина	1958	Холст, масло	60*40
Туалет	1958	ДВП, масло	43,5*34,5
Женский портрет	1959	Холст, масло	100*70
Композиция №1	1960	Холст, масло	100*80
Женский портрет в зеленой гамме	1960	Холст, масло	100*95,5
Первый снег	1960	Холст, масло	100*80
Женщина в кресле	1960	Холст, масло	70*80
Портрет художника Владимира Урищенко	1960	ДВП, масло	70*50
Девочка с бантом	1960	Холст, масло	100*90
Женский портрет	1960	Холст, масло	80*70
Женский портрет	1960	Холст, масло	92*65
Северянка (Женщина с севера)	1962	Холст, масло	85*85
Женский портрет	1965	Холст, масло	80*70
Цирковой мальчик	1965	Холст, масло	85*85
Искушение	1965	Холст, масло	120*116
Зоя Литвинова	1967	Холст, масло	64*54
Две жизни	1967	Холст, масло	70*90
Натюрморт с грушами	1968	Холст, масло	180*120
Ангел	1969	ДВП, масло	160*110
Учительница	1970	Холст, масло	170*120,5
Последний севастополец	1970	Холст, масло	60*91
Портрет Жени Мусинской	1972	Холст, масло	80*60
Девушка в русском костюме	1974	Холст, масло	200*80
Первенец	1975	Холст, масло	80*60
Девушка в красном с золотом (Зеленый виноград)	1976	Холст, масло	80*70
Мать с ребенком	1979	Холст, масло	90*60
Наташа	1979	Холст, масло	55*46
Убийство семьи Громовых. Действие 1943. Тамань.	1979	Холст, масло	120*140
Эскиз к работе "Боль поэта"	1979	Холст, масло	100*80
Радость. Материнство	1979	Холст, масло	90*96
Фрагмент к картине "Мед"	1980	Холст, масло	80*60
Портрет мамы	1980	Холст, масло	54*39
Нина	1980	Картон	50*35
Наташа Марченко	1980	Холст, масло	50*35
Наташа	1980	Холст, масло	100*75
Раздумье	1981	Холст, масло	116*114
Портрет Елены Образцовой	1981	Холст, масло	90*70
Автопортрет	1982	Холст, масло	40*40
Адам и Ева	1982	Холст, масло	97*97
Осквернение храма	1982	Холст, масло	114*114
Мракобесы	1982	Холст, масло	147*300
Подсолнухи	1982	Холст, масло	100*115
Пейзаж	1982	Холст, масло	21*48
Мадонна	1983	ДВП, масло	60*40
Заговор (Клятва масонов)	1983	Холст, масло	250*200
Нина	1983	Холст, масло	40*40
Портрет Марии Биешу	1983	Холст, масло	100*80
Зов моря	1983	Холст, масло	170*300
Плач	1983	Холст, масло	97,5*73,5
Наташа	1983	Холст, масло	100*73
Нина	1984	Холст, масло	51*39
Нина	1984	Холст, масло	89,5*73
Дядя Ваня	1985	Холст, масло	50*40
Девочка в красной шляпе	1985	Холст, масло	53*46
Женский образ. Наташа Татаренко	1985	ДВП, масло	70*50
Мужской портрет	1985	ДВП, масло	70*50
Летний душ	1985	Холст, масло	78,5*59
Портрет девочки	1986	Холст, масло	57,5*40
Портрет кинооператора А. Абадовского	1986	Холст, масло	80*60
Последние дни сентября	1986	Холст, масло	170*180
Портрет Бущика	1986	Холст, масло	40,5*30
Портрет Наташи Марченко	1986	Холст, масло	120*100
Он будет жить. Чернобыль	1987	Холст, масло	100*79,5
Женский портрет	1987	Холст, масло	79,5*60
Портрет Маши	1988	Холст, масло	80*60
Мужская голова	1988	Холст, масло	63*53,5
Профиль	1988	Холст, масло	120*120
Идущая	1988	Холст, масло	56,5*38
На берегу Дона	1989	Холст, масло	120*60
Утро	1989	ДВП, масло	50*30
Портрет художницы Тамары Кирщиной	1989	Холст, масло	80*60
Обнаженная в пространстве музыка	1989	Холст, масло	120*230
Идущая (Вселенная)	1989	Холст, масло	190*119
Нина	1989	Холст, масло	49,5*40
Брат и сестра Елькины	1989	Холст, масло	68*87,5
Нина	1989	Холст, масло	80*60
Обнаженная	1989	Холст, масло	40*60
В пространстве (Обнаженная)	1990	Холст, масло	120*200
Дары планет	1990	Холст, масло	88*102
Зоя	1990	Холст, масло	60*40
Мужской портрет	1990	ДВП, масло	55*40
Девочка с медом (Вселенная)	1991	Холст, масло	139*119
Мечта	1991	Холст, масло	90*110
Вечная	1991	Холст, масло	100*100
Портрет с морской раковиной	1992	Холст, масло	63*85
Сатир и Нимфа	1992	Холст, масло	200*180
Мальчик с петухом	1992	Холст, масло	80*60
Нина и Максим	1992	Холст, масло	79*60
Русский мужик	1992	Холст, масло	100*140
Портрет Франца Коха	1992	Холст, масло	100*80
Нина	1992	Холст, масло	100*80
Ольга	1992	Холст, масло	57,5*68,5
Не балуйся, Максим!	1992	Холст, масло	180*100
Вечное	1993	Холст, масло	140*159
Портрет скульптура Лены Хараберюш	1993	Холст, масло	80*80
Аптекарь	1993	Холст, масло	97*89
Оля	1993	Холст, масло	120*120
Мать и дитя	1993	Холст, масло	68*53
Христос	1993	ДВП, масло	62*60
Наташа	1993	Холст, масло	60*60
Портрет неизвестной	1993	Холст, масло	58*44
Роман	1993	Холст, масло	60,5*40,5
Под созвездием Льва	1994	Холст, масло	139*119
Портрет Зои	1994	Холст, масло	138*80
Заброшенный двор	1994	Холст, масло	50*60
Наташа	1994	Холст, масло	108*93
Песня	1994	Холст, масло	119*100
Девочка с натюрмортом с яблоками	1994	Холст, масло	95*60
Кричащая	1994	Холст, масло	98*92
Наташа	1994	Холст, масло	70,5*50
Вакханалья	1994	Холст, масло	160*180
Маленький фантазер	1995	Холст, масло	120*120
Моя Родина	1995	Холст, масло	80*100
Ню	1995	Холст, масло	100*100
Ольга Колтакова	1995	Холст, масло	100*100
Тамара Кирщина со спины	1995	Холст, масло	80*60
Оля	1995	Холст, масло	80*60
Печаль	1995	Холст, масло	80*60
Портрет девочки	1995	Холст, масло	40,5*30,5
Вселенная	1995	Холст, масло	180*90
Леша	1995	Холст, масло	80*61
Портрет Ростикова	1995	Холст, масло	80*80
Искусствовед Надя	1995	Холст, масло	90*70
Мелодия	1995	Холст, масло	81*51
Таня	1995	Холст, масло	101*81
Эскиз картины «Портрет Нины»	1995	ДВП, масло	35*43
Натюрморт	1995	Холст, масло	25*28
Натюрморт с яблоками	1996	Холст, масло	120*110
Обнаженная	1996	Холст, масло	180*80
Максим с арбузом	1996	Холст, масло	80*72
Гимн (Восторг)	1996	Холст, масло	180*80
Нина	1996	Холст, масло	80*60
Инна	1996	Холст, масло	46*38
Алла Астахович	1996	Холст, масло	110*82
Лена	1996	Холст, масло	160*90
Женский портрет (Нина №1)	1996	Холст, масло	180*90
Вселен	1996	Холст, масло	140*100
Плывущие в лодке	1996	Холст, масло	225*120
Женский портрет с шалью	1996	Холст, масло	100*70
Мама	1996	Холст, масло	59,5*40
Филарет Минский	1996	Холст, масло	180*120
Натюрморт в пространстве	1996	Холст, масло	120*200
Портрет Кучинского	1996	Холст, масло	160*120
Женский портрет	1996	Холст, масло	81*60
Моя Вселенная	1996	Холст, масло	200*400
Иван	1997	Холст, масло	40*50
Портрет архитектора Владимира Салазкина	1997	Холст, масло	100*90
Война миров (последняя работа)	1997	Холст, масло	31*60,5
Автопортрет	1997	Холст, масло	46*38
Лето в Богучаре	1997	Холст, масло	100*95
Две вдовы	1997	Холст, масло	160*90
Ожидание	1960-1970	Холст, масло	70*50
На балконе	1990-1993	Холст, масло	200*80
Разлив	не изв.	Холст, масло	149*160
Женский портрет	не изв.	Холст, масло	43*35
Голубые колючки	не изв.	Холст, масло	80*60
Нина	не изв.	Холст, масло	42*39,5
Нина	не изв.	Холст, масло	48,5*38,5
Гобелен "Море" ("Волна")	1995	Шерсть, лен, ткачество	313*635
Гобелен "Подсолнухи"	1992	Шерсть, лен, ткачество	370*150''';
