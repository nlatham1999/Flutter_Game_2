import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/models/unit.dart';

import '../models/basicmap.dart';
import '../models/map.dart';
import '../util/util.dart';

class GameController  extends ChangeNotifier{
  late BasicMap gameMap;
  late bool jumpState;
  late int jumpCount;

  late bool jumpTrigger;
  late bool leftTrigger;
  late bool rightTrigger;

  late bool leftPressed;
  late bool rightPressed;

  late int viewMapLeft;
  late int viewMapRight;
  late int viewMapWidth;

  late bool gameOver;

  late List<List<Unit>> mapTemp = [];

  late double cellWidth;
  late double cellHeight;

  late double offsetX;
  double offsetY;
  Size screenSize;

  String gameOverText = "";

  int cellsPerView = 15;

  late int distanceTraveled;

  GameController({
    required this.offsetY,
    required this.screenSize,
  }){

    viewMapWidth = 12;

    int divisor = viewMapWidth;
    if(screenSize.height < screenSize.width){
      divisor = 18;
    }

    double minDimension = screenSize.shortestSide;
    double cellSize = (minDimension/divisor) - ((minDimension/divisor) % 4);
    cellHeight = cellSize;
    cellWidth = cellSize;
  
    offsetX = (screenSize.width - (cellSize * (viewMapWidth+1))) / 2;

    reset();
  }

  void reset(){
    distanceTraveled = 0;
    gameMap = BasicMap();
    jumpState = false;
    jumpCount = 0;

    jumpTrigger = false;
    leftTrigger = false;
    rightTrigger = false;

    leftPressed = false;
    rightPressed = false;

    viewMapLeft = 0;
    viewMapRight = 15;

    gameOver = false;
  }

  void setNextState(){

    if(gameMap.map[0].length - 1 == distanceTraveled){
      gameOver = true;
      gameOverText  = "YOU WON!!!";
      return;
    }

    if(gameMap.playerX > distanceTraveled){
      distanceTraveled = gameMap.playerX;
    }

    if(jumpTrigger){
      jump();
      jumpTrigger = false;
    }

    if(leftTrigger){
      // moveLeft();
      // if(!leftPressed){
        leftTrigger = false;
      // }
    }

    if(rightTrigger){
      // moveRight();
      // if(!rightPressed){
        rightTrigger = false;
      // }
    }

    if(!jumpState && !isOnSolidGround(gameMap.player)){
      fallDown();
    }

    if(jumpState){
      updateJump();
    }

    updateSprites();

    updateViewMap();

  }

  void updateSprites(){
    // mapTemp = [];
    
    // for(int i = 0; i < gameMap.map.length; i++){
    //   List<Unit> tempList = [];
    //   for(int j = 0; j < gameMap.map[i].length; j++){
    //     tempList.add(gameMap.map[i][j]);
    //   }
    //   mapTemp.add(tempList);
    // }

    int startLeft = gameMap.playerX - 20;
    if(startLeft < 0){
      startLeft = 0;
    }
    int startRight = gameMap.playerX + 20;
    if(startRight > gameMap.map[0].length - 1){
      startRight = gameMap.map[0].length - 1;
    }

    for(int i = 0; i < gameMap.map.length; i++){
      for(int j = startLeft; j < startRight; j++){
        for(int k = 0; k < gameMap.map[i][j].length; k++){
          Unit unit = gameMap.map[i][j][k];
          switch (getSpriteType(unit)) {
            case "monster_left":
              spriteMonsterLeft(unit);
              break;
            case "monster_right":
              spriteMonsterRight(unit);
              break;
            // case "j":
            //   spriteJumperUp(j, i);        
            //   break;
            // case "J":
            //   spriteJumperDown(j, i);
            //   break;
            // case "m":
            //   spriteMonsterLeft(j, i);
            //   break;
            // case "M":
            //   spriteMonsterRight(j, i);
            //   break;
            // case "b":
            //   spriteBombInert(j, i);
            //   break;
            // case "B":
            //   spriteBombCharged(j, i);
            //   break;
            // case "e":
            //   spriteExplosion(j, i);
            //   break;
            // case "E":
            //   spriteExplosion2(j, i);
            //   break;
            // case "i":
            //   spriteIcicleCheck(j, i);
            //   break;
            // case "I":
            //   spriteIcicleFallDown(j, i);
            //   break;
            default:
          }
        }
      }
    }

    // for(int i = 0; i < gameMap.map.length; i++){
    //   for(int j = 0; j < gameMap.map[i].length; j++){
    //     gameMap.map[i][j] = mapTemp[i][j];
    //   }
    // }
  }

  // void spriteIcicleCheck(int x, int y){
  //   if(gameMap.playerX == x && gameMap.playerY >= y){
  //     mapTemp[y][x] = "I";
  //   }
  // }

  // void spriteIcicleFallDown(int x, int y){

  //   String spriteBelow = getSpriteType(gameMap.map[y+1][x]);

  //   if(isOnSolidGroundFromPos(x, y)){
  //     mapTemp[y][x] = "a";
  //     return;
  //   }

  //   switch (spriteBelow) {
  //     case "p":
  //       gameOver = true;
  //       gameOverText = "You got spiked";
  //       break;
  //     default:
  //       mapTemp[y][x] = "a";
  //       mapTemp[y+1][x] = "I";
  //   }
  // }

  // void spriteExplosion2(x, y){
  //   mapTemp[y][x] = "a";
  // }

  // void spriteExplosion(x, y){
  //   mapTemp[y][x] = "E";
  // }

  // void spriteBombInert(x, y){
  //   if((gameMap.playerX - x).abs() < 2 && (gameMap.playerY - y).abs() < 2){
  //     mapTemp[y][x] = "B1";
  //   }
  // }

  // void spriteBombCharged(x, y){

  //   num amount = getSpriteAmount(gameMap.map[y][x]);
  //   amount++;
  //   if(amount < 40){
  //     mapTemp[y][x] = "B" + amount.toString(); 
  //     return;
  //   }

  //   for(int i = x-1; i <= x+1; i++){
  //     for(int j = y-1; j <= y+1; j++){
  //       switch (getSpriteType(gameMap.map[j][i])) {
  //         case "a":
  //         case "B":
  //           mapTemp[j][i] = "e";
  //           break;
  //         case "p":
  //           mapTemp[j][i] = "e";
  //           gameOver = true;
  //           gameOverText = "You exploded";
  //           break;
  //         default:
  //       }
  //     }
  //   }
  // }

  void spriteMonsterLeft(Unit unit){

    String spriteBelow = gameMap.getPotentialCollision(unit, "DOWN");
    switch (spriteBelow) {
      case "":
        gameMap.moveUnitDown(unit);
        return;
      default:
    }

    String spriteLeft = gameMap.getPotentialCollision(unit, "LEFT");
    switch (spriteLeft) {
      case "-1":
        return;
      case "":
        gameMap.moveUnitLeft(unit);
        break;
      default:
        unit.type = "monster_right";
    }
    
  }

  void spriteMonsterRight(Unit unit){
    String spriteBelow = gameMap.getPotentialCollision(unit, "DOWN");
    switch (spriteBelow) {
      case "":
        gameMap.moveUnitDown(unit);
        return;
      default:
    }

    String spriteLeft = gameMap.getPotentialCollision(unit, "RIGHT");
    switch (spriteLeft) {
      case "-1":
        return;
      case "":
        gameMap.moveUnitRight(unit);
        break;
      default:
        unit.type = "monster_left";
    }
    
  }


  // void spriteJumperUp(int x, int y){

  //   num amount = getSpriteAmount(gameMap.map[y][x]);
  //   if(amount < 4){
  //     amount++;
  //     mapTemp[y][x] = "j" + amount.toString();
  //     return;
  //   }

  //   //super jank to have it go two up
  //   switch (gameMap.map[y+1][x]) {
  //     case "g":
  //       mapTemp[y][x] = "a";
  //       mapTemp[y-1][x] = "j0";
  //       break;
  //     default:
  //       switch (gameMap.map[y+2][x]){
  //         case "g":
  //           mapTemp[y][x] = "a";
  //           mapTemp[y-1][x] = "j0";
  //           break;
  //         default:
  //           mapTemp[y][x] = "a";
  //           mapTemp[y-1][x] = "J0";
  //       }
  //   }
  // }

  // void spriteJumperDown(int x, int y){
  //   switch (getSpriteType(gameMap.map[y+1][x])) {
  //     case "p":
  //       gameOver = true;
  //       gameOverText = "You got smushed";
  //       break;
  //     default:
  //   }

  //   mapTemp[y][x] = "a";
  //   mapTemp[y+1][x] = "J0";
  //   switch (gameMap.map[y+2][x]) {
  //     case "g":
  //       mapTemp[y+1][x] = "j0";
  //       break;
  //     case "a":
  //       break;
  //     default:
  //   }
  // }

  void updateViewMap(){
    if(viewMapRight - gameMap.playerX < 5){
      viewMapRight = gameMap.playerX + 5;
      if(viewMapRight > gameMap.map[0].length-1){
        viewMapRight = gameMap.map[0].length-1;
      }
      viewMapLeft = viewMapRight - viewMapWidth;
    }

    if(gameMap.playerX - viewMapLeft < 5){
      viewMapLeft = gameMap.playerX - 5;
      if(viewMapLeft < 0){
        viewMapLeft = 0;
      }
      viewMapRight = viewMapLeft + viewMapWidth;

    }
  }

  // void moveRight(){
  //   if(gameMap.map[gameMap.playerY].length <= gameMap.playerX + 1){
  //     return;
  //   }

  //   switch (getSpriteType(gameMap.map[gameMap.playerY][gameMap.playerX+1])) {
  //     case "a":
  //       gameMap.map[gameMap.playerY][gameMap.playerX] = "a";
  //       gameMap.playerX++;
  //       gameMap.map[gameMap.playerY][gameMap.playerX] = "p";
  //       break;
  //     case "m":
  //     case "M":
  //       gameOver = true;
  //       gameOverText = "You got eaten";
  //       return;
  //     case "j":
  //     case "J":
  //       gameOver = true;
  //       gameOverText = "You got smushed";
  //       return;
  //     default:
  //       break;
  //   }
  // }

  // void moveLeft(){
  //   if(gameMap.playerX < 1){
  //     return;
  //   }

  //   switch (getSpriteType(gameMap.map[gameMap.playerY][gameMap.playerX-1])) {
  //     case "a":
  //       gameMap.map[gameMap.playerY][gameMap.playerX] = "a";
  //       gameMap.playerX--;
  //       gameMap.map[gameMap.playerY][gameMap.playerX] = "p";
  //       break;
  //     case "m":
  //     case "M":
  //       gameOver = true;
  //       gameOverText = "You got eaten";
  //       return;
  //     case "j":
  //     case "J":
  //       gameOver = true;
  //       gameOverText = "You got smushed";
  //       return;
  //     default:
  //       break;
  //   }
  // }

  bool isOnSolidGround(Unit unit){
    String spriteBelow = gameMap.getPotentialCollision(unit, "DOWN");
    switch (spriteBelow) {
      case "grass":
        return true;
      default:
        return false;
    }
  }

  void jump(){

    if(!isOnSolidGround(gameMap.player)){
      return;
    }

    if(jumpState){
      return;
    }

    jumpState = true;
  }

  void updateJump(){
    if(jumpCount < 5 && jumpCount > 0){
      
      int spacesToJump = 4;
      if(jumpCount == 2){
        spacesToJump = 3;
      }
      if(jumpCount == 3){
        spacesToJump = 2;
      }
      if(jumpCount == 4){
        spacesToJump = 1;
      }

      for(int i = 0; i < spacesToJump; i++){
        String spriteAbove = gameMap.getPotentialCollision(gameMap.player, "UP");
        switch (spriteAbove) {
          case "-1":
            i = spacesToJump;
            break;
          default:
            gameMap.moveUnitUp(gameMap.player);
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

  // bool isOnJumpableSprite(){
  //   switch (getSpriteType(gameMap.map[gameMap.playerY+1][gameMap.playerX])) {
  //     case "m":
  //     case "M":
  //     case "b":
  //     case "B":
  //     case "j":
  //     case "J":
  //       return true;
  //     default:
  //       return false;
  //   }
  // }

  void fallDown(){
    for(int i = 0; i < gameMap.player.fall; i++){
      String spriteBelow = gameMap.getPotentialCollision(gameMap.player, "DOWN");
      switch (spriteBelow) {
        case "":
          gameMap.moveUnitDown(gameMap.player);
          break;
        default:
          gameMap.player.fall = 0;
          return;
      }
    }
    if(gameMap.player.fall < 5){
      gameMap.player.fall++;
    }

  }  
}