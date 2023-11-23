import 'package:my_app/controllers/gamecontroller.dart';

import '../../constants.dart';
import '../unit.dart';

class JumperUp extends Unit {
  JumperUp({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height}){
    value_1 = 1;
    value_2 = 32;
  }
    
  @override
  String getImage(){
    return 'assets/jumper.png';
  }

  @override
  void doAction(GameController gameController) {

    if(value_1 == 0){
      value_1 = 1;
    }

    if(value_1 == value_2){
      gameController.queueUnitTypeChange(this, "jumper_falling");
      value_1 = 1;
      return;
    }

    for(int i = 0; i < gameController.gameMap.unitOfSpeedNormal(); i++){
      Unit spriteAbove = gameController.gameMap.getPotentialCollision(this, "UP");
      switch (spriteAbove.type) {
        case "air":
          gameController.gameMap.moveUnitUp(this);
          break;
        default:
          gameController.queueUnitTypeChange(this, "jumper_falling");
          return;
      }
    }
    value_1 ++;
  }
}