
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
        "regular": { //11 0 0 0 // 1 0 0 0 // 2 0 0 0
          1: [
            easy_a,  
            easy_b1,  
            easy_c1, 
            easy_d1, 
            easy_e1,

            going_up_1_to_2_easy, 
            going_up_1_to_2_easy_b, 
            going_up_1_to_3_easy, 
            going_up_1_to_3_easy_b, 
            going_up_1_to_4_easy, 
            going_up_1_to_4_easy_b,       
            
            cave_entrance_from_1_easy,   
            sky_entrance_from_1_easy,  
            high_sky_entrance_from_1_easy
            ],
          2: [
            easy_a2, 
            easy_b2, 
            easy_c2, 
            easy_d2, 
            going_up_2_to_3_easy, 
            going_up_2_to_3_easy_b,
            going_up_2_to_4_easy, 
            going_up_2_to_4_easy_b,
            going_down_2_to_1_easy,
            going_down_2_to_1_easy_b,                                       
            cave_entrance_from_2_easy
          ],
          3: [
            easy_a3, 
            easy_b3, 
            easy_c3, 
            easy_d3, 
            going_up_3_to_4_easy, 
            going_up_3_to_4_easy_b,
            going_down_3_to_2_easy,                                                             
            cave_entrance_from_3_easy
          ],
          4: [
            easy_a4, 
            easy_b4, 
            easy_c4, 
            easy_d4, 
            going_down_4_to_3_easy, 
            going_down_4_to_2_easy, 
            going_down_4_to_1_easy,
            going_down_4_to_1_easy_b,
          ]
        },
        "cave": {
          3: [
            cave_exit_to_3_easy, 
            cave_exit_to_2_easy, 
            cave_exit_to_1_easy
          ]
        },
        "sky": {
          1: [
            sky_flat_easy, 
            sky_exit_to_1_easy, 
            sky_exit_to_2_easy
          ]
        },
        "high_sky": {
          1: [
            high_sky_exit_to_1_easy, 
            high_sky_exit_to_3_easy
          ],
        }
      },
      "moderate": {
        "regular": { //1 6 4 3 // 1 0 3 3  // 1 0 4 5
          1: [
            moderate_a, 
            moderate_b, 
            moderate_c, 
            moderate_d1, 
            moderate_e1,    
            going_up_1_to_2_moderate, 
            going_up_1_to_3_moderate,  
            going_up_1_to_4_moderate,                                
            cave_entrance_from_1_moderate,    
            sky_entrance_from_1_moderate, 
            high_sky_entrance_from_1_moderate
          ],
          2: [
            moderate_a2, 
            moderate_b2, 
            moderate_c2, 
            moderate_d2,              
            going_up_2_to_4_moderate, 
            going_up_2_to_3_moderate,   
            going_up_2_to_3_moderate_b,
            going_down_2_to_1_moderate, 
            going_down_2_to_1_moderate_b,        
            cave_entrance_from_2_medium
          ],
          3: [
            moderate_a3, 
            moderate_b3, 
            moderate_c3, 
            moderate_d3,              
            going_up_3_to_4_moderate, 
            going_up_3_to_4_moderate_b, 
            going_down_3_to_2_moderate, 
            going_down_3_to_2_moderate_b,
            going_down_3_to_1_moderate,                           
            cave_entrance_from_3_moderate
          ],
          4: [
            moderate_a4, 
            moderate_b4, 
            moderate_c4, 
            moderate_d4,              
            going_down_4_to_3_moderate, 
            going_down_4_to_2_moderate, 
            going_down_4_to_2_moderate_b, 
            going_down_4_to_1_moderate,
            going_down_4_to_1_moderate_b
          ]
        },
        "cave": {
          3: [
            cave_exit_to_3_moderate, 
            cave_exit_to_2_moderate, 
            cave_exit_to_1_moderate]
        },
        "sky": {
          1: [
            sky_flat_moderate, 
            sky_exit_to_1_moderate, 
            sky_exit_to_2_moderate]
        },
        "high_sky": {
          1: [
            high_sky_exit_to_1_moderate, 
            high_sky_exit_to_3_moderate],
        }
      },
      "hard": {
        "regular": { // 0 1 0 1 // 0 0 1 2 // 0 3 0 1
          1: [
            hard_a, 
            hard_b, 
            hard_c, 
            hard_d1, 
            moderate_e1, 

            going_up_1_to_2_hard, 
            going_up_1_to_3_hard, 
            going_up_1_to_4_hard, 

            cave_entrance_from_1_hard,    
            sky_entrance_from_1_hard, 
            high_sky_entrance_from_1_hard],
          2: [
            hard_a2, 
            hard_b2, 
            hard_c2, 
            hard_d2, 
            going_up_2_to_3_hard, 
            going_up_2_to_3_hard_b, 
            going_up_2_to_4_hard, 
            going_down_2_to_1_hard,     
            cave_entrance_from_2_hard],
          3: [
            hard_a3, 
            hard_b3, 
            hard_c3, 
            hard_d3, 
            going_up_3_to_4_hard, 
            going_up_3_to_4_hard_b, 
            going_down_3_to_2_hard, 
            going_down_3_to_2_hard_b, 
            going_down_3_to_1_hard,                          
            cave_entrance_from_3_hard],
          4: [
            hard_a4, 
            hard_b4, 
            hard_c4, 
            hard_d4, 
            going_down_4_to_3_hard, 
            going_down_4_to_2_hard, 
            going_down_4_to_2_hard_b, 
            going_down_4_to_1_hard, 
            going_down_4_to_1_hard_b]
        },
        "cave": {
          3: [
            cave_exit_to_3_hard, 
            cave_exit_to_2_hard, 
            cave_exit_to_1_hard]
        },
        "sky": {
          1: [
            sky_flat_hard, 
            sky_exit_to_1_hard, 
            sky_exit_to_2_hard]
        },
        "high_sky": {
          1: [
            high_sky_exit_to_1_hard, 
            high_sky_exit_to_3_hard],
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
      if(chunk.slope == "down2"){
        altitude -= 2;
        if(altitude < 1){
          throw Exception("altitude less than 1");
        }
      }
      if(chunk.slope == "down3"){
        altitude -= 3;
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

  Chunk easy_a4 = Chunk(description: "easy_a4",slope: "flat", level: [
    "aaaaaaaaaaaJaaJa",
    "aaaaaJaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaJaaaaaJaaaaaaa",
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

  Chunk easy_b1 = Chunk(description: "easy_b1", slope: "flat", level: [
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

  Chunk easy_c1 = Chunk(description: "easy_c1", slope: "flat", level: [
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

  Chunk easy_d1 = Chunk(description: "easy_d1", slope: "flat", level: [
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
    "aaaaggggggggggaa",
    "aaaabaabaabaabaa",
    "aaaaaaaaaaaaaaaa",
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
    "paaaaaaaaaaaaaaa",
    "ĞĞaaaaaaaaaaaaĞĞ",
    "aaaaaalaaaaalaaa",
    "aaalaaaaalaaaaaa",
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

  Chunk easy_e1 = Chunk(description: "easy_e1", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaggggaaaaaaaa",
    "aaaaiaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaamaaaaa",
    "aaaaaggggggggaaa",
    "aaaaĞĞĞĞĞĞĞĞĞbaa",
    "aaagaaaaaaaaagaa",
    "aaggaaaaaaaaagba",
    "ggggaaaaaaaaagga",
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
    "ĞĞĞaaagggaagaaaĞ",
    "aaaaaaaaaaaaaaga",
    "aaaggaaaaaaaggga",
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
    "ĞĞĞggggĞggggĞĞĞĞ",
    "aaagaagagaagaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞaaaaĞaaaaĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞaaaaĞaaaaĞĞĞĞ",
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

 Chunk moderate_d1 = Chunk(description: "moderate_d", slope: "flat", level: [
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

  Chunk moderate_e1 = Chunk(description: "moderate_e1", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaggggaaaaaaaa",
    "aaaaiiiiaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaamajaajaaaaa",
    "aaaaaggggggggaaa",
    "aaaaĞĞĞĞĞĞĞĞĞbaa",
    "aaagaaaaaaaaagaa",
    "aaggaaaaaaaaagba",
    "ggggaaaaaaaaagga",
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
    "aaaaaaaaaaaaaaaa",
    "ĞĞaaaaaaaaaaaaĞĞ",
    "aaaaaaalaaaaaaaa",
    "aaalaaaaaaalaaaa",
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

  Chunk hard_d1 = Chunk(description: "hard_d", slope: "flat", level: [
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

  Chunk hard_e1 = Chunk(description: "hard_e1", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaggggaaaaaaaa",
    "aaaaiiiiaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaamajaajaaaaa",
    "aaaaaggggagggaaa",
    "aaabĞĞĞĞĞaĞĞĞbaa",
    "aaagaaaaaaaaagaa",
    "aaggaaaaaaaaagba",
    "ggggaaaaaaaaagga",
  ]);

  Chunk going_up_1_to_2_easy = Chunk(description: "going_up_1_to_2_easy", slope: "up", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaggggaaaaaaaa",
    "aaaaiaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaajaĞĞĞĞ",
    "aaaaaaaaggggaaaa",
    "aaaaggggggggaaaa",
    "ggggggggggggaaaa",
  ]);

  Chunk going_up_1_to_2_moderate = Chunk(description: "going_up_1_to_2_moderate", slope: "up", level: [
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

  Chunk going_up_1_to_2_hard = Chunk(description: "going_up_1_to_2_hard", slope: "up", level: [
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
    "aaaaaaaaaaaajaaa",
    "aaaaaaaaaajaĞĞĞĞ",
    "aaaabaabggggaaaa",
    "aaaaggggggggaaaa",
    "ggggggggggggaaaa",
  ]);

  Chunk going_up_1_to_2_easy_b = Chunk(description: "going_up_1_to_2_easy_b", slope: "up", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaajaaaaa",
    "aaaaaaaaggggaaaa",
    "aaaaaagggaaggaaa",
    "aaaaĞaĞaaaaagĞĞĞ",
    "aaagaaaaaaaaaaaa",
    "aaggaaaaaaaaaaaa",
    "ggggaaaaaaaaaaaa",
  ]);

  Chunk going_up_1_to_3_easy = Chunk(description: "going_up_1_to_3_easy", slope: "up2", level: [
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
    "aaaaaaaaaaaaaaaĞ", //2
    "aaaggaaggaaggaaa",
    "aaaaaaaabaaaaaaa",
    "ggggggggggggggga", //1
  ]);

  Chunk going_up_1_to_3_easy_b = Chunk(description: "going_up_1_to_3_easy_b", slope: "up2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa", 
    "aaaaaaaaaaaaaaaa",  //4
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaam",
    "aaaaaaaaaaagggĞĞ", //3
    "aaaaaaaaaaggaaaa",
    "aaaaaaaaaggaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaagggaaaaaaaĞĞ", //2
    "aaaaaaalaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "gglaaaaaaaaaaaaa", //1
  ]);

  Chunk going_up_1_to_3_moderate = Chunk(description: "going_up_1_to_3_moderate", slope: "up2", level: [
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

  Chunk going_up_1_to_3_hard = Chunk(description: "going_up_1_to_3_hard", slope: "up2", level: [
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
    "aaaaaaaaaaaamaaa",
    "ggggggggggggggga", //1
  ]);

  Chunk going_up_1_to_4_easy = Chunk(description: "going_up_1_to_4_easy", slope: "up3", level: [
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
    "aaaaaaaabaaaaaaa",
    "ggggggggggggggaa", //1
  ]);

  Chunk going_up_1_to_4_easy_b = Chunk(description: "going_up_1_to_4_easy_b", slope: "up3", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa", 
    "aaaaaaaaaaaaaaĞĞ",  //4
    "aaaaaaaaaaaaaĞaa",
    "aaaaaaaaaaaagaaa",
    "aaaaaaaaaaaggaaa",
    "aaaaaaaaaagggaĞĞ", //3
    "aaaaaaaagaaasaaa",
    "aaaaaaaaggaaaaaa",
    "aaaaaaaaggggggaa",
    "aaaaaglaĞĞaaaaĞĞ", //2
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ggglaaaaaaaaaaaa", //1
  ]);

  Chunk going_up_1_to_4_moderate = Chunk(description: "going_up_1_to_4_moderate", slope: "up3", level: [
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

  Chunk going_up_1_to_4_hard = Chunk(description: "going_up_1_to_4_hard", slope: "up3", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaamaa", 
    "aaaĞĞĞgggaaaĞĞĞĞ",  //4
    "aaaaaaggaaaĞaaaa",
    "aaaaaagaaaĞaaaaa",
    "aaaaaaaaagaaaaaa",
    "aaaĞgiaaggaaIgĞĞ", //3
    "aaaabaagggagagaa",
    "aaaaaagaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaggggggggaaaĞĞ", //2
    "aaaaaaaaaaagaaaa",
    "aajaaaaaaaamaaaa",
    "ggggggggggggggga", //1
  ]);

  Chunk going_up_2_to_3_easy = Chunk(description: "going_up_2_to_3_easy", slope: "up", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaajaa",
    "aaaaaaaaaaaaĞĞĞĞ",
    "aaaaaaajagggaaaa",
    "aaaajaggggggaaaa",
    "aaagggggĞĞĞĞĞaaa",
    "ĞĞĞĞĞĞĞĞaaaaaĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaagggggaaa",
  ]);

  Chunk going_up_2_to_3_easy_b = Chunk(description: "going_up_2_to_3_easy_b", slope: "up", level: [
    "aggĞgggĞĞĞĞggaaa",
    "aagaaaaaaaagaaaa",
    "aaaaMaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaagggaggĞĞaaaaa",
    "aaagggaamaaaaaaa",
    "aaagggaaaaaaaaaa",
    "aaaaaamaaaaaaaaa",
    "aaagĞĞĞĞĞĞgaaĞĞĞ",
    "aaagaaaaaagaaaaa",
    "aaaaaaaaaaaagaaa",
    "aaaaaaaaaaaagaaa",
    "ĞaaaaaaaaaagĞĞĞĞ",
    "agaaaaaaaaagaaaa",
    "aggaaaaaggggaaaa",
    "agggggggggggaaaa",
  ]);

  Chunk going_up_2_to_3_moderate = Chunk(description: "going_up_2_to_3_moderate", slope: "up", level: [
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

  Chunk going_up_2_to_3_moderate_b = Chunk(description: "going_up_2_to_3_moderate_b", slope: "up", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaLaaa",
    "aaaaaaaaaaaaaaĞĞ",
    "aaaaaaaaaagaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaLagaaaaaa",
    "ĞaaaaaaaaaaaaaĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk going_up_2_to_3_hard = Chunk(description: "going_up_2_to_3_hard", slope: "up", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaggggggaaaaaa",
    "aaaaiiiiiiaaaaaa",
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

  Chunk going_up_2_to_3_hard_b = Chunk(description: "going_up_2_to_3_hard_b", slope: "up", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaggggggaaaaaa",
    "aaaaiaaiiiaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaajaa",
    "aaaaaaaaaaaaĞĞĞĞ",
    "aaaaaaaaaaagaaaa",
    "aaaaafaaaabgaaaa",
    "aaaaaaaaaaĞĞĞaaa",
    "ĞĞĞaaggaagaaaĞĞĞ",
    "aaagaaaaggaaaaaa",
    "aaagggggggaaaaaa",
    "aaaaaaaaaggggaaa",
  ]);

  Chunk going_up_2_to_4_easy = Chunk(description: "going_up_2_to_4_easy", slope: "up2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaabaaaaabaaa",
    "aagaaggggĞgggĞĞĞ",
    "aaĞĞaaaaaaggĞaaa",
    "aaaagaaaaagĞaaaa",
    "aaaaggaaaaĞaaaaa",
    "aaaagggaaĞaaaĞĞĞ",
    "aaaiaaaagaaagaaa",
    "aaaaaaaggaaggaaa",
    "aaaaaagggagggaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk going_up_2_to_4_easy_b = Chunk(description: "going_up_2_to_4_easy_b", slope: "up2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaagaaaa",
    "aaaaaaaaaaaaaaaj",
    "aaaaaaaaaagaaaĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaagaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaĞĞ",
    "aaaaaaaaaaaalaaa",
    "aagaaaaaaLagggaa",
    "aggaaaaaaaaaggaa",
    "ĞĞĞaaaaaaaaaaaĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk going_up_2_to_4_moderate = Chunk(description: "going_up_2_to_4_moderate", slope: "up2", level: [
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

  Chunk going_up_2_to_4_hard = Chunk(description: "going_up_2_to_4_hard", slope: "up2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaajaajaajaaa",
    "aagaaggggĞgggĞĞĞ",
    "aaĞĞaaaaiaggĞaaa",
    "aaaagaaaaagĞaaaa",
    "aaaaggaaaaĞaaaaa",
    "aaaagggamĞaaaĞĞĞ",
    "aaaiiaaagaaagaaa",
    "aaaaaaaggaaggaaa",
    "aaaaaagggagggaaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk going_up_3_to_4_easy = Chunk(description: "going_up_3_to_4_easy", slope: "up", level: [
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
    "ĞĞĞaĞaĞaĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk going_up_3_to_4_easy_b = Chunk(description: "going_up_3_to_4_easy_b", slope: "up", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaajaaaaaa",
    "aaaaagagagagagĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaagaaagaaagaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞagagagagagagĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aagagaaagaaagaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaaaaaaaaaaaaĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk going_up_3_to_4_moderate = Chunk(description: "going_up_3_to_4_moderate", slope: "up", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaama",
    "aaaaaaaaaaaaaaĞĞ",
    "aaaaaaaaaaaaggaa",
    "aaaaaaaaajagggaa",
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

  Chunk going_up_3_to_4_hard = Chunk(description: "going_up_3_to_4_hard", slope: "up", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaama",
    "aaaaaaaaaaaaaaĞĞ",
    "aaaaaaaaaaaaggaa",
    "aaaaaaaaajagggaa",
    "aajaabaaggaaggaa",
    "ĞĞĞgagaggggaaaĞĞ",
    "aaaaaaaaaaigaaaa",
    "aaaaaaaaaaaaagaa",
    "aaaaaaaaaaaaggaa",
    "ĞĞĞaĞaĞaĞaĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk going_up_3_to_4_moderate_b = Chunk(description: "going_up_3_to_4_moderate_b", slope: "up", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaajaaaaaja",
    "aaaaaaagggaggĞĞĞ",
    "aaaaaaaaaaaagaaa",
    "aaaagggaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞggaaaaaaaaaĞĞĞ",
    "aagaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaaaaaaaaaaaĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk going_up_3_to_4_hard_b = Chunk(description: "going_up_3_to_4_hard_b", slope: "up", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaajaaaaaja",
    "aaaaaaagggaggĞĞĞ",
    "aaaamabaaaaagaaa",
    "aaaagggaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞggaaaaaaaaaĞĞĞ",
    "aagaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaaaaaaaaaaaĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk going_down_4_to_3_easy = Chunk(description: "going_down_4_to_3_easy", slope: "down", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaĞaaaaaaaaaaaa",
    "aaaagggajaaaaaaa",
    "aaaaggggggaajaaa",
    "aaaagggĞĞĞgggaaa",
    "ĞĞaaĞĞĞaaaggaaĞĞ",
    "aagaaaaaaaggagaa",
    "aagaaaaaaaaaagaa",
    "aagaaaagaaagggaa",
    "ĞaaaaaaaaaaaaaaĞ",
    "aaaaaaaaagggaaaa",
    "aaaaaaaaamaaaaaa",
    "agggggggggggggga",
  ]);

  Chunk going_down_4_to_3_moderate = Chunk(description: "going_down_4_to_3_moderate", slope: "down", level: [
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

  Chunk going_down_4_to_3_hard = Chunk(description: "going_down_4_to_3_hard", slope: "down", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaĞajaaaaaaaaaa",
    "aaaagggajaaaaaaa",
    "aaaaggggggaajaaa",
    "aaaagggĞĞĞgggaaa",
    "ĞĞaaĞĞĞIaaggaaĞĞ",
    "aagaIaIaaaggagaa",
    "aagaaaaaaaaaagaa",
    "aagaaaagaaagggaa",
    "ĞaaaabaaaaaaaaaĞ",
    "aaaaaaaaagggaaaa",
    "aaaaaaaaamaaaaaa",
    "agggggggggggggga",
  ]);

  Chunk going_down_4_to_2_easy = Chunk(description: "going_down_4_to_2_easy", slope: "down2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aajajaaaaaaaaaaa",
    "ĞaĞĞĞĞaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "Ğaggggaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaajaaaaamaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk going_down_4_to_2_moderate = Chunk(description: "going_down_4_to_2_moderate", slope: "down2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aajajaaaaaaaaaaa",
    "ĞaĞĞĞĞaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "Ğaggggaaaaaaaaaa",
    "aaiiiiaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaabaaaaamaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk going_down_4_to_2_moderate_b = Chunk(description: "going_down_4_to_2_moderate_b", slope: "down2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞLaaaaaĞaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaĞaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "Ğaaaaaagagaaaaaa",
    "aaaaaaagagaaaaaa",
    "aaasaaaaaaaaaaaa",
    "aaaaaaagggaaamaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk going_down_4_to_2_hard = Chunk(description: "going_down_4_to_2_hard", slope: "down2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aajajaaaaaaaaaaa",
    "ĞaĞĞĞĞaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaajaaaaa",
    "aaaaaaaaaggaaaaa",
    "Ğaggggaaaaaaagga",
    "aaiiiiaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaabaaaaamaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk going_down_4_to_2_hard_b = Chunk(description: "going_down_4_to_2_hard_b", slope: "down2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞaaaaaaaLaaĞaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaĞaaa",
    "aaaaaaaaaaaaaaaa",
    "Ğaaaaaaaaaagagaa",
    "aaaaaaaaaaagagaa",
    "aaasaaaaaaaaaaaa",
    "aaaaaaaaaaaggbaa",
    "ĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
  ]);

  Chunk going_down_4_to_1_easy = Chunk(description: "going_down_4_to_1_easy", slope: "down3", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "Ğaaaaaaaaaaaaaaa",
    "agaaaaaaaaaaaaaa",
    "aggaaaaaaaaaaaaa",
    "agggaaaaaaaaaaaa",
    "ĞĞĞĞĞaaaaaaaaaaa",
    "aaaaaaaggaaaaaaa",
    "aaaaaaaiaaaagaaa",
    "aaaaaaaaaaaaiaaa",
    "ĞĞĞĞĞaaagaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaggggggggggg",
  ]);

  Chunk going_down_4_to_1_easy_b = Chunk(description: "going_down_4_to_1_easy_b", slope: "down3", level: [
    "aaĞĞĞgggggggggaa",
    "aaaaagaagggaagaa",
    "aaaaaĞagaaagaĞaa",
    "aaaaaagaaaaagaaa",
    "ĞaagĞaaaaaaaaaaa",
    "agagaaaaaawaaaaa",
    "agaaaĞaaaaaaaĞaa",
    "aggaaaaaaaaaaaaa",
    "ĞĞĞaaaaaaaaaaaaa",
    "aaagaaaaaaaaaaaa",
    "aaagaaaaaaaaaĞaa",
    "aaaggaaaaaaaaaaa",
    "ĞĞĞĞĞaaaaaaaaaaa",
    "aaaaagaaaaaaaaaa",
    "aaaaagaaajaaaaaa",
    "aaaaaggggggggggg",
  ]);

  Chunk going_down_4_to_1_moderate = Chunk(description: "going_down_4_to_1_moderate", slope: "down3", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "Ğaaaaaaaaaaaaaaa",
    "agaaaaaaaaaaaaaa",
    "aggaaaaaaaaaaaaa",
    "agggaaaaaaaaaaaa",
    "ĞĞĞĞĞaaaaaaaaaaa",
    "aaaaaaaagaaaaaaa",
    "aaaaaaaaaaaagaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞaaagaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaabababaaaaaa",
    "aaaaaggggggggggg",
  ]);

  Chunk going_down_4_to_1_moderate_b = Chunk(description: "going_down_4_to_1_moderate_b", slope: "down3", level: [
    "aaĞgggggggggĞaaa",
    "aaaaagaaagaaaaaa",
    "aaaagagagagaaaaa",
    "aaagaaagaaagaaaa",
    "ĞaĞgggggggggĞaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaawaaawaaaaaa",
    "ĞaĞaaaaaaaaaĞaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "Ğagaaaaaaaaagaaa",
    "aagaaaaaaaaaaaaa",
    "aaaaaamaamagggaa",
    "aggggggggggggggg",
  ]);

  Chunk going_down_4_to_1_hard = Chunk(description: "going_down_4_to_1_hard", slope: "down3", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "Ğaaaaaaaaaaaaaaa",
    "agaaaaaaaaaaaaaa",
    "aggaaaaaaaaaaaaa",
    "agggbaaaaaaaaaaa",
    "ĞĞĞĞĞaaaaaaaaaaa",
    "aaaaaaaagaaaaaaa",
    "aaaaaaaaaaaagaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞĞaaagaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaabababaajaja",
    "aaaaaggggggggggg",
  ]);

  Chunk going_down_4_to_1_hard_b = Chunk(description: "going_down_4_to_1_hard_b", slope: "down3", level: [
    "aaĞaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞaggĞaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "Ğaaaaaaaaaaaaaaa",
    "aaaaggaagaaaaaaa",
    "aaaagaaaaaaagaaa",
    "aalagaaaaaaaaaaa",
    "ĞĞĞĞĞaaagaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaabababaajaja",
    "aaaaaggggggggggg",
  ]);

  Chunk going_down_3_to_2_easy = Chunk(description: "going_down_3_to_2_easy", slope: "down", level: [
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
    "agaaaaggaaaaaaaa",
    "agggggggaaaaaaaa",
  ]);

  Chunk going_down_3_to_2_moderate = Chunk(description: "going_down_3_to_2_moderate", slope: "down", level: [
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

  Chunk going_down_3_to_2_moderate_b = Chunk(description: "going_down_3_to_2_moderate_b", slope: "down", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaaaaaaaaaaaaaa",
    "aagaaaaaafaaaaaa",
    "aagaaaaaaaaaaaaa",
    "aagagaaaaggaaaaa",
    "ĞĞĞaĞagmaaaaaĞĞĞ",
    "aaaaaagggggggaaa",
    "aaaaaagaagaagaaa",
    "aaaaaagaagaagaaa",
  ]);

  Chunk going_down_3_to_2_hard = Chunk(description: "going_down_3_to_2_hard", slope: "down", level: [
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
    "ĞgagggaaĞĞĞaaĞĞĞ",
    "agaaaaagaaaaaaaa",
    "agamaaggaaaaaaaa",
    "agggggggaaaaaaaa",
  ]);

  Chunk going_down_3_to_2_hard_b = Chunk(description: "going_down_3_to_2_hard_b", slope: "down", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaaaaaaaaaaaaaa",
    "aagaaagaaagaaaaa",
    "aagaaaaaaaaaaaaa",
    "aagagaaasaaaaaja",
    "ĞĞĞaĞagaaaaaaĞĞĞ",
    "aaaaaagggggggaaa",
    "aaaaaagaagaagaaa",
    "aaaaaagaagaagaaa",
  ]);

  Chunk going_down_3_to_1_moderate = Chunk(description: "going_down_3_to_1_moderate", slope: "down2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaawaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaajaaaajaaaaaa",
    "Ğaagggaagggaaaaa",
    "aaaaaaaaaaaaaaja",
    "agaaaaggaaaaaggg",
    "aaaaaaaaaaaaaaaa",
    "Ğaaggaaagggaaaaa",
    "aaaaagaaaawaagaa",
    "aaamaaaaaaaaaaaa",
    "aggggggggggggggg",
  ]);

  Chunk going_down_3_to_1_hard = Chunk(description: "going_down_3_to_1_hard", slope: "down2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaawaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaawaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaawaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞaĞaaaaaaaaaaaa",
    "aaaagaaaaaaaaaaa",
    "aaaaggaaaaaaaaaa",
    "aaaagggaaaaaaaaa",
    "Ğgagggaaaaaaaaaa",
    "agaaaaagaagaaaaa",
    "agamaaggaaggaaaa",
    "agggggggaagggggg",
  ]);

  Chunk going_down_2_to_1_easy = Chunk(description: "going_down_2_to_1_easy", slope: "down", level: [
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
    "ĞĞĞĞaaajaaaaaaaa",
    "aaaagggggggaaaaa",
    "aaaaggggggggaaja",
    "aaaagggggggggggg",
  ]);

  Chunk going_down_2_to_1_easy_b = Chunk(description: "going_down_2_to_1_easy_b", slope: "down", level: [
    "aggggggggggaaaaa",
    "aggaaaaaaggaaaaa",
    "agaaaaaaaagaaaaa",
    "aĞaaaaaaaaĞaaaaa",
    "aaaaaaaawaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aĞaaaaaaaaĞaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞgaaaamaggaaaaa",
    "aaggggggggggaaaa",
    "aagggggggggggaja",
    "aagggggggggggggg",
  ]);

  Chunk going_down_2_to_1_moderate = Chunk(description: "going_down_2_to_1_moderate", slope: "down", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaggggggaaaaaaa",
    "aaaaiiiaaaaaaaaa",
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

  Chunk going_down_2_to_1_moderate_b = Chunk(description: "going_down_2_to_1_moderate_b", slope: "down", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaafaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaagaagggga",
    "ĞĞgaamaggaaaaaaa",
    "aaggggggggaaaaaa",
    "aagaaaagggggaaaa",
    "aaaaaaaagggggggg",
  ]);

  Chunk going_down_2_to_1_hard = Chunk(description: "going_down_2_to_1_hard", slope: "down", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaggggggaaaaaaa",
    "aaaaiiiaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ĞĞĞĞaaajajaaaaaa",
    "aaaagggggggaaaaa",
    "aaaaggggggggamaa",
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

  Chunk sky_entrance_from_1_easy = Chunk(description: "sky_entrance_from_1_easy", type: "sky", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaja",
    "aaaaaaaaagagaggg",
    "aaaaaaggaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaggaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaggaaaaaaaaaaaa",
    "aaaaaaaajabaaaaa",
    "gggggggggggggggg",
  ]);

  Chunk sky_entrance_from_1_moderate = Chunk(description: "sky_entrance_from_1_moderate", type: "sky", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaja",
    "aajaaaaaagagaggg",
    "aagaaaggaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "agaaggaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaggaaaaaaaaaaaa",
    "aaaaaaaajabaaaaa",
    "ggggggggggggaggg",
  ]);

  Chunk sky_entrance_from_1_hard = Chunk(description: "sky_entrance_from_1_hard", type: "sky", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaja",
    "aajaaaaaagagaggg",
    "aagaaaggaaaiaiaa",
    "aaaaaaaaaaaaaaaa",
    "agaaggaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaggaaaaaaaaaaaa",
    "aaaaaaaajabaaaaa",
    "ggggggggggggaggg",
  ]);

  Chunk sky_flat_easy = Chunk(description: "sky_flat_easy", type: "sky", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaggaaaaaaaa",
    "aaaaaaaaagaaaaaa",
    "ggaaggaaaggagagg",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaajaaaaaajaaa",
    "ggagggggaggggggg",
  ]);

  Chunk sky_flat_moderate = Chunk(description: "sky_flat_moderate", type: "sky", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaggaaaaaaaa",
    "aaaaaaiiagaaaaaa",
    "ggaaggaaaggagagg",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaajaaaabajaaa",
    "ggagggggaggggggg",
  ]);

  Chunk sky_flat_hard = Chunk(description: "sky_flat_hard", type: "sky", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaajaaaaaaaa",
    "aaaaaaggaaaaaaaa",
    "aaaaaiiagaaaaaa",
    "ggaaggaaaggagagg",
    "iiaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaajaaaabajaaa",
    "ggagggggaggggggg",
  ]);

  Chunk sky_exit_to_1_easy = Chunk(description: "sky_exit_to_1_easy", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ggaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaggaaaaaaaaaaa",
    "aaaaaaajaaaaaaaa",
    "aaaaaagggaaaaaaa",
    "aaaaaaaaggaaaaaa",
    "gamaaaaaaaamggaa",
    "gggggggggggggggg",
  ]);

  Chunk sky_exit_to_1_moderate = Chunk(description: "sky_exit_to_1_moderate", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ggaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaggaaaaaaaaaaa",
    "aaaaaaajaaaaaaaa",
    "aaaaaagggaaaaaaa",
    "aaaaaaaaggaaajaa",
    "gamaaaaaaaamggaa",
    "gggggggggggggggg",
  ]);

  Chunk sky_exit_to_1_hard = Chunk(description: "sky_exit_to_1_hard", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ggaaaaaaaaaaaaaa",
    "aiaajaaaaaaaaaaa",
    "aaaggaaaaaaaaaaa",
    "aaaiaaajaaaaaaaa",
    "aaaaaagggaaaaaaa",
    "baaaaaaaggaaajaa",
    "gamaaaaaaaamggaa",
    "gggggggggggggggg",
  ]);

  Chunk sky_exit_to_2_easy = Chunk(description: "sky_exit_to_2_easy", slope: "up", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ggaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaggaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaggaaggaaĞĞ",
    "aaaaaaaaaaaaagaa",
    "gamaaaaaaaamggaa",
    "ggggggggggggggaa",
  ]);

  Chunk sky_exit_to_2_moderate = Chunk(description: "sky_exit_to_2_moderate", slope: "up", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ggaaaaaaaaaaaaaa",
    "aaaajaaaaaaaaaaa",
    "aaaggaaaaaaaaaaa",
    "aaaiaaaaaaaaaaaa",
    "aaaaaaggaaggaaĞĞ",
    "aaaaaaaaaaaaagaa",
    "gamaaaaaaaamggaa",
    "ggggggggggggggaa",
  ]);

  Chunk sky_exit_to_2_hard = Chunk(description: "sky_exit_to_2_hard", slope: "up", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "ggaaaaaaaaaaaaaa",
    "aaaajaaaaaaaaaaa",
    "aaaggaaaaaaaaaaa",
    "aaaiaaaaaaaaaaja",
    "aaaaaaggaaggaaĞĞ",
    "aaaaaaaaaaaaagaa",
    "gamaaaabaaamggaa",
    "ggggggggggggggaa",
  ]);

  Chunk high_sky_entrance_from_1_easy = Chunk(description: "high_sky_entrance_from_1_easy", type: "high_sky", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaagggaagggaag",
    "aagaaaaaaaaaaaaa",
    "aaggaaaaaaaaaaaa",
    "aaaaagaaaaaaaaaa",
    "aaaaaaagaaaaaaaa",
    "aaaaaaaaagaaaaaa",
    "aaaaaaaaggaaaaaa",
    "aaaaaagaaaaaaaaa",
    "aaaagaaaaaaaaaaa",
    "aagaaaaaaaaaaaaa",
    "aaaaaaaajabaaaaa",
    "gggggaaggggggggg",
  ]);

  Chunk high_sky_entrance_from_1_moderate = Chunk(description: "high_sky_entrance_from_1_moderate", type: "high_sky", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaajaaaajaaaa",
    "aaaaagggaagggaag",
    "aagaaaaaaaaaaaaa",
    "aaggaaaaaaaaaaaa",
    "aaaaagaaaaaaaaaa",
    "aaaaaaagaaaaaaaa",
    "aaaaaaaaagaaaaaa",
    "aaaaaaaaggaaaaaa",
    "aaaaaagaaaaaaaaa",
    "aaaagaaaaaaaaaaa",
    "aagaaaaaaaaaaaaa",
    "aaaaaaaajabaaama",
    "gggggaaggggggggg",
  ]);

  Chunk high_sky_entrance_from_1_hard = Chunk(description: "high_sky_entrance_from_1_hard", type: "high_sky", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaajaaaajaaaa",
    "aaaaagggaagggaag",
    "aagaaaaaaaaaaaaa",
    "aaggaaaaaaaaaaaa",
    "aaaaagaaaaaaaaaa",
    "aaaaaaagaaaaaaaa",
    "aaaaaaaaagaaaaaa",
    "aaaaaaaaggaaaaaa",
    "aaaamagaaaaaaaaa",
    "aaaagaaaaaaaaaaa",
    "aagaaaaaaaaaaaaa",
    "aaaaaaaajabaaama",
    "gggggaaggggggggg",
  ]);

  Chunk high_sky_exit_to_1_easy = Chunk(description: "high_sky_exit_to_1_easy", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aajaaaaaaaaaaaaa",
    "gggaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaagaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaagaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaagaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaagaaaaaaaaa",
    "aaaaagggaaaaaaaa",
    "gaamgggggaamggaa",
    "gggggggggggggggg",
  ]);

  Chunk high_sky_exit_to_1_moderate = Chunk(description: "high_sky_exit_to_1_moderate", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aajaaaaaaaaaaaaa",
    "gggaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaagaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaagaaaaaaaaaaa",
    "aaaaabaaaaaaaaaa",
    "aaaaagaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaagaaaaaaaaa",
    "aaaaagggaaaaaaaa",
    "gaamgggggaamggaa",
    "gggggggggggggggg",
  ]);

  Chunk high_sky_exit_to_1_hard = Chunk(description: "high_sky_exit_to_1_hard", slope: "flat", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaagggaaa",
    "aaaaaaaaaaiiiaaa",
    "aajaaaaaaaaaaaaa",
    "gggaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaagaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaagaaaaaaaaaaa",
    "aaaaabaaaaaaaaaa",
    "aaaaagaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaagaaaaaaaaa",
    "aaaaagggaaaaaaaa",
    "gaamgggggaamggaa",
    "gggggggggggggggg",
  ]);

  Chunk high_sky_exit_to_3_easy = Chunk(description: "high_sky_exit_to_3_easy", slope: "up2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "gggaagggaaajaaaa",
    "aiiaaaiaaaggaaaa",
    "aaaaaaaaaaaggaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaagaaa",
    "aaaaaaaaaaaagaaa",
    "aaaaaaaaaaaĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaajaaajaagaaaaa",
    "gggggggggggaaaaa",
  ]);

  Chunk high_sky_exit_to_3_moderate = Chunk(description: "high_sky_exit_to_3_moderate", slope: "up2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaajaaaaaaaaa",
    "gggaagggaaajaaaa",
    "aiiaaaiaaaggaaaa",
    "aaaaaaaaaaaggaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaagaaa",
    "aaaaaaaaaaaagaaa",
    "aaaaaaaaaaaĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaajaaajaagaaaaa",
    "ggggggggaggaaaaa",
  ]);

  Chunk high_sky_exit_to_3_hard = Chunk(description: "high_sky_exit_to_3_hard", slope: "up2", level: [
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaa",
    "aaaaaajaaaaaaaaa",
    "gggaagggaaajaaaa",
    "aiiaaaiaaaggaaaa",
    "aaaaaaaaaaaggaaa",
    "aaaaaaaaaaaaaaja",
    "aaaaaaaaaaaaaĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaagaaa",
    "aaaaaaaaaaaabaaa",
    "aaaaaaaaaaaĞĞĞĞĞ",
    "aaaaaaaaaaaaaaaa",
    "aaaaaaajaagaaaaa",
    "gggaagggaggaaaaa",
  ]);
}