import 'package:flutter/material.dart';
import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/views/gamescreen.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'other_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cube World',
      theme: themeData,
      home: const GameScreen(),
    );
  }
}

const TextStyle monoTextStyle = TextStyle(
  fontFamily: 'SpaceMono',
);

final ThemeData themeData = ThemeData(
  primarySwatch: Colors.indigo,
  textTheme: const TextTheme(
    bodyLarge: monoTextStyle,
    bodyMedium: monoTextStyle,
    labelLarge: monoTextStyle,
    bodySmall: monoTextStyle,
    displayLarge: monoTextStyle,
    displayMedium: monoTextStyle,
    displaySmall: monoTextStyle,
    headlineMedium: monoTextStyle,
    headlineSmall: monoTextStyle,
    titleLarge: monoTextStyle,
    labelSmall: monoTextStyle,
    titleMedium: monoTextStyle,
    titleSmall: monoTextStyle,
  ),
);
