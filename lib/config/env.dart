import 'dart:ui';

class System {
  static const supportedLocales = [
    Locale('en', 'EN'),
  ];

  static const mainLocale = Locale('en', 'EN');
}

class URL {
  // static const String baseUrl = 'http://192.168.137.1:8080';
  static const String baseUrl = 'https://api.test.coolroots.pixelfield.dev';
  // static const String baseUrl = 'http://10.81.17.51:8081';
  static const String apiUrl = '$baseUrl/api/';
}
