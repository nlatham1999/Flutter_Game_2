// ignore_for_file: overridden_fields

import 'package:my_app/models/level.dart';

class SpookyCave extends Level {

  SpookyCave() {
    for (int i = 0; i < mapTemplate.length; i++){
      mapTemplate[i] += section1[i];
      mapTemplate[i] += section2[i];
      // mapTemplate[i] += section3[i];
      // mapTemplate[i] += section4[i];
      // mapTemplate[i] += section5[i];
      // mapTemplate[i] += section6[i];
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
  String startingText = "Your journey takes you to the entrance of a large cave. Inside of which you have heard there are may ghosts and fire breathing monsters";

  @override
  String endingText = "You made it through the cave!";

  @override
  int level = 1;

  // the descent
  List<String> section1 = [
    "aggĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aggaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "paaaaaaaaaaaaaaaaaaaaaaaa",
    "ĞĞaaagggggggggggiigĞĞĞĞĞĞ",
    "aagaaagggggaaaaaaagaaaaaa",
    "aaggaagggaaaggaaaagaaaaaa",
    "aaggaaaaaaaggggaaa1aaaaaa",
    "ĞĞĞĞaĞaagaggaggaggagggĞĞĞ",
    "aaaaaagaaaaaaaaaaaagggaaa",
    "aaaaaaggaaaajaaaaaaaggaaa",
    "aaaaaagggaagggggggaaaaaaa",
    "ĞĞĞĞaaabaaĞĞĞĞaasaaĞĞaaaa",
    "aaaagaaaagaaaaaaaaaaggaaa",
    "aaaaggaaggaaaagggggagggga",
    "aaaaggggggaaaagggggaggggg",
  ];

  List<String> section2 = [
    "ĞĞĞĞĞĞĞĞĞĞĞgggggggggggggg",
    "aaaaaaaaaaaggggggggggaaaa",
    "aaaaaaaaaaagaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaggg",
    "ĞĞĞĞĞĞĞĞĞĞaaaggggggggggĞĞ",
    "aaaaaaaaaaaagggggggggggaa",
    "aaaaaaaaaagaaaaaaaaaaaaaa",
    "aaaaaaaaaagaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞggaaagĞ",
    "aaaaaaaaaaaaaaaaaaaaaagga",
    "aaaaaaaaaaaaaaaaaaaaaagga",
    "aaaaaaaaaaaaaaaaaaaagggga",
    "gggggggggggggaaaaaaaĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaaagggaaaaa",
    "aaaaaaaaaaaaagggggggaaaaa",
    "ggggggggggggggggggggaaaaa",
  ];

  List<String> section3 = [
    "gggggĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aagggaaaaaaaaaaaaaaaaaaaa",
    "aaaggaaaaaaaaaaaaaaaaaaaa",
    "gaaagaaaaaaaaaaaaaaaaaaaa",
    "ĞĞaaagggggggggggggggĞĞĞĞĞ",
    "aagaaaaaaaaaaaaaaaaaaaaaa",
    "aaggaaaaaaaaaaaaaaaaaaaaa",
    "aagggaaaaaaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞaaaaaaaaaaaaaaaagggg",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaggggg",
    "ĞĞĞĞĞaaaaaaaaaaaaaaaĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaaaaagaaaaa",
    "aaaaaaaaaaaaaaaaaaagaaaaa",
    "aaaaagggggggggggggggaaaaa",
  ];

  List<String> section4 = [
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "ĞĞĞĞggggggggggggggggĞĞĞĞĞ",
    "aaaaggggggggggggggggaaaaa",
    "aaaaaaaaaaaaaaaaaaagaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "gaaaaaaagggggĞĞĞĞĞĞaĞĞĞĞĞ",
    "aaaagggggggggaaaaaaaaaaaa",
    "aagggggggggggaaaaaaaaaaaa",
    "gggggggggggggaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞaggggg",
    "aaaaaaaaaaaaaaaaaaaagaaaa",
    "aaaaaaaaaaaaaaaaaaaaaagaa",
    "aaaaaaaaaaaaaaaaaaagggggg",
  ];

  List<String> section5 = [
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞggggggggggĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaggaaaaaa",
    "ĞĞĞĞĞgaaaaaaaaaggggggĞĞĞĞ",
    "aaaaagaaaaaaaagggggggaaaa",
    "aaaaagaaaaagaaaagggggaaaa",
    "aaaaaaaaaaagaaaaaaaaaaaaa",
    "ggggaaĞĞĞĞĞĞĞĞĞĞĞĞĞĞaaaaa",
    "aaaaagaaaaaaaaaaaaaaggaag",
    "aaaaggaaaaaaaaaaaaaaggggg",
    "ggggggaaaaaaaaaaaaaaggggg",
  ];

  List<String> section6 = [
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞgggggggaaaaggg",
    "aaaaaaaaaaaaggaagaaaaaaaaa",
    "aaaaaaaaaaaaggaagaagggaaaa",
    "aaaaaaaaaaaaaaaaaagggggaaa",
    "aaaaaaaaaaaaaĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "gaaaaaaaaaaagaaaaaaaaaaaaa",
    "gggaaaaggaaagaaaaaaaaaaaaa",
    "gggggggggggggaaaaaaaaaaaaa",
  ];

}