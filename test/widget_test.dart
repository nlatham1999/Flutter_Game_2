// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:monster_maze/main.dart';
import 'package:monster_maze/models/level.dart';
import 'package:monster_maze/models/leveldynamic.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });


  testWidgets('Dynamic Level Test', (WidgetTester tester) async {
    Random random = Random();

    LevelDynamic level = LevelDynamic(useSeed: false, seed: 0);
    
    Map<String, int> occurances = {};
    
    for(int i = 0; i < 1000; i++){
      level.seed = random.nextInt(1000000);

      if(i % 100 == 0){
        print(i);
      }

      List<String> levelsAdded = level.constructLevels();

      for(String level in levelsAdded){
        if(occurances.containsKey(level)){
          occurances[level] = occurances[level]! + 1;
        }else{
          occurances[level] = 1;
        }
      }
    }

    List<String> sortedKeys = occurances.keys.toList()..sort();
    for (String key in sortedKeys) {
      if(occurances[key]! > 50){
        print("$key, ${occurances[key]!}");
      }
    }

  });


}
