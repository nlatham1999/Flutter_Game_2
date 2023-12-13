//This controls the basic structure of the game
//it initializes the map and sets the left/right windows
//calls the updates for each unit type
//detailed movements within the game that deal with collisions are done through the basic map api


import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:monster_maze/constants.dart';
import 'package:monster_maze/models/unit.dart';
import 'package:monster_maze/models/units/fireballplayer.dart';

import '../models/basicmap.dart';
import '../models/level.dart';
import '../util/util.dart';

class GameController  extends ChangeNotifier{
  late BasicMap gameMap;

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

  int playerStartX = -1;
  int playerStartY = -1;

  String gameOverText = "";

  late int distanceTraveled;

  Level level;
  
  List<Unit> unitsUpdated = [];

  List<Unit> unitsToProcessLater = [];

  Map<Unit, String> changeToTypeQueue = {};

  Set<String> keyPressed = {};

  GameController({
    required this.offsetY,
    required this.screenSize,
    required this.level,
  }){

    viewMapWidth = kNumCellsWidth;
    int viewMapHeight = 16;

    int divisor = viewMapWidth;
    if(screenSize.height < screenSize.width){
      divisor = 18;
    }

    double minDimension = screenSize.shortestSide;

    //additional check to make sure there is room for buttons in potrait mode
    //there are cases where it is in potrait mode but the height is barely bigger than the width
    //so instead of comparing height and width, we compare width and height*(2/3)
    //so at the bare minimum there will be a third of the space left at the bottom for buttons
    // if (screenSize.height > screenSize.width) {
    //   if (screenSize.height * 2 / 3 < screenSize.width){
    //     minDimension = screenSize.height * 2 / 3;
    //   }
    // }

    double size = (minDimension/divisor);
    double remainder = size % kCellSize;
    double roundDown = size - remainder;

    //make sure the height doesn't push everything down if we are in potrait mode
    //calculate the max size of each s
    if(screenSize.width < screenSize.height){
      double twoThirds = screenSize.height;
      double sizeY = twoThirds / viewMapHeight;
      double remainderY = sizeY % kCellSize;
      double roundDownY = sizeY - remainderY;
      if(roundDownY < roundDown){
        roundDown = roundDownY;
      }
    }

    //see if changing the 

    double cellSize = roundDown;
    // }
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

    // updateViewMap();
  }

  void reset(){

    gameStarted = false;
    distanceTraveled = 0;
    gameMap = BasicMap(mapTemplate: level.mapTemplate, startX: playerStartX, startY: playerStartY);



    viewMapLeft = 0;
    viewMapRight = (viewMapWidth - 2) * 4;

    gameOver = false;

    keyPressed = {};

    updateViewMap();
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

    // goThroughChangeQueue();

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
    unitsToProcessLater = [];

    int startLeft = gameMap.player.x - viewMapWidth;
    if(startLeft < 0){
      startLeft = 0;
    }
    int startRight = gameMap.player.x + viewMapWidth;
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

          if(unit.processingIndex == -1){
            unit.doAction(this);
            goThroughChangeQueue();     
          }else{
            unitsToProcessLater.add(unit);
          }

          if(gameOver){
            return;
          }
        }
      }
    }

    for(Unit unit in unitsToProcessLater){
      unit.doAction(this);
      goThroughChangeQueue();   
      if(gameOver){
        return;
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
        newUnit.value_2 = entry.key.value_2;
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
      viewMapLeft =  max(viewMapRight - (viewMapWidth * kCellSize), 0);
    }

    if(gameMap.player.x * kCellSize + gameMap.player.offsetX - viewMapLeft < 5 * kCellSize){
      viewMapLeft = gameMap.player.x * kCellSize + gameMap.player.offsetX - (5 * kCellSize);
      if(viewMapLeft < 0){
        viewMapLeft = 0;
      }
      viewMapRight = viewMapLeft + (viewMapWidth * kCellSize);
    }
  }





  bool isOnSolidGround(Unit unit, {String groundPriority = "neutral"}){
    Unit spriteBelow = gameMap.getPotentialCollision(unit, "DOWN", groundPriority: groundPriority);
    return spriteBelow.isSolidGround;
  }

  bool isOnJumpableOrOnSolidGround(Unit unit, {String groundPriority = "neutral"}){
    Unit spriteBelow = gameMap.getPotentialCollision(unit, "DOWN", groundPriority: groundPriority);
    return spriteBelow.isSolidGround || spriteBelow.isJumpable;
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
}