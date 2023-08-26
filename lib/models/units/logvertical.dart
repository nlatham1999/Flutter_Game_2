import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/basicmap.dart';

import '../../constants.dart';
import '../unit.dart';

class LogVertical extends Unit {
  LogVertical({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  bool get isSolidGround => true;
  
  @override
  void doAction(GameController gameController){
    if(value_2 >= 4 * kCellSize - 1){
      if(value_1 == 0){
        value_1 = 1;
      }else{
        value_1 = 0;
      }
      value_2 = 0;
    }

    if(value_1 == 0){

      List<Unit> spritesAbove = gameController.gameMap.getUnitsAbove(this);
      
      if(spritesAbove.length == 1 && spritesAbove[0].type == "-1"){
        value_1 = 1;
        return;
      }

      for(int i = 0; i < spritesAbove.length; i++){
        Unit spriteAbove = gameController.gameMap.getPotentialCollision(spritesAbove[i], "UP");
        if(spriteAbove.type != "air"){
          return;
        }
      }

      for(int i = 0; i < spritesAbove.length; i++){
        gameController.gameMap.moveUnitUp(spritesAbove[i]);
      }

      gameController.gameMap.moveUnitUp(this);

    }else{
      Unit spriteBelow = gameController.gameMap.getPotentialCollision(this, "DOWN");
      switch (spriteBelow.type) {
        case "air":
          // List<Unit> spritesAbove = gameMap.getUnitsAbove(unit);
      
          // if(spritesAbove.length == 1 && spritesAbove[0].type == "-1"){
          //   unit.value_2 = 1;
          //   return;
          // }

          // for(int i = 0; i < spritesAbove.length; i++){
          //   gameMap.moveUnitDown(spritesAbove[i]);
          // }

          gameController.gameMap.moveUnitDown(this);
          break;
        default:
          return;
      }
    }
    value_2++;
  }
}