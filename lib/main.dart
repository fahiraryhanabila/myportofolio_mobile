import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const ink = Color(0xFF6D2932);   
    const paper = Color(0xFFFFFDF1); 
    const accent = Color(0xFF3C2A21); 

    return MaterialApp(
      title: 'MyPortfolio',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: paper,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ink,
          primary: ink,
          onPrimary: paper,
          secondary: accent,
          surface: paper,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4), // --radius
            side: const BorderSide(color: Color(0xFF412D15), width: 0.5), // --line
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}