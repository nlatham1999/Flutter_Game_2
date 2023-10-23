import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/unit.dart';

class SpikedMonsterRight extends Unit {
  SpikedMonsterRight({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});

  @override
  String getImage(){
    if (value_1 < 4){
      return 'assets/spiked_monster_right_small.png';
    }else{
      return 'assets/spiked_monster_right_small_2.png';
    }
  }

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

    Unit spriteLeft = gameController.gameMap.getPotentialCollision(this, "RIGHT", playerPriority: "low");
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
        gameController.gameMap.moveUnitRight(this);
        break;
      default:
        gameController.queueUnitTypeChange(this, "spiked_monster_left");
    }
    
  }
}