import 'package:flutter/material.dart';
import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/views/gamescreen.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'other_page.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  // Get the screen size
  final size = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size;
  // Get the smaller dimension (width or height)
  final minDimension = size.shortestSide;

  // Create a GameController instance with the minDimension passed as a parameter

  final cellSize = (minDimension/18) - ((minDimension/18) % 4);
  print(cellSize);
  
  final offsetX = (size.width - (cellSize * 16)) / 2;

  final gameController = GameController(cellHeight: cellSize, cellWidth: cellSize, offsetX: offsetX, offsetY: 100);

  runApp(
    ChangeNotifierProvider(
      create: (context) => gameController,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const GameScreen(),
    );
  }
}