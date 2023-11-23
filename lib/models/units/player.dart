import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/basicmap.dart';
import 'package:my_app/models/map.dart';

import '../../constants.dart';
import '../unit.dart';
import 'fireballplayer.dart';

class Player extends Unit {
  bool jumpState = false;
  int jumpCount = 0;

  bool jumpTrigger = false;
  bool leftTrigger = false;
  bool rightTrigger = false;
  bool fireTrigger = false;

  bool leftPressed = false;
  bool rightPressed = false;
  int movingSpeed = 1;

  @override
  int processingIndex = 1;
  

  Player({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  String getImage(){
    if (direction == 0) {
      return 'assets/player_right_small.png';
    } else {
      return 'assets/player_left_small.png';
    }
  }

  @override
  void doAction(GameController gameController) {
    
    //fall down is before jump so we can jump on descending logs
    if(!jumpState && !gameController.isOnSolidGround(this, groundPriority: "solid")){
      fallDown(gameController);
    }


    //if the jump button is still being pressed and we are ok for a jump then jump
    if (gameController.keyPressed.contains("jump_pressed") || gameController.keyPressed.contains("jump_clicked")) {
      if (!jumpState && gameController.isOnSolidGround(this)){
        jumpTrigger = true;
      }
      gameController.keyPressed.remove("jump_clicked");
    }

    if(jumpTrigger){
      jump(gameController);
      jumpTrigger = false;
    }

    if(gameController.keyPressed.contains("left_pressed") || gameController.keyPressed.contains("left_clicked")){
      moveLeft(gameController);
      direction = 1;
      gameController.keyPressed.remove("left_clicked");
    }

    if(gameController.keyPressed.contains("right_pressed") || gameController.keyPressed.contains("right_clicked")){
      moveRight(gameController);
      direction = 0;
      gameController.keyPressed.remove("right_clicked");
    }

    if(jumpState){
      updateJump(gameController);
    }

    if(gameController.keyPressed.contains("fire_trigger")){
      fireFireball(gameController);
      gameController.keyPressed.remove("fire_trigger");
    }

    if(gameController.keyPressed.contains("sprint_mode")){
      movingSpeed = 2;
    }else{
      movingSpeed = 1;
    }
  }

  void moveRight(GameController gameController){
    for(int i = 0; i < movingSpeed * gameController.gameMap.unitOfSpeedNormal(); i++) {
    Unit spriteRight = gameController.gameMap.getPotentialCollision(this, "RIGHT");
    switch (spriteRight.type) {
      case "air":
        gameController.gameMap.moveUnitRight(this);
        break;
      default:
        if (spriteRight.playerHittingFromSideAction(gameController)){   
          die(gameController);
          return;
        }
    }
    }
  }

  void moveLeft(GameController gameController){
    for(int i = 0; i < movingSpeed *  gameController.gameMap.unitOfSpeedNormal(); i++){
      Unit spriteLeft = gameController.gameMap.getPotentialCollision(this, "LEFT");
      switch (spriteLeft.type) {
        case "air":
          gameController.gameMap.moveUnitLeft(this);
          break;
        default:
          if (spriteLeft.playerHittingFromSideAction(gameController)){
            die(gameController);
            return;
          }
      }
    }
  }
  bool isPlayerInFireState(){
    return value_1 > 0;
  }

  void fireFireball(GameController gameController){
    if(value_1 > 0){
      value_1 -= 1;
    }else{
      return;
    }

    //find the proper x
    int x_temp = 0;
    if(direction == 0){
      x_temp = x * kCellSize + offsetX;
      x_temp += kCellSize;
    } else {
      x_temp = x * kCellSize + offsetX - 1;
    }


    Unit fireball = FireballPlayer(type: "player_fireball", x: x_temp ~/ kCellSize, y: y, offsetX: x_temp % kCellSize, offsetY: kCellSize ~/ 2, width: kCellSize ~/ 4, height: kCellSize ~/ 4);
    fireball.value_1 = direction;
    fireball.value_2 = 10;
    gameController.gameMap.addUnit(fireball);
  }

  
  void jump(GameController gameController){

    if(!gameController.isOnSolidGround(this)){
      return;
    }

    if(jumpState){
      return;
    }

    jumpState = true;
  }

  void updateJump(GameController gameController){
    int jumpMax = 10 ~/ gameController.gameMap.unitOfSpeedSlow();
    int jumpFirst = 4 ~/ gameController.gameMap.unitOfSpeedSlow();
    if(jumpCount < jumpMax && jumpCount > 0){
      
      int spacesToJump = 4;
      if(jumpCount >= jumpFirst){
        spacesToJump = 2;
      }

      for(int i = 0; i < spacesToJump *  gameController.gameMap.unitOfSpeedNormal(); i++){
        print("$jumpCount $jumpMax $jumpFirst $i $spacesToJump");
        Unit spriteAbove = gameController.gameMap.getPotentialCollision(gameController.gameMap.player, "UP");
        switch (spriteAbove.type) {
          case "air":
            spriteAbove.playerHittingFromBelowAction(gameController);
            break;
          default:
            if (spriteAbove.playerHittingFromBelowAction(gameController)){
              die(gameController);
              return;
            }
            i = 100;
            jumpCount = jumpMax;
            break;
        }
      }

      jumpCount++;
      return; 
    }

    if(jumpCount == 0){
      jumpCount = 1;
      return;
    }

    jumpCount = 0;
    jumpState = false;
  } 

  void fallDown(GameController gameController){
    if(fall == 0){
      fall = 1;
    }
    for(int i = 0; i < 2 *  gameController.gameMap.unitOfSpeedNormal(); i++){
      Unit spriteBelow = gameController.gameMap.getPotentialCollision(this, "DOWN");
      bool exitEarly = spriteBelow.playerHittingFromAboveAction(gameController, this);
      if(exitEarly){
        if(gameController.gameOver){
          die(gameController);
        }
        return;
      }
    }
    if(fall < 5){
      fall++;
    }
  }  
}