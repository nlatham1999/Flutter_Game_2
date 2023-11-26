import 'package:monster_maze/controllers/gamecontroller.dart';
import 'package:monster_maze/models/basicmap.dart';
import 'package:monster_maze/models/map.dart';

import '../../constants.dart';
import '../unit.dart';

class LogHorizontal extends Unit {
  LogHorizontal({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  String getImage(){
    return 'assets/log.png';
  }

  @override
  bool get isSolidGround => true;
  
  @override
  void doAction(GameController gameController){
    // unit.value_4 = (unit.value_4 + 1) % 2;
    // if(unit.value_4 == 1){
    //   return;
    // }

    value_2++;
    if(value_2 > value_3 *  gameController.gameMap.unitOfSpeedNormal()){
      if(value_1 == 0){
        value_1 = 1;
      }else{
        value_1 = 0;
      }
      value_2 = 0;
    }


    for(int i = 0; i < gameController.gameMap.unitOfSpeedSlow(); i++) {
      if(value_1 == 0){
        Unit spriteLeft = gameController.gameMap.getPotentialCollision(this, "LEFT");
        switch (spriteLeft.type) {
          case "air":
            gameController.gameMap.moveUnitLeft(this);
            List<Unit> spritesAbove = gameController.gameMap.getUnitsAbove(this, onlyOnUnit: true);
            for(Unit spriteAbove in spritesAbove){
              Unit spriteAboveLeft = gameController.gameMap.getPotentialCollision(spriteAbove, "LEFT");
              switch (spriteAboveLeft.type) {
                case "air":
                  gameController.gameMap.moveUnitLeft(spriteAbove);
                  break;
                default:
              }
            }
            break;
          default:
            value_1 = 1;
            value_2 = 0;
        }
      }else{
        Unit spriteRight = gameController.gameMap.getPotentialCollision(this, "RIGHT");
        switch (spriteRight.type) {
          case "air":
            gameController.gameMap.moveUnitRight(this);
            List<Unit> spritesAbove = gameController.gameMap.getUnitsAbove(this, onlyOnUnit: true);
            for(Unit spriteAbove in spritesAbove){
              Unit spriteAboveRight = gameController.gameMap.getPotentialCollision(spriteAbove, "RIGHT");
              switch (spriteAboveRight.type) {
                case "air":
                  gameController.gameMap.moveUnitRight(spriteAbove);
                  break;
                default:
              }
            }
            break;
          default:
            value_1 = 0;
            value_2 = 0;
        }
      }
    }
  }
}