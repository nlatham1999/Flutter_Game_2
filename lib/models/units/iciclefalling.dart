import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/unit.dart';

import '../../constants.dart';

class IcicleFalling extends Unit {
  IcicleFalling({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});

  @override
  void doAction(GameController gameController) {
    for(int i = 0; i < (kCellSize / 4); i++){
      Unit spriteBelow = gameController.gameMap.getPotentialCollision(this, "DOWN");

      switch (spriteBelow.type) {
        case "air":
          gameController.gameMap.moveUnitDown(this);
          break;
        case "player":
          gameController.gameOver = true;
          gameController.gameOverText = "You got spiked :(";
          return;
        default:
          gameController.gameMap.removeSprite(this);
          return;
      }
    }
  }
}