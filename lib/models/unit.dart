import 'package:my_app/controllers/gamecontroller.dart';

import 'basicmap.dart';

class Unit {

  String type;
  int x;
  int y;
  int offsetX;
  int offsetY;
  int width;
  int height;

  int fall = 0;

  int value_1 = 0;
  int value_2 = 0;
  int value_3 = 0;
  int value_4 = 0;

  bool alreadyUpdated = false;

  int direction = 0;

  Unit({
    required this.type,
    required this.x,
    required this.y,
    required this.offsetX,
    required this.offsetY,
    required this.width,
    required this.height
  });

  void doAction(GameController gameController){
    throw Exception("not implemented ${{type}}");
  }

  //makes more sense to implement this function here instead of for each unit implementation
  //  since many units share the same implementation
  void die(GameController gameController){
    switch (type) {
      case "monster_left":
      case "monster_right":
      case "spiked_monster_left":
      case "spiked_monster_right":
        gameController.queueUnitTypeChange(this, "monster_dead");
        value_1 = 0;
        value_2 = 0; //mo
        return;
      case "winged_monster":
        gameController.queueUnitTypeChange(this, "monster_dead");
        value_1 = 0;
        value_2 = 1; //ghost type
        return;
      case "fire_monster_left":
      case "fire_monster_right":
        gameController.queueUnitTypeChange(this, "monster_dead");
        value_1 = 0;
        value_2 = 2;
        return;
      case "jumper_rising":
      case "jumper_falling":
        gameController.queueUnitTypeChange(this, "monster_dead");
        value_1 = 0;
        value_2 = 3; //ghost type
        return;
      case "bomb":
      case "bomb_charged":
        gameController.queueUnitTypeChange(this, "monster_dead");
        value_1 = 0;
        value_2 = 4; //ghost type
        return;
      default:
        return;
    }
  }
}