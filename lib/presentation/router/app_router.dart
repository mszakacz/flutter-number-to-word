import 'package:flutter/material.dart';
import 'package:flutter_number_to_word/presentation/screens/converter_screen.dart';
import 'package:flutter_number_to_word/presentation/screens/settings_screen.dart';

class AppRouter {
  Route? onGenerateRout(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const ConverterScreen(
            title: "Number To Word Converter",
          ),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(
            title: "Settings",
          ),
        );
      default:
        return null;
    }
  }
}
