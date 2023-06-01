
import 'package:my_app/models/level.dart';

class LevelDynamic extends Level {

  @override
  List<String> mapTemplate = [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "gggggggggggggggg",
  ];

  List<String> easy_a = [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaJa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaJaaaa",
    "aaaaaJaaaaaaaaaa",
    "aaaaaaaaJaaaaaaa",
    "aaJaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "gggggggggggggggg",
  ];

  List<String> easy_b = [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aagaaamaaaagabga",
    "gggggggggggggggg",
  ];

  List<String> easy_c = [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aggggggggggggggg",
    "aiiiiiiiiiiiiiia",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "gggggggggggggggg",
  ];

  List<String> easy_d = [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaabaabaabaabaa",
    "aaaĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aagaaaaaaaaaaaaa",
    "aggaaaaaaaaaaaaa",
    "gggaaaaaaaaaaaaa",
  ];

  List<String> moderate_a = [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaĞaaaajaaaaaaaa",
    "aaaaaaggĞaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaggaaaaaaaaaaa",
    "aaĞabaaaaaaaaaaa",
    "aaaaaaggĞaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaggaaaaaaaaaaa",
    "aaaaaaaaaaaamaga",
    "gggggggggggggggg",
  ];

  List<String> moderate_b = [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaĞaaamjaaaaaaaa",
    "aaaaaagggggaaaaa",
    "aaaaaaaaiiiaaaaa",
    "aaaggaaaaaaaaaaa",
    "aagabaaaaabaaaaa",
    "aaaaaaggĞggaaaaa",
    "aagaaaaaaaaaaaaa",
    "aagggaaaaaaaaaaa",
    "aaaaaaaaaaaamaga",
    "gggggggggggggggg",
  ];



  LevelDynamic(){
    mapTemplate = moderate_b;
    String row = mapTemplate[14];

    List<String> characters = row.split('');
    characters[0] = 'p';

    mapTemplate[14] = characters.join('');
  }

  
  @override
  String endingText = "CONGRATS! You reached the end, the journey continues";



}