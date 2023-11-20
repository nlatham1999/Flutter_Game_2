import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/units/player.dart';

import '../unit.dart';

class OutOfBounds extends Unit {
  OutOfBounds({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  bool playerHittingFromAboveAction(GameController gameController, Player player){
    gameController.gameOver = true;
    gameController.gameOverText = "You fell off the edge of the map :(";
    return true;
  }

  @override
  void doAction(GameController gameController) {
  }
}