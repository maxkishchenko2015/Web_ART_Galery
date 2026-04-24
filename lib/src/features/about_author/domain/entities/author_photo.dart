/// A single photo belonging to the "About the Author" page.
///
/// The value stored in [url] may be either an absolute URL (e.g. an ImageKit
/// CDN link) or a relative path that the presentation layer will resolve
/// against the configured ImageKit endpoint.
class AuthorPhoto {
  const AuthorPhoto({required this.url});

  final String url;

  bool get isEmpty => url.trim().isEmpty;

  @override
  String toString() => 'AuthorPhoto{url: $url}';
}
