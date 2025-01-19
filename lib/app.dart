import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/home/home_screen.dart';
import 'ui/core/themes/light.dart' as light_theme;
import 'ui/core//themes/dark.dart' as dark_theme;

class TangerineApp extends StatelessWidget {
  const TangerineApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '🍊 Tangerine',
      theme: ThemeData(
        colorScheme: light_theme.colorScheme,
        textTheme: GoogleFonts.tekturTextTheme(),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: dark_theme.colorScheme,
        useMaterial3: true,
        textTheme: GoogleFonts.tekturTextTheme(),
      ),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
