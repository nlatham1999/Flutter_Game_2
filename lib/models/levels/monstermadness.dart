// ignore_for_file: overridden_fields

import 'package:my_app/models/level.dart';

class MonsterMadness extends Level {

  MonsterMadness() {
    for (int i = 0; i < mapTemplate.length; i++){
      mapTemplate[i] += section1[i];
      mapTemplate[i] += section2[i];
      mapTemplate[i] += section3[i];
      mapTemplate[i] += section4[i];
      mapTemplate[i] += section5[i];
      mapTemplate[i] += section6[i];
    }
  }

  @override
  List<String> mapTemplate = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  @override 
  String startingText = "You are at the edge of a large plain filled will monsters of all shapes and sizes. How fast can you make it across?";

  @override
  String endingText = "You made it across!";

  @override
  int level = 1;

  // the descent
  List<String> section1 = [
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaamaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaamaaaaaaa",
    "paaaaggggg^^aaaaa^gaamaga",
    "aaagggaaaggg&&&&&gggggggg",
    "gggggaaaaaggggggggggggggg",
  ];

  List<String> section2 = [
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaagaggag",
    "aaaaaaaaaaggaaaaaaggaaasa",
    "ajaaaaggaaggaaggaaaaagaaa",
    "ggggaaggaaggaaggaaggggggg",
  ];

  List<String> section3 = [
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaa1aaa",
    "aaaaaaaaaagLaaaagaaaagaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaagaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaagaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "gaggaaagaaaaaaaaaaaaaaaaa",
    "aaaaaaaamaamamaaabababaaa",
    "aaagg&&&&&&&&&&&ggggggaaa",
    "ggggggggggggggggggggggggg",
  ];

  List<String> section4 = [
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaajaaaaaa",
    "aaaaaaaaggggaaaaagggaaaaa",
    "aaaaaagagggiaaaaaaaaaaaaa",
    "aaaggggagaaasaaaagggaaaaa",
    "aagggggaaaaaaaaaagggggggg",
    "ggggggggggggggggggggggggg",
  ];

  List<String> section5 = [
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaagaaaga",
    "aamamamamaagaaaaaaaaaaaaa",
    "a^^^^^^^^^gggaaaaaaaaaaaa",
    "ggggggggggggggglaaaaaaaaa",
    "ggggggggggggggggaaaaaaaaa",
  ];

  List<String> section6 = [
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaawaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaawaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaagaaa",
    "aaggaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaagaaaaaa",
    "aaaaaaaaaaaaaaagaaaaaaaaa",
    "aaaaajaajaajaaaamaamaaaaa",
    "aaagggggggggggggggggggggg",
  ];

}