// ignore_for_file: overridden_fields

import 'package:my_app/models/level.dart';

class TestLevel extends Level {
  @override
  List<String> mapTemplate = [
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "paaaaaaamaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aagaggggggaaaaaaaaaaaaaaaaaa",
    "aaaaaaabaaaaaaaaaaaaaaaaaaaa",
    "aagaamaaaaagaaaaaaaaaaaaaaaa",
    "gggggggggggggggggggggggggggg",
  ];

  @override 
  String startingText = "You find yourself in a strange world and you're not quite sure how you got there. One thing you do know though, you need to reach the end of this level";

  @override
  String endingText = "CONGRATS! You reached the end, the journey continues";

  @override
  int level = 1;

}