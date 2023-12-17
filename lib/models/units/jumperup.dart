import 'package:monster_maze/controllers/gamecontroller.dart';

import '../../constants.dart';
import '../unit.dart';

class JumperUp extends Unit {

  int riseCount = 1;
  int riseMax = 48;

  JumperUp({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height}){
    value_1 = 1;
    value_2 = 10;
  }
    
  @override
  String getImage(){
    return 'assets/jumper.png';
  }

  @override
  void doAction(GameController gameController) {

    if(riseCount == 0){
      riseCount = 1;
    }

    if(riseCount >= riseMax){
      gameController.queueUnitTypeChange(this, "jumper_falling");
      riseCount = 1;
      return;
    }

    for(int i = 0; i < gameController.gameMap.unitOfSpeedSlow(); i++){
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
    riseCount ++;
  }
}