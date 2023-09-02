import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/unit.dart';
import 'package:my_app/models/units/fireballmonster.dart';

import '../../constants.dart';

class FireMonsterRight extends Unit {
  FireMonsterRight({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  void doAction(GameController gameController) {
    if(gameController.gameMap.isUnitSomewherAboveUnit(this, gameController.gameMap.player) && gameController.gameMap.isSpriteInVicinity(this, gameController.gameMap.player, 5)){
      value_2 = 1;
    }else{
      value_2 = 0;
    }
    
    if(gameController.gameMap.isUnitSomewherBeforeUnit(this, gameController.gameMap.player)){
      value_1 = 0;
      gameController.queueUnitTypeChange(this, "fire_monster_left");
    }

    value_1 = (value_1 + 1) % 30;
    if(value_1 == 29){
      int lx = x * kCellSize + offsetX;
      lx += kCellSize;
      Unit fireball = FireballMonster(type: "fireball", x: lx ~/ kCellSize, y: y, offsetX: lx % kCellSize, offsetY: kCellSize ~/ 4, width: 2 * (kCellSize ~/ 4), height: 2 * (kCellSize ~/ 4));
      fireball.value_2 = 2;
      gameController.gameMap.addUnit(fireball);
    }
  }
}