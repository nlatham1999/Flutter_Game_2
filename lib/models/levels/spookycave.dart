// ignore_for_file: overridden_fields

import 'package:my_app/models/level.dart';

class SpookyCave extends Level {

  SpookyCave() {
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
    "aaaaaaaaaaaaaaaamamaaaggg",
    "ĞĞĞĞĞĞĞgggaaaaaaaaaafggĞĞ",
    "aaaaaaaggaaagagagagagggaa",
    "aaaaaaagaagaaaaaaaaaaagaa",
    "aaaaaaaaaggaaaaaaaaaaaaaa",
    "ĞgggggabĞĞĞĞĞĞĞĞggggaaagĞ",
    "aaaaaaagaaaaaaaagggaaagga",
    "a1ababggaaaaaaaagaaaaagga",
    "agggggggaaaaaaaaaaaagggga",
    "ggggggggggggaaaaaaaaĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaaagggaaaaa",
    "aaaaaaaaaaaaagggggggaaaaa",
    "ggggggggggggggggggggaaaaa",
  ];

  List<String> section3 = [
    "gggggĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aagggaaaaaaaaaaaaaaaaaaaa",
    "aaaggaaaaaaaaaaaaaaaaaaaa",
    "gaaagaaaaaaaaaaaaaaaaaaaa",
    "ĞĞaaaggggIggIgggggggĞĞĞĞĞ",
    "aagaaaagIaggagIIgIgaaaaaa",
    "aaggaaaIaagIaIaagaiaaaaaa",
    "aaggaaaaaaIaaaaagaaaaaaaa",
    "ĞĞĞĞgaaaaaaaaawaIaaaagggg",
    "aaaagaaaawaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaagggg",
    "ĞĞĞggaaaaaaaaaaaaaaaĞĞĞĞĞ",
    "aaaggaaaaggagaaaaaaagaaaaa",
    "aaaaaaagaaaaggaaamagaaaaa",
    "aaagggggggggggggggggaaaaa",
  ];

  List<String> section4 = [
    "ĞĞĞĞĞĞĞggggggĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaggaaaaaaaaaaaa",
    "aaaaaaaaawaagaaaaaaaaaaaa",
    "aaaaaaaaawwaaaaaaaaaaaaaa",
    "ĞĞĞĞgggaagggggggggggĞĞĞĞĞ",
    "aaaagggagggggaagggggaaaaa",
    "aaaagaaaag1aaaaaaaagaaaaa",
    "aaaaaaaaaagaaaaaaaaaaaaaa",
    "gaaaaaaaaaaagaagaaaagĞĞĞĞ",
    "aaaaaaaaaaaaaaaaaagaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "ggaaLaaaaaaaLaaagaaagaaaa",
    "ĞĞĞaaaaaaaaaaaaaaagaggggg",
    "aaaaasaaaaaasaaaaaaagaaaa",
    "aaaaaaaaaaaaaaaaaggaaagaa",
    "aaggggggggggggggggggggggg",
  ];

  List<String> section5 = [
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞggggggggggĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaggIggagaaaaaaaaaa",
    "aaaaaaaaagaaawaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaggaaaaaa",
    "ĞĞĞĞggaaaaaaaaaggggggĞggĞ",
    "aaaaIgaafaaaaagggggggagga",
    "aaaaaaaagaagaaaagggggagga",
    "aaaaaaaaaaagaaaaaaaaaabba",
    "ggggaagagĞĞĞaaamabĞĞaaaaa",
    "aaaaaaaagaaaggggggaaggaag",
    "aaaagggggaaaggggggaaggggg",
    "gggggggggaaaggggggaaggggg",
  ];

  List<String> section6 = [
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞgaaagĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaabb1aaaaaaaaaaaaaaaa",
    "aaaaaaagggaaaaaaaaaaaaaaaa",
    "ĞĞĞĞgaagggĞĞgggaaggaaaaggg",
    "aaaagaaaaaaaaaaaaaaaaaaaaa",
    "aaaaglaaaaaaaaaaSaasaaaaaa",
    "aaaaaaaaaaaaagaaaaaaaaaggg",
    "paaaaaaaggaaaĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "gaaaaaaaaaaagaaaaaaaaaaaaa",
    "ggaammaggaaagaaaaaaaaaaaaa",
    "gggggggggggggaaaaaaaaaaaaa",
  ];

}