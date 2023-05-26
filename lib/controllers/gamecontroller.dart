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
    viewMapRight = 15 * 4;

    gameOver = false;
  }

  void setNextState(){

    if(gameMap.map[0].length - 1 == distanceTraveled){
      gameOver = true;
      gameOverText  = "YOU WON!!!";
      return;
    }

    if(gameMap.player.x > distanceTraveled){
      distanceTraveled = gameMap.player.x;
    }

    if(jumpTrigger){
      jump();
      jumpTrigger = false;
    }

    if(leftTrigger){
      moveLeft();
      if(!leftPressed){
        leftTrigger = false;
      }
    }

    if(rightTrigger){
      moveRight();
      if(!rightPressed){
        rightTrigger = false;
      }
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

    List<Unit> unitsUpdated = [];

    int startLeft = gameMap.player.x - 20;
    if(startLeft < 0){
      startLeft = 0;
    }
    int startRight = gameMap.player.x + 20;
    if(startRight > gameMap.map[0].length - 1){
      startRight = gameMap.map[0].length - 1;
    }

    for(int i = 0; i < gameMap.map.length; i++){
      for(int j = startLeft; j < startRight; j++){
        for(int k = 0; k < gameMap.map[i][j].length; k++){
          Unit unit = gameMap.map[i][j][k];
          if(unit.alreadyUpdated){
            continue;
          }else{
            unit.alreadyUpdated = true;
            unitsUpdated.add(unit);
          }
          switch (getSpriteType(unit)) {
            case "monster_left":
              spriteMonsterLeft(unit);
              break;
            case "monster_right":
              spriteMonsterRight(unit);
              break;
            case "jumper_rising":
              spriteJumperUp(unit);        
              break;
            case "jumper_falling":
              spriteJumperDown(unit);
              break;
            case "bomb":
              spriteBombInert(unit);
              break;
            case "bomb_charged":
              spriteBombCharged(unit);
              break;
            case "explosion":
              spriteExplosion(unit);
              break;
            case "icicle":
              spriteIcicleCheck(unit);
              break;
            case "icicle_falling":
              spriteIcicleFallDown(unit);
              break;
            default:
          }
        }
      }
    }

    for(Unit unit in unitsUpdated){
      unit.alreadyUpdated = false;
    }

    // for(int i = 0; i < gameMap.map.length; i++){
    //   for(int j = 0; j < gameMap.map[i].length; j++){
    //     gameMap.map[i][j] = mapTemp[i][j];
    //   }
    // }
  }

  void spriteIcicleCheck(Unit unit){
    if(gameMap.isUnitBelowUnit(unit, gameMap.player)){
      gameMap.changeUnitType(unit, "icicle_falling");
    }
  }

  void spriteIcicleFallDown(Unit unit){

    String spriteBelow = gameMap.getPotentialCollision(unit, "DOWN");

    switch (spriteBelow) {
      case "":
        gameMap.moveUnitDown(unit);
        break;
      case "player":
        gameOver = true;
        gameOverText = "You got spiked :(";
        return;
      default:
        gameMap.removeSprite(unit);
    }
  }

  void spriteExplosion(Unit unit){

    if(unit.value_1 > 3){
      gameMap.removeSprite(unit);
      return;
    }

    String s = "";
    switch (unit.value_2) {
      case 0:
        s = gameMap.getPotentialCollision(unit, "LEFT_UP");
        if(s == ""){
          gameMap.moveUnitLeft(unit);
          gameMap.moveUnitUp(unit);
        }
        break;
      case 1:
        s = gameMap.getPotentialCollision(unit, "UP");
        if(s == ""){
          gameMap.moveUnitUp(unit);
        }
        break;
      case 2:
        s = gameMap.getPotentialCollision(unit, "RIGHT_UP");
        if(s == ""){
          gameMap.moveUnitRight(unit);
          gameMap.moveUnitUp(unit);
        }
        break;
      case 3:
        s = gameMap.getPotentialCollision(unit, "RIGHT");
        if(s == ""){
          gameMap.moveUnitRight(unit);
        }
        break;
      case 4:
        s = gameMap.getPotentialCollision(unit, "RIGHT_DOWN");
        if(s == ""){
          gameMap.moveUnitRight(unit);
          gameMap.moveUnitDown(unit);
        }
        break;
      case 5:
        s = gameMap.getPotentialCollision(unit, "DOWN");
        if(s == ""){
          gameMap.moveUnitDown(unit);
        }
        break;
      case 6:
        s = gameMap.getPotentialCollision(unit, "LEFT_DOWN");
        if(s == ""){
          gameMap.moveUnitLeft(unit);
          gameMap.moveUnitDown(unit);
        }
        break;
      case 7:
        s = gameMap.getPotentialCollision(unit, "LEFT");
        if(s == ""){
          gameMap.moveUnitLeft(unit);
        }
        break;
      default:
    }

    if(s == "player"){
      gameOver = true;
      gameOverText = "You got bombed :(";
      return;
    }
    if(s != ""){
      gameMap.removeSprite(unit);
    }

    unit.value_1++;

  }

  void spriteBombInert(Unit unit){
    if(gameMap.isSpriteInVicinity(unit, gameMap.player, 2)){
      gameMap.changeUnitType(unit, "bomb_charged");
    }
  }

  void spriteBombCharged(Unit unit){

    if(unit.value_1 < 12){
      unit.value_1 ++;
      return;
    }

    gameMap.removeSprite(unit);

    // Unit explosion1 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 0, offsetY: 0, width: 1, height: 1);
    // explosion1.value_2 = 0;
    // gameMap.addUnit(explosion1);
    Unit explosion2 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 1, offsetY: 0, width: 1, height: 1);
    explosion2.value_2 = 1;
    gameMap.addUnit(explosion2);
    Unit explosion3 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 2, offsetY: 0, width: 1, height: 1);
    explosion3.value_2 = 1;
    gameMap.addUnit(explosion3);
    // Unit explosion4 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 3, offsetY: 0, width: 1, height: 1);
    // explosion4.value_2 = 2;
    // gameMap.addUnit(explosion4);

    Unit explosion5 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 0, offsetY: 1, width: 1, height: 1);
    explosion5.value_2 = 7;
    gameMap.addUnit(explosion5);
    Unit explosion6 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 1, offsetY: 1, width: 1, height: 1);
    explosion6.value_2 = 0;
    gameMap.addUnit(explosion6);
    Unit explosion7 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 2, offsetY: 1, width: 1, height: 1);
    explosion7.value_2 = 2;
    gameMap.addUnit(explosion7);
    Unit explosion8 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 3, offsetY: 1, width: 1, height: 1);
    explosion8.value_2 = 3;
    gameMap.addUnit(explosion8);

    Unit explosion9 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 0, offsetY: 2, width: 1, height: 1);
    explosion9.value_2 = 7;
    gameMap.addUnit(explosion9);
    Unit explosion10 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 1, offsetY: 2, width: 1, height: 1);
    explosion10.value_2 = 6;
    gameMap.addUnit(explosion10);
    Unit explosion11 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 2, offsetY: 2, width: 1, height: 1);
    explosion11.value_2 = 4;
    gameMap.addUnit(explosion11);
    Unit explosion12 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 3, offsetY: 2, width: 1, height: 1);
    explosion12.value_2 = 3;
    gameMap.addUnit(explosion12);

    // Unit explosion13 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 0, offsetY: 3, width: 1, height: 1);
    // explosion13.value_2 = 6;
    // gameMap.addUnit(explosion13);
    Unit explosion14 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 1, offsetY: 3, width: 1, height: 1);
    explosion14.value_2 = 5;
    gameMap.addUnit(explosion14);
    Unit explosion15 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 2, offsetY: 3, width: 1, height: 1);
    explosion15.value_2 = 5;
    gameMap.addUnit(explosion15);
    // Unit explosion16 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 3, offsetY: 3, width: 1, height: 1);
    // explosion16.value_2 = 4;
    // gameMap.addUnit(explosion16);
  }

  void spriteMonsterLeft(Unit unit){

    String spriteBelow = gameMap.getPotentialCollision(unit, "DOWN");
    switch (spriteBelow) {
      case "player":
        gameOver = true;
        gameOverText = "You got eaten :(";
        break;
      case "":
        gameMap.moveUnitDown(unit);
        return;
      default:
    }

    String spriteLeft = gameMap.getPotentialCollision(unit, "LEFT");
    switch (spriteLeft) {
      case "player":
        gameOver = true;
        gameOverText = "You got eaten :(";
        break;
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
      case "player":
        gameOver = true;
        gameOverText = "You got eaten :(";
        break;
      case "":
        gameMap.moveUnitDown(unit);
        return;
      default:
    }

    String spriteLeft = gameMap.getPotentialCollision(unit, "RIGHT");
    switch (spriteLeft) {
      case "player":
        gameOver = true;
        gameOverText = "You got eaten :(";
        break;
      case "":
        gameMap.moveUnitRight(unit);
        break;
      default:
        unit.type = "monster_left";
    }
    
  }


  void spriteJumperUp(Unit unit){

    if(unit.value_1 == 0){
      unit.value_1 = 1;
    }

    if(unit.value_1 == unit.value_2){
      gameMap.changeUnitType(unit, "jumper_falling");
      unit.value_1 = 1;
      return;
    }

    // for(int i = 0; i < accelerationCalc(unit.value_1); i++){
      String spriteAbove = gameMap.getPotentialCollision(unit, "UP");
      switch (spriteAbove) {
        case "":
          gameMap.moveUnitUp(unit);
          break;
        default:
          gameMap.changeUnitType(unit, "jumper_falling");
          return;
      }
    // }
    unit.value_1 ++;
  }

  int accelerationCalc(int v){
    switch (v) {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
        return 2;
      default:
        return 1;
    }
  }

  void spriteJumperDown(Unit unit){
    if(unit.value_1 == 0){
      unit.value_1 = 1;
    }

    if(unit.value_1 < 1){
      unit.value_1 = 1;
    }

    for(int i = 0; i < accelerationCalc(unit.value_1); i++){
      String spriteAbove = gameMap.getPotentialCollision(unit, "DOWN");
      switch (spriteAbove) {
        case "player":
          gameOver = true;
          gameOverText = "You got smushed";
          return;
        case "":
          gameMap.moveUnitDown(unit);
          break;
        default:
          gameMap.changeUnitType(unit, "jumper_rising");
          unit.value_1 = 1;
          return;
      }
    }
    unit.value_1--;
  }

  void updateViewMap(){
    if(viewMapRight - (gameMap.player.x * 4 + gameMap.player.offsetX) < 5 * 4){
      viewMapRight = (gameMap.player.x * 4 + gameMap.player.offsetX) + 5 * 4;
      if(viewMapRight > (gameMap.map[0].length * 4)-1){
        viewMapRight = (gameMap.map[0].length * 4)-1;
      }
      viewMapLeft = viewMapRight - (viewMapWidth * 4);
    }

    if(gameMap.player.x * 4 + gameMap.player.offsetX - viewMapLeft < 5 * 4){
      viewMapLeft = gameMap.player.x * 4 + gameMap.player.offsetX - (5 * 4);
      if(viewMapLeft < 0){
        viewMapLeft = 0;
      }
      viewMapRight = viewMapLeft + (viewMapWidth * 4);

    }
  }

  void moveRight(){
    String spriteRight = gameMap.getPotentialCollision(gameMap.player, "RIGHT");
    switch (spriteRight) {
      case "":
        gameMap.moveUnitRight(gameMap.player);
        break;
      default:
    }
  }

  void moveLeft(){
    String spriteLeft = gameMap.getPotentialCollision(gameMap.player, "LEFT");
    switch (spriteLeft) {
      case "":
        gameMap.moveUnitLeft(gameMap.player);
        break;
      default:
    }
  }


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
          case "monster_left":
          case "monster_right":
            gameOver = true;
            gameOverText = "You got eaten :(";
            break;
          case "":
            gameMap.moveUnitUp(gameMap.player);
            break;
          default:
            i = spacesToJump;
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
        case "monster_left":
        case "monster_right":
          squashMonsters(gameMap.player);
          break;
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

  //this assumes that monsters are 4x4 
  void squashMonsters(Unit unit){
    for(int i = 0; i < 3; i++){
      for(int k = 0; k < gameMap.map[unit.y+1][unit.x-1+i].length; k++){
        Unit monster = gameMap.map[unit.y+1][unit.x-1+i][k];
        if((monster.type == "monster_left" || monster.type == "monster_right") && gameMap.isUnitOnUnit(unit, monster)){
          gameMap.changeUnitType(monster, "monster_dead");
        }
      }
    }
  }
}