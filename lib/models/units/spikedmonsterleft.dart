import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/unit.dart';

class SpikedMonsterLeft extends Unit {
  SpikedMonsterLeft({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  bool playerHittingFromSideAction(GameController gameController){
    gameController.gameOver = true;
    gameController.gameOverText = "You ran into a monster :(";
    return true;
  }

  @override
  bool playerHittingFromAboveAction(GameController gameController){
    gameController.gameOver = true;
    gameController.gameOverText = "You fell onto a monster :(";
    return true;
  }
  
  @override
  void doAction(GameController gameController) {

    value_1 = (value_1 + 1) % 8;

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
        return;
      case "air":
        gameController.gameMap.moveUnitDown(this);
        return;
      default:
    }

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
        gameController.queueUnitTypeChange(this, "spiked_monster_right");
    }
  }
}