
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/models/unit.dart';
import 'package:my_app/models/units/fireballplayer.dart';

import '../models/basicmap.dart';
import '../models/level.dart';
import '../util/util.dart';

class GameController  extends ChangeNotifier{
  late BasicMap gameMap;
  late bool jumpState;
  late int jumpCount;

  late bool jumpTrigger;
  late bool leftTrigger;
  late bool rightTrigger;
  late bool fireTrigger;

  late bool leftPressed;
  late bool rightPressed;
  late bool jumpPressed;
  int movingSpeed = 1;
  int numCellsToDisplay = 13;

  late int viewMapLeft;
  late int viewMapRight;
  late int viewMapWidth;

  late bool gameOver;
  bool gameStarted = false;

  late List<List<Unit>> mapTemp = [];

  late double cellWidth;
  late double cellHeight;

  late double offsetX;
  double offsetY;
  Size screenSize;

  String gameOverText = "";

  int cellsPerView = 15;

  late int distanceTraveled;

  Level level;
  
  List<Unit> unitsUpdated = [];

  Map<Unit, String> changeToTypeQueue = {};

  GameController({
    required this.offsetY,
    required this.screenSize,
    required this.level,
  }){

    viewMapWidth = 13;

    int divisor = viewMapWidth;
    if(screenSize.height < screenSize.width){
      divisor = 18;
    }

    double minDimension = screenSize.shortestSide;

    //additional check to make sure there is room for buttons in potrait mode
    //there are cases where it is in potrait mode but the height is barely bigger than the width
    //so instead of comparing height and width, we compare width and height*(2/3)
    //so at the bare minimum there will be a third of the space left at the bottom for buttons
    if (screenSize.height > screenSize.width) {
      if (screenSize.height * 2 / 3 < screenSize.width){
        minDimension = screenSize.height * 2 / 3;
      }
    }


    double cellSize = (minDimension/divisor) - ((minDimension/divisor) % kCellSize);
    cellHeight = cellSize;
    cellWidth = cellSize;

    //code to fit the entire screen for landscape mode
    //not using this because we want the buttons on the side
    // if(screenSize.height < screenSize.width){
    //   numCellsToDisplay = screenSize.width ~/ cellWidth;
    //   numCellsToDisplay -= 4;
    //   if(numCellsToDisplay > 100){
    //     numCellsToDisplay = 100;
    //   }
    //   if(numCellsToDisplay > level.mapTemplate[0].length - 1){
    //     numCellsToDisplay = level.mapTemplate[0].length - 1;
    //   }
    //   viewMapWidth = numCellsToDisplay;
    // }
    
    offsetX = (screenSize.width - (cellSize * (viewMapWidth))) / 2;

    reset();

    updateViewMap();
  }

  void reset(){

    gameStarted = false;
    distanceTraveled = 0;
    gameMap = BasicMap(mapTemplate: level.mapTemplate);
    jumpState = false;
    jumpCount = 0;

    jumpTrigger = false;
    leftTrigger = false;
    rightTrigger = false;
    fireTrigger = false;

    leftPressed = false;
    rightPressed = false;
    jumpPressed = false;


    viewMapLeft = 0;
    viewMapRight = (numCellsToDisplay - 2) * 4;

    gameOver = false;
  }

  void setNextState(){

    if(!gameStarted){
      return;
    }

    if(gameMap.map[0].length - 1 == distanceTraveled){
      gameOver = true;
      gameOverText  = "YOU WON!!!";
      level.finished = true;
      return;
    }

    if(gameMap.player.x > distanceTraveled){
      distanceTraveled = gameMap.player.x;
    }

    updateSprites();
    if(gameOver){
      return;
    }
    

    //fall down is before jump so we can jump on descending logs
    if(!jumpState && !isOnSolidGround(gameMap.player, groundPriority: "solid")){
      fallDown();
    }


    //if the jump button is still being pressed and we are ok for a jump then jump
    if (jumpPressed) {
      if (!jumpState && isOnSolidGround(gameMap.player)){
        jumpTrigger = true;
      }
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
      gameMap.player.direction = 1;
    }

    if(rightTrigger){
      moveRight();
      if(!rightPressed){
        rightTrigger = false;
      }
      gameMap.player.direction = 0;
    }

    if(jumpState){
      updateJump();
    }

    if(fireTrigger){
      fireFireball();
      fireTrigger = false;
    }

    goThroughChangeQueue();

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

    unitsUpdated = [];

    int startLeft = gameMap.player.x - numCellsToDisplay;
    if(startLeft < 0){
      startLeft = 0;
    }
    int startRight = gameMap.player.x + numCellsToDisplay;
    if(startRight > gameMap.map[0].length - 1){
      startRight = gameMap.map[0].length - 1;
    }

    for(int i = 0; i < gameMap.map.length; i++){
      for(int j = startLeft; j <= startRight; j++){
        for(int k = 0; k < gameMap.map[i][j].length; k++){
          Unit unit = gameMap.map[i][j][k];

          if(!unit.needsActionRan){
            continue;
          }
          if(unit.alreadyUpdated){
            continue;
          }else{
            unit.alreadyUpdated = true;
            unitsUpdated.add(unit);
          }

          unit.doAction(this);

          goThroughChangeQueue();          
        }
      }
    }

    for(Unit unit in unitsUpdated){
      unit.alreadyUpdated = false;
    }
  }

  void goThroughChangeQueue(){
    if(changeToTypeQueue.isNotEmpty){
      for (MapEntry<Unit, String> entry in changeToTypeQueue.entries){
        Unit newUnit = gameMap.changeUnitType(entry.key, entry.value);
        if(entry.key.alreadyUpdated){
          newUnit.alreadyUpdated = true;
          unitsUpdated.add(newUnit);
        }

        gameMap.removeSprite(entry.key);
        gameMap.addUnit(newUnit);
      }
      changeToTypeQueue = {};
    }
  }

  void queueUnitTypeChange(Unit unit, String newType){
    changeToTypeQueue[unit] = newType;
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

  void updateViewMap(){

    if(viewMapRight - (gameMap.player.x * kCellSize + gameMap.player.offsetX) < 5 * kCellSize){
      viewMapRight = (gameMap.player.x * kCellSize + gameMap.player.offsetX) + 5 * kCellSize;
      if(viewMapRight > (gameMap.map[0].length * kCellSize)-1){
        viewMapRight = (gameMap.map[0].length * kCellSize)-1;
      }
      viewMapLeft = viewMapRight - (viewMapWidth * kCellSize);
    }

    if(gameMap.player.x * kCellSize + gameMap.player.offsetX - viewMapLeft < 5 * kCellSize){
      viewMapLeft = gameMap.player.x * kCellSize + gameMap.player.offsetX - (5 * kCellSize);
      if(viewMapLeft < 0){
        viewMapLeft = 0;
      }
      viewMapRight = viewMapLeft + (viewMapWidth * kCellSize);
    }
  }

  void moveRight(){
    for(int i = 0; i < movingSpeed * (kCellSize / 4); i++) {
    Unit spriteRight = gameMap.getPotentialCollision(gameMap.player, "RIGHT");
    switch (spriteRight.type) {
      case "air":
        gameMap.moveUnitRight(gameMap.player);
        break;
      default:
        if (spriteRight.playerHittingFromSideAction(this)){
          return;
        }
    }
    }
  }

  void moveLeft(){
    for(int i = 0; i < movingSpeed * (kCellSize / 4); i++){
      Unit spriteLeft = gameMap.getPotentialCollision(gameMap.player, "LEFT");
      switch (spriteLeft.type) {
        case "air":
          gameMap.moveUnitLeft(gameMap.player);
          break;
        default:
          if (spriteLeft.playerHittingFromSideAction(this)){
            return;
          }
      }
    }
  }

  bool isPlayerInFireState(){
    return gameMap.player.value_1 > 0;
  }

  void fireFireball(){
    if(gameMap.player.value_1 > 0){
      gameMap.player.value_1 -= 1;
    }else{
      return;
    }

    //find the proper x
    int x = 0;
    if(gameMap.player.direction == 0){
      x = gameMap.player.x * kCellSize + gameMap.player.offsetX;
      x += kCellSize;
    } else {
      x = gameMap.player.x * kCellSize + gameMap.player.offsetX - 1;
    }


    Unit fireball = FireballPlayer(type: "player_fireball", x: x ~/ kCellSize, y: gameMap.player.y, offsetX: x % kCellSize, offsetY: kCellSize ~/ 2, width: 2, height: 2);
    fireball.value_1 = gameMap.player.direction;
    fireball.value_2 = 10;
    gameMap.addUnit(fireball);
  }


  bool isOnSolidGround(Unit unit, {String groundPriority = "neutral"}){
    Unit spriteBelow = gameMap.getPotentialCollision(unit, "DOWN", groundPriority: groundPriority);
    return spriteBelow.isSolidGround;
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
        spacesToJump = 2;
      }
      if(jumpCount == 3){
        spacesToJump = 2;
      }
      if(jumpCount == 4){
        spacesToJump = 2;
      }

      for(int i = 0; i < spacesToJump * (kCellSize / 4); i++){
        Unit spriteAbove = gameMap.getPotentialCollision(gameMap.player, "UP");
        switch (spriteAbove.type) {
          case "air":
            spriteAbove.playerHittingFromBelowAction(this);
            break;
          default:
            if (spriteAbove.playerHittingFromBelowAction(this)){
              return;
            }
            i = 100;
            jumpCount = 5;
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
    if(gameMap.player.fall == 0){
      gameMap.player.fall = 1;
    }
    for(int i = 0; i < 2 * (kCellSize / 4); i++){
      Unit spriteBelow = gameMap.getPotentialCollision(gameMap.player, "DOWN");
      bool exitEarly = spriteBelow.playerHittingFromAboveAction(this);
      if(exitEarly){
        return;
      }
    }
    if(gameMap.player.fall < 5){
      gameMap.player.fall++;
    }
  }  

  //this assumes that monsters are 4x4 
  void squashMonsters(Unit unit, Unit unitToSquash){
    queueUnitTypeChange(unitToSquash, "monster_dead");
    unitToSquash.value_1 = 0;
  }
}