import 'package:web_art_galery/src/features/archive/domain/entities/archive_news_item.dart';
import 'package:web_art_galery/src/features/archive/domain/repository/archive_repository.dart';
import 'package:web_art_galery/src/shared/config/app_colors.dart';

/// In-memory [ArchiveRepository] backed by a curated, hard-coded catalogue.
///
/// Entries are returned in display order — newest first — so the section
/// renders the most recent publication as the featured card. Each entry's
/// gradient pair is sourced from [AppColors] so the design system stays
/// the single source of truth for color.
class ArchiveRepositoryLocal implements ArchiveRepository {
  const ArchiveRepositoryLocal();

  @override
  Future<List<ArchiveNewsItem>> fetchAll() async => _items;

  static final List<ArchiveNewsItem> _items = <ArchiveNewsItem>[
    ArchiveNewsItem(
      key: 'priorbankChtobyChuvstvovat',
      url: 'https://www.priorbank.by/priorbank-main/art',
      date: DateTime(2026, 4, 10),
      host: 'priorbank.by',
      accent: AppColors.archiveAccentBluePrimary,
      accentSecondary: AppColors.archiveAccentBlueSecondary,
    ),
    ArchiveNewsItem(
      key: 'boguchar2026',
      url: 'https://boguchar.bezformata.com/listnews/ekskursiya-istoriya/156791600/',
      date: DateTime(2026, 2, 19),
      host: 'bezformata.com',
      accent: AppColors.archiveAccentTerracottaPrimary,
      accentSecondary: AppColors.archiveAccentTerracottaSecondary,
    ),
    ArchiveNewsItem(
      key: 'nitiSudby',
      url: 'https://mkram.ru/ru/2025/07/14/aleksandr-kishhenko-2/',
      date: DateTime(2025, 7, 19),
      host: 'mkram.ru',
      accent: AppColors.archiveAccentRustPrimary,
      accentSecondary: AppColors.archiveAccentRustSecondary,
    ),
    ArchiveNewsItem(
      key: 'belgazprombankKraskiPobedy',
      url:
          'https://belgazprombank.by/about/press_centr/novosti_banka/2024/belgazprombank-priglashaet-na-vystavku-kraski-velikoy-pobedy/',
      date: DateTime(2024, 6, 28),
      host: 'belgazprombank.by',
      accent: AppColors.archiveAccentCrimsonPrimary,
      accentSecondary: AppColors.archiveAccentCrimsonSecondary,
    ),
    ArchiveNewsItem(
      key: 'boguchar2024',
      url:
          'https://boguchar.bezformata.com/listnews/ekskursiya-istoriya-zhizni-a-m-kishenko/131561835/',
      date: DateTime(2024, 9, 1),
      host: 'bezformata.com',
      accent: AppColors.archiveAccentAmberPrimary,
      accentSecondary: AppColors.archiveAccentAmberSecondary,
    ),
    ArchiveNewsItem(
      key: 'nebaZiamlja',
      url: 'https://artmuseum.by/ru/events-news/neba-i-ziamlia-aliaksandra-kishchanki',
      date: DateTime(2023, 5, 6),
      host: 'artmuseum.by',
      accent: AppColors.archiveAccentSagePrimary,
      accentSecondary: AppColors.archiveAccentSageSecondary,
    ),
  ];
}
