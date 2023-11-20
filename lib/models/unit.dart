import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/units/player.dart';

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

  //position of the element
  int zindex = -1;

  int processingIndex = -1;

  bool alreadyUpdated = false;

  int direction = 0;

  bool isSolidGround = false;

  bool needsActionRan = true; //whether the do action function needs to run

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

  String getImage(){
    throw Exception("not implemented ${{type}}");
  }

  //action to run when the player encounters the unit from the side
  //only really used for spiked monsters
  //return true if should exit early
  bool playerHittingFromSideAction(GameController gameController){
    return false;
  }

  //action to run when the player encounters the unit from below
  //return true if should exit early
  bool playerHittingFromBelowAction(GameController gameController){
    return false;
  }

  //action to run when the player encounters a unit from above (is falling)
  //return true if should exit early
  //default behaviour is to stop falling
  bool playerHittingFromAboveAction(GameController gameController, Player player){
    player.fall = 0;
    return true;
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
      case "player":
        gameController.queueUnitTypeChange(this, "monster_dead");
        value_1 = 0;
        value_2 = 5;
        return;
      default:
        return;
    }
  }
}