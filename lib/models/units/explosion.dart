import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/unit.dart';

import '../../constants.dart';

class Explosion extends Unit {
  Explosion({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  void doAction(GameController gameController) {

    for(int i = 0; i < 2 * (kCellSize / 4); i++){

      if(value_1 > 2 * (kCellSize)){
        gameController.gameMap.removeSprite(this);
        return;
      }

      Unit s = gameController.gameMap.airUnit;
      switch (value_2) {
        case 0:
          s = gameController.gameMap.getPotentialCollision(this, "LEFT_UP");
          if(s.type == "air"){
            gameController.gameMap.moveUnitLeft(this);
            gameController.gameMap.moveUnitUp(this);
          }
          break;
        case 1:
          s = gameController.gameMap.getPotentialCollision(this, "UP");
          if(s.type == "air"){
            gameController.gameMap.moveUnitUp(this);
          }
          break;
        case 2:
          s = gameController.gameMap.getPotentialCollision(this, "RIGHT_UP");
          if(s.type == "air"){
            gameController.gameMap.moveUnitRight(this);
            gameController.gameMap.moveUnitUp(this);
          }
          break;
        case 3:
          s = gameController.gameMap.getPotentialCollision(this, "RIGHT");
          if(s.type == "air"){
            gameController.gameMap.moveUnitRight(this);
          }
          break;
        case 4:
          s = gameController.gameMap.getPotentialCollision(this, "RIGHT_DOWN");
          if(s.type == "air"){
            gameController.gameMap.moveUnitRight(this);
            gameController.gameMap.moveUnitDown(this);
          }
          break;
        case 5:
          s = gameController.gameMap.getPotentialCollision(this, "DOWN");
          if(s.type == "air"){
            gameController.gameMap.moveUnitDown(this);
          }
          break;
        case 6:
          s = gameController.gameMap.getPotentialCollision(this, "LEFT_DOWN");
          if(s.type == "air"){
            gameController.gameMap.moveUnitLeft(this);
            gameController.gameMap.moveUnitDown(this);
          }
          break;
        case 7:
          s = gameController.gameMap.getPotentialCollision(this, "LEFT");
          if(s.type == "air"){
            gameController.gameMap.moveUnitLeft(this);
          }
          break;
        default:
      }

      if(s.type == "player"){
        gameController.gameOver = true;
        gameController.gameOverText = "You got bombed :(";
        return;
      }
      if(s.type != "air"){
        gameController.gameMap.removeSprite(this);
      }

      value_1++;
    }
  }
}