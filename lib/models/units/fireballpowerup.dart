import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/basicmap.dart';
import 'package:my_app/models/map.dart';

import '../unit.dart';

class FireballPowerup extends Unit {
  FireballPowerup({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  String getImage(){
    if(value_1 < 21){
      return 'assets/powerup_fireball_3.png';
    } else if(value_1 < 23) {
      return 'assets/powerup_fireball_0.png';
    } else if(value_1 < 25) {
      return 'assets/powerup_fireball_1.png';
    } else {
      return 'assets/powerup_fireball_2.png';
    }
  }

  @override
  void doAction(GameController gameController){

    value_1 = (value_1 + 1) % 27;

    if(gameController.gameMap.isSpriteInVicinity(gameController.gameMap.player, this, 0)){
        gameController.gameMap.removeSprite(this);
        gameController.gameMap.player.value_1 = 3;
    }
  }
}