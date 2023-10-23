import 'dart:math';

import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/unit.dart';

class WingedMonster extends Unit {
  WingedMonster({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  String getImage(){
    if((value_1 == 0 && value_3 == 0) || (value_1 == 1 && value_3 == 1)){
      return 'assets/ghost_2.png';
    }else{
      return 'assets/ghost_3.png';
    }
  }

  @override
  void doAction(GameController gameController) {
    if(value_1 == 0){
      Unit spriteLeft = gameController.gameMap.getPotentialCollision(this, "LEFT");
      switch (spriteLeft.type) {
        case "player_fireball":
          die(gameController);
          gameController.gameMap.removeSprite(spriteLeft);
          return;
        case "air":
          gameController.gameMap.moveUnitLeft(this);
          break;
        case "player":
          gameController.gameOver = true;
          gameController.gameOverText = "You got eaten :(";
          return;
        default:
          value_1 = 1;
      }
    }else{
      Unit spriteRight = gameController.gameMap.getPotentialCollision(this, "RIGHT");
      switch (spriteRight.type) {
        case "player_fireball":
          die(gameController);
          gameController.gameMap.removeSprite(spriteRight);
          return;
        case "air":
          gameController.gameMap.moveUnitRight(this);
          break;
        case "player":
          gameController.gameOver = true;
          gameController.gameOverText = "You got eaten :(";
          return;
        default:
          value_1 = 0;
      }
    }

    value_2 = (value_2 + 1) % 6;
    if(value_2 == 0){
      Random random = Random();
      value_3 = random.nextInt(2);
    }



    if(value_3 == 0){
      Unit spriteUp = gameController.gameMap.getPotentialCollision(this, "UP");
      switch (spriteUp.type) {
        case "player_fireball":
          die(gameController);
          gameController.gameMap.removeSprite(spriteUp);
          return;
        case "air":
          gameController.gameMap.moveUnitUp(this);
          break;
        case "player":
          gameController.gameOver = true;
          gameController.gameOverText = "You got eaten :(";
          return;
        default:
          value_3 = 1;
      }
    }else{
      Unit spriteDown = gameController.gameMap.getPotentialCollision(this, "DOWN");
      switch (spriteDown.type) {
        case "player_fireball":
          die(gameController);
          gameController.gameMap.removeSprite(spriteDown);
          return;
        case "air":
          gameController.gameMap.moveUnitDown(this);
          break;
        case "player":
          gameController.gameOver = true;
          gameController.gameOverText = "You got eaten :(";
          return;
        default:
          value_3 = 0;
      }
    }
  }
}