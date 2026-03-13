import 'package:flutter_test/flutter_test.dart';
import 'package:web_art_galery/main.dart';

void main() {
  testWidgets('Initial route shows About author page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ArtGalleryApp());
    await tester.pumpAndSettle();

    expect(find.text('About author'), findsOneWidget);
  });
}
