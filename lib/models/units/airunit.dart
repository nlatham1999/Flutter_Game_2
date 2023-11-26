import 'package:monster_maze/controllers/gamecontroller.dart';
import 'package:monster_maze/models/units/player.dart';

import '../unit.dart';

class Air extends Unit {
  Air({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override 
  bool playerHittingFromBelowAction(GameController gameController){
    gameController.gameMap.moveUnitUp(gameController.gameMap.player);
    return false;
  }

  @override
  bool playerHittingFromAboveAction(GameController gameController, Player player){
    gameController.gameMap.moveUnitDown(player);
    return false;
  }

  @override
  void doAction(GameController gameController) {
  }
}