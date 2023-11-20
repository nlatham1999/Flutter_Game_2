import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/unit.dart';

class MonsterDead extends Unit {
  MonsterDead({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  String getImage(){
    if(value_2 == 1){
      return 'assets/ghost_dead.png';
    }else if(value_2 == 2){
      return 'assets/fire_monster_small_dead.png';
    }else if(value_2 == 3){
      return 'assets/jumper_dead.png';
    }else if(value_2 == 4){
      return 'assets/bomb_dead.png';
    }else if (value_2 == 5){
      return 'assets/player_dead_small.png'; 
    }
    return 'assets/monster_dead.png';
  }

  @override
  bool get isSolidGround => true;

  @override 
  void doAction(GameController gameController) {
    value_1++;
    if(value_1 > 10){
      gameController.gameMap.removeSprite(this);
    }

    Unit spriteBelow = gameController.gameMap.getPotentialCollision(this, "DOWN");
    if (spriteBelow == gameController.gameMap.airUnit){
      gameController.gameMap.moveUnitDown(this);
    }
  }
}