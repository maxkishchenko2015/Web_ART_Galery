import 'package:latlong2/latlong.dart';

/// Static constants used by [ContactsPage] — external URLs, asset paths,
/// phone numbers, and the studio coordinates rendered on the map.
abstract final class ContactsPageConstants {
  const ContactsPageConstants._();

  // ── External URLs ───────────────────────────────────────────────────────

  static const String instagramUrl = 'https://www.instagram.com/kishchenko.art';
  static const String vkUrl = 'https://vk.ru/aleksandrkishchenko';
  static const String osmUrl =
      'https://www.openstreetmap.org/?mlat=53.927989&mlon=27.589894#map=18/53.927989/27.589894';

  // ── Phone numbers (display + tel: scheme) ──────────────────────────────

  static const String phone1Display = '+375 29 502 02 46';
  static const String phone1Tel = 'tel:+375295020246';
  static const String phone2Display = '+375 29 277 57 13';
  static const String phone2Tel = 'tel:+375292775713';

  // ── Studio map ──────────────────────────────────────────────────────────

  static const LatLng studioLatLng = LatLng(53.927989, 27.589894);
  static const String userAgentPackageName = 'by.kishchanka.web_art_galery';

  // ── Static assets ───────────────────────────────────────────────────────

  static const String instagramSvgAsset = 'assets/icons/instagram.svg';
  static const String vkSvgAsset = 'assets/icons/vk.svg';
  static const String vkQrAsset = 'assets/images/vk_qr.png';
}
