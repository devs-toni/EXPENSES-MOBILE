// ignore_for_file: avoid_print

class LoggerDegub {
  static void warning(String text) {
    print('\x1B[33m$text\x1B[0m');
  }

  static void error(String text) {
    print('\x1B[31m$text\x1B[0m');
  }
}
