import 'package:monster_maze/controllers/gamecontroller.dart';
import 'package:monster_maze/models/unit.dart';
import 'package:monster_maze/models/units/fireballmonster.dart';

import '../../constants.dart';

class FireMonsterLeft extends Unit {
  FireMonsterLeft({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  String getImage(){
    return 'assets/fire_monster_small_left.png';
  }

  @override
  void doAction(GameController gameController) {
    if(gameController.gameMap.isUnitSomewherAboveUnit(this, gameController.gameMap.player) && gameController.gameMap.isSpriteInVicinity(this, gameController.gameMap.player, 5)){
      value_2 = 1;
    }else{
      value_2 = 0;
    }

    if(!gameController.gameMap.isUnitSomewherBeforeUnit(this, gameController.gameMap.player)){
      value_1 = 0;
      gameController.queueUnitTypeChange(this, "fire_monster_right");
    }

    value_1 = (value_1 + 1) % 50;
    if(value_1 == 49){
      int lx = x * kCellSize + offsetX - 1;
      Unit fireball = FireballMonster(type: "fireball", x: lx ~/ kCellSize, y: y, offsetX: lx % kCellSize, offsetY: kCellSize ~/ 4, width: 2 * (kCellSize ~/ 4), height: 2 * (kCellSize ~/ 4));
      fireball.value_2 = 1;
      gameController.gameMap.addUnit(fireball);
    }

  }
}