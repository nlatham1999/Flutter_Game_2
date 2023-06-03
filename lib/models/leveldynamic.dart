
// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:my_app/models/chunk.dart';
import 'package:my_app/models/level.dart';

class LevelDynamic extends Level { 
  LevelDynamic(){

    //our abstract syntaxt tree for generating levels
    //takes the format of [difficulty][map type][altitude]
    constructLevels();

  }

  List<String> constructLevels() {
    List<String> levelsAdded = [];
    Map<String,Map<String,Map<int,List<Chunk>>>> ast = {
      "easy": {
        "regular": {
          1: [easy_a,  easy_b,  easy_c, easy_d,   going_up_1_to_2, going_up_1_to_3, going_up_1_to_4,      cave_entrance_from_1_easy],
          2: [easy_a2, easy_b2, easy_c2, easy_d2, going_up_2_to_3, going_up_2_to_4, going_down_2_to_1,    cave_entrance_from_2_easy],
          3: [easy_a3, easy_b3, easy_c3, easy_d3, going_up_3_to_4, going_down_3_to_2,                     cave_entrance_from_3_easy],
          4: [easy_a4, easy_b4, easy_c4, easy_d4, going_down_4_to_3]
        },
        "cave": {
          3: [cave_exit_to_3_easy, cave_exit_to_2_easy, cave_exit_to_1_easy]
        }
      },
      "moderate": {
        "regular": {
          1: [moderate_a, moderate_b, moderate_c, moderate_d, going_up_1_to_2, going_up_1_to_3, going_up_1_to_4,         cave_entrance_from_1_moderate],
          2: [moderate_a2, moderate_b2, moderate_c2, moderate_d2, going_up_2_to_4, going_up_2_to_3, going_down_2_to_1,   cave_entrance_from_2_medium],
          3: [moderate_a3, moderate_b3, moderate_c3, moderate_d3, going_up_3_to_4, going_down_3_to_2,                    cave_entrance_from_3_moderate],
          4: [moderate_a4, moderate_b4, moderate_c4, moderate_d4, going_down_4_to_3]
        },
        "cave": {
          3: [cave_exit_to_3_moderate, cave_exit_to_2_moderate, cave_exit_to_1_moderate]
        }
      },
      "hard": {
        "regular": {
          1: [hard_a, hard_b, hard_c, hard_d, going_up_1_to_2, going_up_1_to_3, going_up_1_to_4,                cave_entrance_from_1_hard],
          2: [hard_a2, hard_b2, hard_c2, hard_d2, going_up_2_to_3, going_up_2_to_4, going_down_2_to_1,          cave_entrance_from_2_hard],
          3: [hard_a3, hard_b3, hard_c3, hard_d3, going_up_3_to_4, going_down_3_to_2,                           cave_entrance_from_3_hard],
          4: [hard_a4, hard_b4, hard_c4, hard_d4, going_down_4_to_3]
        },
        "cave": {
          3: [cave_exit_to_3_hard, cave_exit_to_2_hard, cave_exit_to_1_hard]
        }
      }
    };

    String difficulty = "easy";
    String type = "regular";
    int altitude = 1;
    Random random = Random();
    for(int i = 0; i < 15; i++){
      if(i >= 5 && i < 10){
        difficulty = "moderate";
      }
      if(i >= 10){
        difficulty = "hard";
      }

      List<Chunk> levels = ast[difficulty]![type]![altitude]!;
      int randomNumber = random.nextInt(levels.length);

      Chunk chunk = levels[randomNumber];
      
      levels.remove(chunk);
      ast[difficulty]![type]![altitude] = levels;

      if(chunk.slope == "down"){
        altitude--;
        if(altitude < 1){
          throw Exception("altitude less than 1");
        }
      }
      if(chunk.slope == "up"){
        altitude++;
        if(altitude > 4){
          throw Exception("altitude greater than 1");
        }
      }
      if(chunk.slope == "up2"){
        altitude += 2;
        if(altitude > 4){
          throw Exception("altitude greater than 4");
        }
      }
      if(chunk.slope == "up3"){
        altitude += 3;
        if(altitude > 4){
          throw Exception("altitude greater than 4");
        }
      }


      for(int j = 0; j < mapTemplate.length; j++){
        mapTemplate[j] = mapTemplate[j] + chunk.level[j];
      }

      // if(chunk.slope == "flat")
      // }

      type = chunk.type;

      // print(chunk.description);

      levelsAdded.add(chunk.description);
    }

    return levelsAdded;
  }
  
  @override
  String endingText = "CONGRATS! You reached the end, the journey continues";

  @override
  List<String> mapTemplate = [
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "a",
    "p",
    "g",
  ];


  

  Chunk easy_a = Chunk(description: "easy_a", slope: "flat", level: [
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
  ]);

  Chunk easy_a2 = Chunk(description: "easy_a2",slope: "flat", level: [
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
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk easy_a3 = Chunk(description: "easy_a3",slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaJa",
    "aaaaaaaaaaaJaaaa",
    "aaaaaJaaaaaaaaaa",
    "aaaaaaaaJaaaaaaa",
    "aaJaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk easy_a4 = Chunk(description: "easy_4",slope: "flat", level: [
    "aaaaaaaaaaaJaaJa",
    "aaaaaJaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaJaaaaaJaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
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
  ]);

  Chunk easy_b = Chunk(description: "easy_b", slope: "flat", level: [
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
  ]);
  
  Chunk easy_b2 = Chunk(description: "easy_b2", slope: "flat", level: [
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
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);
  
  Chunk easy_b3 = Chunk(description: "easy_b3",slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aagaaamaaaagabga",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk easy_b4 = Chunk(description: "easy_b4",slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aagaaamaaaagabga",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk easy_c = Chunk(description: "easy_c", slope: "flat", level: [
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
  ]);

  Chunk easy_c2 = Chunk(description: "easy_c2", slope: "flat", level: [
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
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);
  
  Chunk easy_c3 = Chunk(description: "easy_c3", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aggggggggggggggg",
    "aiiiiiiiiiiiiiia",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk easy_c4 = Chunk(description: "easy_c4", slope: "flat", level: [
    "aggggggggggggggg",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaamaaaaama",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk easy_d = Chunk(description: "easy_d", slope: "flat", level: [
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
    "aaaabaabaabaabaa",
    "gggggggggggggggg",
  ]);

  Chunk easy_d2 = Chunk(description: "easy_d2", slope: "flat", level: [
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
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk easy_d3 = Chunk(description: "easy_d3", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaabaabaabaabaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk easy_d4 = Chunk(description: "easy_d4", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaabaabaabaabaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk moderate_a = Chunk(description: "moderate_a", slope: "flat", level: [
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
  ]);

  Chunk moderate_a2 = Chunk(description: "moderate_a2", slope: "flat", level: [
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
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk moderate_a3 = Chunk(description: "moderate_a3", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaĞaaaajaaaaaaaa",
    "aaaaaaggĞaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaggaaaaaaaaaaa",
    "aaaabaaaaaaaaaaa",
    "ĞĞĞaaagggaaaaaaĞ",
    "aaaaaaaaaaaaaaga",
    "aaaggaaaaaaaggaa",
    "aaaaaaaaaaaamaga",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk moderate_a4 = Chunk(description: "moderate_a4", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaajaaaaaaaa",
    "ĞĞĞaaaggĞaaaaagĞ",
    "aaaaaaaaaaaaagaa",
    "aaaggaaaagaaaaaa",
    "aaaabaaaaagaaaaa",
    "ĞĞĞaaagggaaaaaaĞ",
    "aaaaaaaaaaaaaaga",
    "aaaggaaaaaaaggaa",
    "aaaaaaaaaaaamaga",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk moderate_b = Chunk(description: "moderate_b", slope: "flat", level: [
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
  ]);

  Chunk moderate_b2 = Chunk(description: "moderate_b2", slope: "flat", level: [
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
    "aajaaaajaaaajaaa",
    "aagaaaagaaaagaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk moderate_b3 = Chunk(description: "moderate_b3", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aajaaaajaaaajaaa",
    "aagaaaagaaaagaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);
  
  Chunk moderate_b4 = Chunk(description: "moderate_b4", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aajaaaajaaaajaaa",
    "aagaaaagaaaagaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

   Chunk moderate_c = Chunk(description: "moderate_c", slope: "flat", level: [
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
    "ggagagagagagagag",
  ]);

  Chunk moderate_c2 = Chunk(description: "moderate_c2", slope: "flat", level: [
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
    "ĞĞaĞaĞaĞaĞaĞaĞaĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);
  
  Chunk moderate_c3 = Chunk(description: "moderate_c3", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaĞaĞaĞaĞaĞaĞaĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaĞaĞaĞaĞaĞaĞaĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk moderate_c4 = Chunk(description: "moderate_c4", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaĞaĞaĞaĞaĞaĞaĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaĞaĞaĞaĞaĞaĞaĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaĞaĞaĞaĞaĞaĞaĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

 Chunk moderate_d = Chunk(description: "moderate_d", slope: "flat", level: [
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
    "aaaaaaaaaaaaagaa",
    "gaaggaaggaaggaag",
  ]);

  Chunk moderate_d2 = Chunk(description: "moderate_d2", slope: "flat", level: [
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
    "ĞaaĞĞaaĞĞaaĞĞaaĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

    Chunk moderate_d3 = Chunk(description: "moderate_d3", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞaaĞĞaaĞĞaaĞĞaaĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞaaĞĞaaĞĞaaĞĞaaĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk moderate_d4 = Chunk(description: "moderate_d4", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞaaĞĞaaĞĞaaĞĞaaĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞaaĞĞaaĞĞaaĞĞaaĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞaaĞĞaaĞĞaaĞĞaaĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk hard_a = Chunk(description: "hard_a", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "gggggggggggggggg",
    "iiiiiiiiiiiiiiii",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "gagagagagagagagg",
  ]);

  Chunk hard_a2 = Chunk(description: "hard_a2", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "gggggggggggggggg",
    "iiiiiiiiiiiiiiii",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞaĞaĞaĞaĞaĞaĞaĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk hard_a3 = Chunk(description: "hard_a3", slope: "flat", level: [
    "gggggggggggggggg",
    "iiiiiiiiiiiiiiii",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞaĞaĞaĞaĞaĞaĞaĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞaĞaĞaĞaĞaĞaĞaĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

   Chunk hard_a4 = Chunk(description: "hard_a4", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aabababababababb",
    "ĞaĞaĞaĞaĞaĞaĞaĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞaĞaĞaĞaĞaĞaĞaĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞaĞaĞaĞaĞaĞaĞaĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk hard_b = Chunk(description: "hard_b", slope: "flat", level: [
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
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
    "gaaaamaaaamaaaag",
    "gggggggggggggggg",
  ]);

  Chunk hard_b2 = Chunk(description: "hard_b2", slope: "flat", level: [
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
    "gaaaamaaaamaaaag",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);
  
  Chunk hard_b3 = Chunk(description: "hard_b3", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "gaaaamaaaamaaaag",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk hard_b4 = Chunk(description: "hard_b4", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "gaaaamaaaamaaaag",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk hard_c = Chunk(description: "hard_c", slope: "flat", level: [
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
    "agambamabaabamga",
    "aaggggggggggggaa",
  ]);

  Chunk hard_c2 = Chunk(description: "hard_c2", slope: "flat", level: [
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
    "ĞĞaaaaaaaaaaaaĞĞ",
    "aaaaaaaaaaaaaĞaa",
    "aaaaaaaaaaajaaaa",
    "aaaabaaamaaggaaa",
    "gggggggggggggagg",
  ]);

  Chunk hard_c3 = Chunk(description: "hard_c3", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaaggaaggaaaaaĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaga",
    "aaaaaaaaaaaaaaga",
    "ĞĞaaaaaaaaaaagĞĞ",
    "aaaaaaaaaaajagaa",
    "aaaaaaaamaagggaa",
    "aaggggggggggggaa",
  ]);

  Chunk hard_c4 = Chunk(description: "hard_c4", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaaggaaggaaaaaĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaga",
    "aaaaaaaaaaaaaaga",
    "ĞĞaaaaaaaaaaaĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaagaaa",
    "aaaaajaajaaaaaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk hard_d = Chunk(description: "hard_d", slope: "flat", level: [
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "iiiiiiiiiiiiiiii",
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
    "aamaagaagaaamaag",
    "ggggggaagggggggg",
  ]);

  Chunk hard_d2 = Chunk(description: "hard_d2", slope: "flat", level: [
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "iiiiiiiiiiiiiiii",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaaaaaaaaaaaaĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaagaa",
    "aaaaaaaamaaaggaa",
    "gggggggggggggggg",
  ]);

  Chunk hard_d3 = Chunk(description: "hard_d3", slope: "flat", level: [
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "iiiiiiiiiiiiiiii",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaja",
    "ĞĞaagaagaagaagĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaaaaaaaaaaaaĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk hard_d4 = Chunk(description: "hard_d4", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaajaaaajaaaaa",
    "ĞĞaagggaagggaaĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaaaaaaaaaaaaĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaaaaaaaaaaaaĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk going_up_1_to_2 = Chunk(description: "going_up_1_to_2", slope: "up", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaggggaaaaaaaa",
    "aaaaiiiiaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaajaĞĞĞĞ",
    "aaaaaaaaggggaaaa",
    "aaaaggggggggaaaa",
    "ggggggggggggaaaa",
  ]);

  Chunk going_up_1_to_3 = Chunk(description: "going_up_1_to_3", slope: "up2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa", 
    "aaaaaaaaaaaaaaaa",  //4
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaagĞ", //3
    "aggaaggaaggaagga",
    "aaaaaaaaaaajaaaa",
    "aaggaaggaaggaaga",
    "aaaaaaabaaaajaaĞ", //2
    "aaaggaaggaaggaaa",
    "aaaaaaaaaaaaaaaa",
    "ggggggggggggggga", //1
  ]);

  Chunk going_up_1_to_4 = Chunk(description: "going_up_1_to_4", slope: "up3", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaamaa", 
    "aaaĞĞĞgggaaaĞĞĞĞ",  //4
    "aaaaaaggaaaĞaaaa",
    "aaaaaagaaaĞaaaaa",
    "aaaaaaaaagaaaaaa",
    "aaaĞgaaaggaaIgĞĞ", //3
    "aaaabaagggagagaa",
    "aaaaaagaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaggggggggaaaĞĞ", //2
    "aaaaaaaaaaagaaaa",
    "aajaaaaaaaaaaaaa",
    "ggggggggggggggga", //1
  ]);

  Chunk going_up_2_to_3 = Chunk(description: "going_up_2_to_3", slope: "up", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaajaa",
    "aaaaaaaaaaaaĞĞĞĞ",
    "aaaaaaaaaggaaaaa",
    "aaaaaaggaggaaaaa",
    "aaaggaggaĞĞaĞaaa",
    "ĞĞaĞĞaĞĞaaaaaĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaggagaaa",
  ]);

  Chunk going_up_2_to_4 = Chunk(description: "going_up_2_to_4", slope: "up2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaajaajaajaaa",
    "aagaaggggĞgggĞĞĞ",
    "aaĞĞaaaaiaggĞaaa",
    "aaaagaaaaagĞaaaa",
    "aaaaggaaaaĞaaaaa",
    "aaaagggaaĞaaaĞĞĞ",
    "aaaiiaaagaaagaaa",
    "aaaaaaaggaaggaaa",
    "aaaaaagggagggaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk going_up_3_to_4 = Chunk(description: "going_up_3_to_4", slope: "up", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaama",
    "aaaaaaaaaaaaaaĞĞ",
    "aaaaaaaaaaaaggaa",
    "aaaaaaaaaaagggaa",
    "aajaaaaaggaaggaa",
    "ĞĞĞgagaggggaaaĞĞ",
    "aaaaaaaaaaggaaaa",
    "aaaaaaaaaaaaagaa",
    "aaaaaaaaaaaaggaa",
    "ĞĞĞaĞaĞaĞaĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk going_down_4_to_3 = Chunk(description: "going_down_4_to_3", slope: "down", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaĞajaaaaaaaaaa",
    "aaaagggajaaaaaaa",
    "aaaaggggggaajaaa",
    "aaaagggĞĞĞgggaaa",
    "ĞĞaaĞĞĞaaaggaaĞĞ",
    "aagaaaaaaaggagaa",
    "aagaaaaaaaaaagaa",
    "aagaaaagaaagggaa",
    "ĞaaaabaaaaaaaaaĞ",
    "aaaaaaaaagggaaaa",
    "aaaaaaaaamaaaaaa",
    "agggggggggggggga",
  ]);

  Chunk going_down_3_to_2 = Chunk(description: "going_down_3_to_2", slope: "down", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaagggggaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaĞaaaaaaaaaaaa",
    "aaaagaaaaaaaaaaa",
    "aaaaggaaaaaaaaaa",
    "aaaagggaajaaaaaa",
    "ĞgagggaaĞĞĞĞĞĞĞĞ",
    "agaaaaagaaaaaaaa",
    "agamaaggaaaaaaaa",
    "agggggggaaaaaaaa",
  ]);

  Chunk going_down_2_to_1 = Chunk(description: "going_down_2_to_1", slope: "down", level: [
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
    "ĞĞĞĞaaajajaaaaaa",
    "aaaagggggggaaaaa",
    "aaaaggggggggaaaa",
    "aaaagggggggggggg",
  ]);

  Chunk cave_entrance_from_3_easy = Chunk(description: "cave_entrance_from_3_easy", slope: "flat", type: "cave", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaajaaaaaaaaaaaa",
    "aaagaaaamaaaamag",
    "Ğagggggggggggggg",
    "aaaggggggggggggg",
    "agaaaaiaaaaaiaaa",
    "agaaaaaaaaaaaaaa",
    "ĞĞĞaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaagaaaaajaaaaaa",
    "aaaggggggggggggg",
  ]);

  Chunk cave_entrance_from_3_moderate = Chunk(description: "cave_entrance_from_3_moderate", slope: "flat", type: "cave", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaajaaaaaaaaaaaa",
    "aaagaaaamaaaamag",
    "Ğagggggggggggggg",
    "aaaggggggggggggg",
    "agaaaaiaiaaaiaaa",
    "agaaaaaaaaaaaaaa",
    "ĞĞĞaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaagaamaajaaaaaa",
    "aaaggggggggggggg",
  ]);

  Chunk cave_entrance_from_3_hard = Chunk(description: "cave_entrance_from_3_hard", slope: "flat", type: "cave", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaajaaaaaaaaaaaa",
    "aaagaaaamaaaamag",
    "Ğagggggggggggggg",
    "aaaggggggggggggg",
    "agaaaaiaiaaaiaaa",
    "agaaaaaaaaaaaaaa",
    "ĞĞĞaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaagaamaajaaabaa",
    "aaaggggggggggggg",
  ]);

  Chunk cave_entrance_from_2_easy = Chunk(description: "cave_entrance_from_2_easy", slope: "up", type: "cave", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaajaaaaaajag",
    "aaaagggggggggggg",
    "aaaggggggggggggg",
    "aaggaaiagggaiaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaaaaaaaaaaaaaa",
    "aagaaaaaaaaaaaaa",
    "aaggaaaaajaaaaaa",
    "aagggggggggggggg",
  ]);

  Chunk cave_entrance_from_2_medium = Chunk(description: "cave_entrance_from_2_medium", slope: "up", type: "cave", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaamaaaamag",
    "aaaagggggggggggg",
    "aaaggggggggggggg",
    "aaggaaiagggaiaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaaaaaaaaaaaaaa",
    "aagaaaaaaaaaaaaa",
    "aaggaaaaajaaaaaa",
    "aagggggggggggggg",
  ]);

  Chunk cave_entrance_from_2_hard = Chunk(description: "cave_entrance_from_2_hard", slope: "up", type: "cave", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaamaaaamag",
    "aaaagggggggggggg",
    "aaaggggggggggggg",
    "aaggaaiagggaiaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaaaaaaaaaaaaaa",
    "aagaaaaaaaaaaaaa",
    "aaggaaaaajaaaaaa",
    "aaggggagaggggaag",
  ]);

  Chunk cave_entrance_from_1_easy = Chunk(description: "cave_entrance_from_1_easy", slope: "up2", type: "cave", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaajaaaajag",
    "aaaaĞggggggggggg",
    "aaagaggggggggggg",
    "aaaĞaaiagggaiaaa",
    "aagaaaaaaaaaaaaa",
    "aagaaaaaaaaaaaaa",
    "aggaaaaaaaaaaaaa",
    "aaaaaaaajaaaaaaa",
    "gggggagggggggggg",
  ]);

  Chunk cave_entrance_from_1_moderate = Chunk(description: "cave_entrance_from_1_moderate", slope: "up2", type: "cave", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaamaaaamag",
    "aaaaĞggggggggggg",
    "aaagaggggggggggg",
    "aaaĞaaiagggaiaaa",
    "aagaaaaaaaaaaaaa",
    "aagaaaaaaaaaaaaa",
    "aggbaaaaaaaaaaaa",
    "aaaaaaaajaaabaaa",
    "gggggagggggggggg",
  ]);

  Chunk cave_entrance_from_1_hard = Chunk(description: "cave_entrance_from_1_hard", slope: "up2", type: "cave", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaamaaaamag",
    "aaaaĞggggggggggg",
    "aaagaggggggggggg",
    "aaaĞaaiagggaiaaa",
    "aagaaaaaaaaaaaaa",
    "aagaaaaaaaaaaaaa",
    "aggbaaaaaaaaaaaa",
    "aaaaaaaajaaabaaa",
    "gggggagggggagggg",
  ]);

  Chunk cave_exit_to_3_easy = Chunk(description: "cave_exit_to_3_easy", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ajajaaaaaabaaaaa",
    "gggggggggggaaĞĞĞ",
    "gggggggggggaaaaa",
    "aaiaaaaaaaaagaaa",
    "aaaaaaaaaaaabaaa",
    "aaaaaaaaaaaĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaajaaagaaaaa",
    "gggggggggggaaaaa",
  ]);

  Chunk cave_exit_to_3_moderate = Chunk(description: "cave_exit_to_3_moderate", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ajajaabaaabaaaaa",
    "gggggggggggaaĞĞĞ",
    "gggggggggggaaaaa",
    "aaiaiiaaaaaagaaa",
    "aaaaaaaaaaaabaaa",
    "aaaaaaaaaaaĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaamgaaaaa",
    "gggggggggggaaaaa",
  ]);

  Chunk cave_exit_to_3_hard = Chunk(description: "cave_exit_to_3_hard", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ajajaabaaabaaaaa",
    "gggggggggggaaĞĞĞ",
    "gggggggggggaaaaa",
    "aaiaiiaaiaiagaaa",
    "aaaaaaaaaaaabaaa",
    "aaaaaaaaaaaĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaamgaaaaa",
    "gggggggggggaaaaa",
  ]);

  Chunk cave_exit_to_2_easy = Chunk(description: "cave_exit_to_2_easy", slope: "down", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ajajaabaaaaaaaaa",
    "ggggggggggggggaa",
    "ggggggggggggggga",
    "aaaaaiaaaaaaaggg",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaajaaaaagaaaaa",
    "gggggggggggaaaaa",
  ]);

  Chunk cave_exit_to_2_moderate = Chunk(description: "cave_exit_to_2_moderate", slope: "down", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ajajaabaaamaaaaa",
    "ggggggggggggggaa",
    "ggggggggggggggga",
    "aaiaaiaaaaaaaggg",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaajaaaamgaaaaa",
    "gggggggggggaaaaa",
  ]);

  Chunk cave_exit_to_2_hard = Chunk(description: "cave_exit_to_2_hard", slope: "down", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ajajaabaaamaaaaa",
    "ggggggggggggggaa",
    "ggggggggggggggga",
    "aaiaaiiaaaaaaggg",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaajgaaamgaaaaa",
    "gggggggggggaaaaa",
  ]);

  Chunk cave_exit_to_1_easy = Chunk(description: "cave_exit_to_1_easy", slope: "down2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ajajaabaaaaaaaaa",
    "ggggggggggggaaaa",
    "gggggggggggggaaa",
    "aaaaaiaaaaaagaaa",
    "aaaaaaaaaaaaggaa",
    "aaaaaaaaaaaaagga",
    "aaaaaaaaaaaaaggg",
    "aaaaaagaaamaaaaa",
    "gggggggggggggggg",
  ]);

  Chunk cave_exit_to_1_moderate = Chunk(description: "cave_exit_to_1_moderate", slope: "down2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ajajaabaaamaaaaa",
    "ggggggggggggaaaa",
    "gggggggggggggaaa",
    "aaiaaiaaaaaagaaa",
    "aaaaaaaaaaaaggaa",
    "aaaaaaaaaaaaagga",
    "aaaaaaaaaaaaaggg",
    "aaaaaagaaamaaaaa",
    "gggagggggggggggg",
  ]);

  Chunk cave_exit_to_1_hard = Chunk(description: "cave_exit_to_1_hard", slope: "down2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ajajaabaaamaaaaa",
    "gggggggggaggaaaa",
    "gggggggggagggaaa",
    "aaiaaiaaaaaagaaa",
    "aaaaaaaaaaaaggaa",
    "aaaaaaaaaaaaagga",
    "aaaaaajaaaaaaggg",
    "aaaaaagaaamaaaaa",
    "gggagggggggggggg",
  ]);
}