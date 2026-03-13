import 'package:logger/logger.dart';

class AppLogger {
  const AppLogger._();

  static final Logger instance = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      printEmojis: false,
    ),
  );
}
