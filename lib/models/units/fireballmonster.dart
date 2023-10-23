import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/unit.dart';

class FireballMonster extends Unit {
  FireballMonster({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  String getImage(){
    return 'assets/fireball.png';
  }

  @override
   bool playerHittingFromBelowAction(GameController gameController){
    gameController.gameOver = true;
    gameController.gameOverText = "You hit a fireball :(";
    return true;
  }
  
  @override
  bool playerHittingFromAboveAction(GameController gameController){
    gameController.gameOver = true;
    gameController.gameOverText = "You fell onto a fireball :(";
    return true;
  }


  @override
  void doAction(GameController gameController) {
    for(int i = 0; i < 3; i++){
      value_1++;
      if(value_1 == 40){
        gameController.gameMap.removeSprite(this);
        return;
      }
      if(value_2 == 1){
        Unit spriteLeft = gameController.gameMap.getPotentialCollision(this, "LEFT");
        switch (spriteLeft.type) {
          case "fire_monster_left":
          case "air":
            gameController.gameMap.moveUnitLeft(this);
            break;
          case "player":
            gameController.gameOver = true;
            gameController.gameOverText = "You got hit with a fireball :(";
            break;
          default:
            gameController.gameMap.removeSprite(this);
            return;
        }
      }else{
        Unit spriteRight = gameController.gameMap.getPotentialCollision(this, "RIGHT");
        switch (spriteRight.type) {
          case "fire_monster_right":
          case "air":
            gameController.gameMap.moveUnitRight(this);
            break;
          case "player":
            gameController.gameOver = true;
            gameController.gameOverText = "You got hit with a fireball :(";
            break;
          default:
            gameController.gameMap.removeSprite(this);
            return;
        }
      }
    }
  }
}