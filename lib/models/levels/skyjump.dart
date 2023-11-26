// ignore_for_file: overridden_fields

import 'package:monster_maze/models/level.dart';

class SkyJump extends Level {

  SkyJump() {
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
  String startingText = "You stand at the end of a large expanse of cliffs that you must jump across";

  @override
  String endingText = "You made it across the cliffs!";

  @override
  int level = 1;

  // the descent
  List<String> section1 = [
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaawaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "paaaaaaabaaaaaabaaajaaaaa",
    "ĞĞĞgggaggaggaaggaaggggaĞa",
    "aaagaaaaaaaaaaaaaaagggaaa",
    "aaaaaaaaaaaaaaaaaaaaggaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "Ğgaaaaaaaaaaaaaaaaaaaaaaa",
    "agaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
  ];

  List<String> section2 = [
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaawaaaawaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaagaagagaaaaaaaaaaaaaaa",
    "aaaagaaaaaagaaaagaaagaaag",
    "aaĞaaaaaaaaaaaaaaafaaaaaa",
    "Ğaaagaaaaaaaaagaaagaaagaa",
    "aaaaaagaaa1aaaaaaaaaaaaaa",
    "aaaaaaaaagggaaaagaaagaaag",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaggaaagaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
  ];

  List<String> section3 = [
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaajajaaaaaaaaa",
    "aaaaaaaaaaaagggggagagaaaa",
    "aaaaaaaaaaaaaaaaaaaaaagaa",
    "ggamaaamaggaaaaaaaaaaaaag",
    "agggggggggaaaaaaaaaaaaaaa",
    "aagggagggaaaaaaaaaaaaaaaa",
    "aaagaaagaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
  ];

  List<String> section4 = [
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaĞaaaaaaaaaaa",
    "aaaaaaaĞaaaaaaaaaagagagaa",
    "aĞaaĞaaaaaĞaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaĞaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
  ];

  List<String> section5 = [
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaawaaaawaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aagaaaaaaaaaaaaaaaaaaaaaa",
    "a1aaaaagaagaaaaaaaaaaaaaa",
    "aaaaagggaaggaaaaaaaaaaaaa",
    "aaaaggggaĞĞĞaaaaaaaaaaaaa",
    "aaaagggaaaaagaaaaaaaaaaaa",
    "aaaaaaaagaaagaaaaaaaaaaaa",
    "aaaaaagggaaaggaaaaaaaaaaa",
    "gagaĞĞĞĞĞĞĞĞĞĞaaggaaggaag",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaggggggggaaaaaaaaaaaa",
    "aaaaaaggggggaaaaaaaaaaaaa",
  ];

  List<String> section6 = [
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaajaaaaaaaaaaa",
    "aaaaaaaaaaaaaĞbaaaaaaaaaa",
    "aaaaaaaajaaaĞaĞaaajaaaaaa",
    "aaaaaaaaĞaaaaaaaaaĞaaaaaa",
    "aaajaaaĞaĞaaaaaaaĞaĞaaaaa",
    "aaaĞaaaaaaaaaaaaaaaaaaaja",
    "gaĞaĞaaaaaaaaaaaaaaaaaggg",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
  ];

}