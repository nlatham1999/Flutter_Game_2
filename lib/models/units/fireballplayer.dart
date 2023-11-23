import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/basicmap.dart';

import '../../constants.dart';
import '../unit.dart';

class FireballPlayer extends Unit {
  FireballPlayer({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  String getImage(){
    return 'assets/player_fireball.png';
  }

  @override
  void doAction(GameController gameController){
    value_2 -= 1;

    String direction = value_1 == 1 ? "LEFT" : "RIGHT";
    
    for (int i = 0; i < 2 *  gameController.gameMap.unitOfSpeedNormal(); i++){
    Unit spriteLeft = gameController.gameMap.getPotentialCollision(this, direction);
    switch (spriteLeft.type) {
      case "monster_left":
      case "monster_right":
      case "spiked_monster_left":
      case "spiked_monster_right":
      case "winged_monster":
      case "fire_monster_left":
      case "fire_monster_right":
      case "jumper_rising":
      case "jumper_falling":
      case "bomb":
      case "bomb_charged":
        spriteLeft.die(gameController);
        gameController.gameMap.removeSprite(this);
        return;
      case "monster_dead":
      case "explosion":
      case "icicle":
      case "icicle_falling":
      case "fireball":
        gameController.gameMap.removeSprite(spriteLeft);
        gameController.gameMap.removeSprite(this);
        return;
      case "grass":
      case "log":
      case "log_horizontal":
      case "player_fireball":
      case "-1":
        gameController.gameMap.removeSprite(this);
        return;
      default:
        break;
    }

    if (value_1 == 1){
        gameController.gameMap.moveUnitLeft(this);
    }else{
        gameController.gameMap.moveUnitRight(this);
    }
    }

    if(value_2 <= 0){
      gameController.gameMap.removeSprite(this);
    }
  }
}