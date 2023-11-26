import 'package:monster_maze/controllers/gamecontroller.dart';
import 'package:monster_maze/models/unit.dart';

import '../../constants.dart';

class JumperDown extends Unit {
  JumperDown({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});

  @override
  String getImage(){
    return 'assets/jumper.png';
  }

  @override
  void doAction(GameController gameController) {
    if(value_1 == 0){
      value_1 = 1;
    }

    if(value_1 < 1){
      value_1 = 1;
    }

    for(int i = 0; i < gameController.accelerationCalc(value_1) *  gameController.gameMap.unitOfSpeedNormal(); i++){
      Unit spriteAbove = gameController.gameMap.getPotentialCollision(this, "DOWN");
      switch (spriteAbove.type) {
        case "player":
          gameController.gameOver = true;
          gameController.gameOverText = "You got smushed";
          spriteAbove.die(gameController);
          return;
        case "air":
          gameController.gameMap.moveUnitDown(this);
          break;
        default:
          gameController.queueUnitTypeChange(this, "jumper_rising");
          value_1 = 1;
          return;
      }
    }
    value_1--;
  }
}