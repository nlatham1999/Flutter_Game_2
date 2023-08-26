import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/basicmap.dart';
import 'package:my_app/models/map.dart';

import '../unit.dart';

class FireballPowerup extends Unit {
  FireballPowerup({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  void doAction(GameController gameController){

    value_1 = (value_1 + 1) % 9;

    if(gameController.gameMap.isSpriteInVicinity(gameController.gameMap.player, this, 0)){
        gameController.gameMap.removeSprite(this);
        gameController.gameMap.player.value_1 = 3;
    }
  }
}