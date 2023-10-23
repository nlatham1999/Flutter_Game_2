// ignore_for_file: overridden_fields

import 'package:my_app/models/level.dart';

class SpookyCave extends Level {
  @override
  List<String> mapTemplate = [
    "aggĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞgggggggggggggggggggĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaggggggggggaaaaaagggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaagaaaaaaaaaaaaaaaaggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "paaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaggggaaagaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "ĞĞaaaggĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞaaaggggggggggĞĞĞĞaaagggggggggggggggĞĞĞĞĞĞĞĞĞggggggggg",
    "aagaaggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaagggggggggggaaaagaaaaaaaaaaaaaaaaaaaaaaaaaaggggggggg",
    "aaggaagaaaaaaaaaaaaaaaaaaaaaaaaaaaagaaaaaaaaaaaaaaaaggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aagggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaagaaaaaaaaaaaaaaaagggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞaaggggggggggggggĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞggaaagĞĞĞĞĞĞaaaaaaaaaaaaaaaagggggaaaaaaaggggg",
    "aaaaaagaaaaaaaaaaaggggaaaaaaaaaaaaaaaaaaaaaaaaaggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaggggggggg",
    "aaaaaagaaaaaaaaaaaaaggaaaaaaaaaaaaaaaaaaaaaaaaaggaaaaaaaaaaaaaaaaaaaaaaaaaaaaggggggggggg",
    "aaaaaaggggggggggggaaaaaaaaaaaaaaaaaaaaaaaaaaaggggaaaaaaaaaaaaaaaaaaaaagggggggggggggggggg",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞaaaaagggggggggggggaaaaaaaĞĞĞĞĞĞĞĞĞĞaaaaaaaaaaaaaaaĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaaaaaaggaaaaaaaaaaaaaaaaaaaagggaaaaaaaaaaaaaaaaaaaaaaaagaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaggggaaaaaaaaaaaaaagggggggaaaaaaaaaaaaaaaaaaaaaaaagaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaagggggggggggggggggggggggggaaaaaaaaaagggggggggggggggaaaaaaaaaaaaaaaaaa",
  ];

  @override 
  String startingText = "Your journey takes you to the entrance of a large cave. Inside of which you have heard there are may ghosts and fire breathing monsters";

  @override
  String endingText = "You made it through the cave!";

  @override
  int level = 1;

}