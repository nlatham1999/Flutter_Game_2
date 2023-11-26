import 'package:monster_maze/controllers/gamecontroller.dart';
import 'package:monster_maze/models/unit.dart';
import 'package:monster_maze/models/units/player.dart';

import '../../constants.dart';

class MonsterRight extends Unit {
  MonsterRight({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  String getImage(){
    if (value_1 < 2){
      return 'assets/monster_right_small.png';
    }else{
      return 'assets/monster_right_small_2.png';
    }
  }

  @override
   bool playerHittingFromBelowAction(GameController gameController){
    gameController.gameOver = true;
    gameController.gameOverText = "You got eaten :(";
    return true;
  }
  
  @override
  bool playerHittingFromAboveAction(GameController gameController, Player player){
    die(gameController);
    return false;
  }
  
  @override
  void doAction(GameController gameController) {
    
    value_1 = (value_1 + 1) % 4;
    
    bool unitMoved = false;
    for(int i = 0; i < gameController.gameMap.unitOfSpeedSpeedy(); i++) {
      Unit spriteBelow = gameController.gameMap.getPotentialCollision(this, "DOWN", playerPriority: "low");
      switch (spriteBelow.type) {
        case "player_fireball":
          die(gameController);
          gameController.gameMap.removeSprite(spriteBelow);
          return;
        case "player":
          gameController.gameOver = true;
          gameController.gameOverText = "You got eaten :(";
          spriteBelow.die(gameController);
          break;
        case "-1":
          gameController.gameMap.removeSprite(this);
          unitMoved = true;
          break;
        case "air":
          gameController.gameMap.moveUnitDown(this);
          unitMoved = true;
          break;
        default:
      }
    }
    if(unitMoved){
      return;
    }
    
    for(int i = 0; i < gameController.gameMap.unitOfSpeedNormal(); i++) {
      Unit spriteLeft = gameController.gameMap.getPotentialCollision(this, "RIGHT", playerPriority: "low");
      switch (spriteLeft.type) {
        case "player_fireball":
          die(gameController);
          gameController.gameMap.removeSprite(spriteLeft);
          return;
        case "player":
          gameController.gameOver = true;
          gameController.gameOverText = "You got eaten :(";
          spriteLeft.die(gameController);
          break;
        case "air":
          gameController.gameMap.moveUnitRight(this);
          break;
        default:
          gameController.queueUnitTypeChange(this, "monster_left");
      }
    }
  }
}