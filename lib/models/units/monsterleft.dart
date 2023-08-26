import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/basicmap.dart';

import '../../constants.dart';
import '../unit.dart';

class MonsterLeft extends Unit {
  MonsterLeft({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  void doAction(GameController gameController){

    value_1 = (value_1 + 1) % 4;

    bool unitMoved = false;
    for(int i = 0; i < kCellSize / 4; i++) {
      Unit spriteBelow = gameController.gameMap.getPotentialCollision(this, "DOWN", playerPriority: "low");
      switch (spriteBelow.type) {
        case "player_fireball":
          die(gameController);
          gameController.gameMap.removeSprite(spriteBelow);
          return;
        case "player":
          gameController.gameOver = true;
          gameController.gameOverText = "You got eaten :(";
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


    for(int i = 0; i < kCellSize / 4; i++) {
      Unit spriteLeft = gameController.gameMap.getPotentialCollision(this, "LEFT", playerPriority: "low");
      switch (spriteLeft.type) {
        case "player_fireball":
          die(gameController);
          gameController.gameMap.removeSprite(spriteLeft);
          return;
        case "player":
          gameController.gameOver = true;
          gameController.gameOverText = "You got eaten :(";
          break;
        case "air":
          gameController.gameMap.moveUnitLeft(this);
          break;
        default:
          gameController.queueUnitTypeChange(this, "monster_right");
      }
    }
  }
}