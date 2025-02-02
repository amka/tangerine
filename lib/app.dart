import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/home/home_screen.dart';
import 'ui/core/themes/light.dart' as light_theme;
import 'ui/core//themes/dark.dart' as dark_theme;

class TangerineApp extends StatelessWidget {
  const TangerineApp({super.key, required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '🍊 Tangerine',
      theme: ThemeData(
        colorScheme: light_theme.colorScheme,
        fontFamily: 'Noto Serif',
        fontFamilyFallback: ['Noto Sans'],
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: dark_theme.colorScheme,
        useMaterial3: true,
        fontFamily: 'Noto Serif',
        fontFamilyFallback: ['Noto Sans'],
      ),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
