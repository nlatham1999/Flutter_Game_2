import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/models/unit.dart';

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

  late bool leftPressed;
  late bool rightPressed;
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
    double cellSize = (minDimension/divisor) - ((minDimension/divisor) % 4);
    cellHeight = cellSize;
    cellWidth = cellSize;

    if(screenSize.height < screenSize.width){
      numCellsToDisplay = screenSize.width ~/ cellWidth;
      numCellsToDisplay -= 4;
      if(numCellsToDisplay > 100){
        numCellsToDisplay = 100;
      }
      if(numCellsToDisplay > level.mapTemplate[0].length - 1){
        numCellsToDisplay = level.mapTemplate[0].length - 1;
      }
      viewMapWidth = numCellsToDisplay;
    }
    
    offsetX = (screenSize.width - (cellSize * (viewMapWidth))) / 2;

    reset();
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

    leftPressed = false;
    rightPressed = false;


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

    
    if(!jumpState && !isOnSolidGround(gameMap.player)){
      fallDown();
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
          if(unit.type == 'grass'){
            continue;
          }
          if(unit.alreadyUpdated){
            continue;
          }else{
            unit.alreadyUpdated = true;
            unitsUpdated.add(unit);
          }
          switch (getSpriteType(unit)) {
            case "log":
              spriteVerticalLog(unit);
              break;
            case "log_horizontal":
              spriteHorizontalLog(unit);
              break;
            case "monster_left":
              spriteMonsterLeft(unit);
              break;
            case "monster_right":
              spriteMonsterRight(unit);
              break;
            case "monster_dead":
              monsterDead(unit);
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
            case "spiked_monster_left":
              spriteSpikedMonsterLeft(unit);
              break;
            case "spiked_monster_right":
              spriteSpikedMonsterRight(unit);
              break;
            case "fire_monster_left":
              spriteFireMonsterLeft(unit);
              break;
            case "fire_monster_right":
              spriteFireMonsterRight(unit);
              break;
            case "fireball":
              spriteFireball(unit);
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

  void spriteHorizontalLog(Unit unit){
    // unit.value_4 = (unit.value_4 + 1) % 2;
    // if(unit.value_4 == 1){
    //   return;
    // }

    unit.value_2++;
    if(unit.value_2 > unit.value_3){
      if(unit.value_1 == 0){
        unit.value_1 = 1;
      }else{
        unit.value_1 = 0;
      }
      unit.value_2 = 0;
    }

    if(unit.value_1 == 0){
      Unit spriteLeft = gameMap.getPotentialCollision(unit, "LEFT");
      switch (spriteLeft.type) {
        case "air":
          gameMap.moveUnitLeft(unit);
          List<Unit> spritesAbove = gameMap.getUnitsAbove(unit, onlyOnUnit: true);
          for(Unit spriteAbove in spritesAbove){
            gameMap.moveUnitLeft(spriteAbove);
          }
          break;
        default:
          unit.value_1 = 1;
          unit.value_2 = 0;
      }
    }else{
      Unit spriteRight = gameMap.getPotentialCollision(unit, "RIGHT");
      switch (spriteRight.type) {
        case "air":
          gameMap.moveUnitRight(unit);
          List<Unit> spritesAbove = gameMap.getUnitsAbove(unit, onlyOnUnit: true);
          for(Unit spriteAbove in spritesAbove){
            gameMap.moveUnitRight(spriteAbove);
          }
          break;
        default:
          unit.value_1 = 0;
          unit.value_2 = 0;
      }
    }

  }

  void spriteFireball(Unit unit){
    unit.value_1++;
    if(unit.value_1 == 40){
      gameMap.removeSprite(unit);
      return;
    }
    if(unit.value_2 == 1){
      Unit spriteLeft = gameMap.getPotentialCollision(unit, "LEFT");
      switch (spriteLeft.type) {
        case "fire_monster_left":
        case "air":
          gameMap.moveUnitLeft(unit);
          break;
        case "player":
          gameOver = true;
          gameOverText = "You got hit with a fireball :(";
          break;
        default:
          gameMap.removeSprite(unit);
          return;
      }
    }else{
      Unit spriteRight = gameMap.getPotentialCollision(unit, "RIGHT");
      switch (spriteRight.type) {
        case "fire_monster_right":
        case "air":
          gameMap.moveUnitRight(unit);
          break;
        case "player":
          gameOver = true;
          gameOverText = "You got hit with a fireball :(";
          break;
        default:
          gameMap.removeSprite(unit);
          return;
      }
    }
    // if((unit.value_1 > 20 && unit.value_1 <= 30 && unit.value_1 % 2 == 0 ) || (unit.value_1 > 30) ){
    //   Unit spriteBelow = gameMap.getPotentialCollision(unit, "DOWN");
    //   switch (spriteBelow.type) {
    //     case "air":
    //       gameMap.moveUnitDown(unit);
    //       break;
    //     case "player":
    //       gameOver = true;
    //       gameOverText = "You got hit with a fireball :(";
    //       break;
    //     default:
    //       gameMap.removeSprite(unit);
    //       return;
    //   }
    // }
  }

  void spriteFireMonsterLeft(Unit unit){
    if(gameMap.isUnitSomewherAboveUnit(unit, gameMap.player) && gameMap.isSpriteInVicinity(unit, gameMap.player, 5)){
      unit.value_2 = 1;
    }else{
      unit.value_2 = 0;
    }

    if(!gameMap.isUnitSomewherBeforeUnit(unit, gameMap.player)){
      unit.value_1 = 0;
      gameMap.changeUnitType(unit, "fire_monster_right");
    }

    unit.value_1 = (unit.value_1 + 1) % 30;
    if(unit.value_1 == 29){
      Unit fireball = Unit(type: "fireball", x: unit.x, y: unit.y, offsetX: 1, offsetY: 3, width: 2, height: 2);
      fireball.value_2 = 1;
      gameMap.addUnit(fireball);
    }
  }

  void spriteFireMonsterRight(Unit unit){
    if(gameMap.isUnitSomewherAboveUnit(unit, gameMap.player) && gameMap.isSpriteInVicinity(unit, gameMap.player, 5)){
      unit.value_2 = 1;
    }else{
      unit.value_2 = 0;
    }
    
    if(gameMap.isUnitSomewherBeforeUnit(unit, gameMap.player)){
      unit.value_1 = 0;
      gameMap.changeUnitType(unit, "fire_monster_left");
    }

    unit.value_1 = (unit.value_1 + 1) % 30;
    if(unit.value_1 == 29){
      Unit fireball = Unit(type: "fireball", x: unit.x + 1, y: unit.y, offsetX: 0, offsetY: 3, width: 2, height: 2);
      fireball.value_2 = 2;
      gameMap.addUnit(fireball);
    }
  }

  void spriteVerticalLog(Unit unit){

    if(unit.value_2 >= 15){
      if(unit.value_1 == 0){
        unit.value_1 = 1;
      }else{
        unit.value_1 = 0;
      }
      unit.value_2 = 0;
    }

    if(unit.value_1 == 0){

      List<Unit> spritesAbove = gameMap.getUnitsAbove(unit);
      
      if(spritesAbove.length == 1 && spritesAbove[0].type == "-1"){
        unit.value_1 = 1;
        return;
      }

      for(int i = 0; i < spritesAbove.length; i++){
        Unit spriteAbove = gameMap.getPotentialCollision(spritesAbove[i], "UP");
        if(spriteAbove.type != "air"){
          return;
        }
      }

      for(int i = 0; i < spritesAbove.length; i++){
        gameMap.moveUnitUp(spritesAbove[i]);
      }

      gameMap.moveUnitUp(unit);

    }else{
      Unit spriteBelow = gameMap.getPotentialCollision(unit, "DOWN");
      switch (spriteBelow.type) {
        case "air":
          // List<Unit> spritesAbove = gameMap.getUnitsAbove(unit);
      
          // if(spritesAbove.length == 1 && spritesAbove[0].type == "-1"){
          //   unit.value_2 = 1;
          //   return;
          // }

          // for(int i = 0; i < spritesAbove.length; i++){
          //   gameMap.moveUnitDown(spritesAbove[i]);
          // }

          gameMap.moveUnitDown(unit);
          break;
        default:
          return;
      }
    }
    unit.value_2++;
  }

  void monsterDead(Unit unit){
    unit.value_1++;
    if(unit.value_1 > 10){
      gameMap.removeSprite(unit);
    }
  }

  void spriteIcicleCheck(Unit unit){
    if(gameMap.isUnitBelowUnit(unit, gameMap.player)){
      gameMap.changeUnitType(unit, "icicle_falling");
    }
  }

  void spriteIcicleFallDown(Unit unit){

    Unit spriteBelow = gameMap.getPotentialCollision(unit, "DOWN");

    switch (spriteBelow.type) {
      case "air":
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

    for(int i = 0; i < 2; i++){

      if(unit.value_1 > 8){
        gameMap.removeSprite(unit);
        return;
      }

      Unit s = gameMap.airUnit;
      switch (unit.value_2) {
        case 0:
          s = gameMap.getPotentialCollision(unit, "LEFT_UP");
          if(s.type == "air"){
            gameMap.moveUnitLeft(unit);
            gameMap.moveUnitUp(unit);
          }
          break;
        case 1:
          s = gameMap.getPotentialCollision(unit, "UP");
          if(s.type == "air"){
            gameMap.moveUnitUp(unit);
          }
          break;
        case 2:
          s = gameMap.getPotentialCollision(unit, "RIGHT_UP");
          if(s.type == "air"){
            gameMap.moveUnitRight(unit);
            gameMap.moveUnitUp(unit);
          }
          break;
        case 3:
          s = gameMap.getPotentialCollision(unit, "RIGHT");
          if(s.type == "air"){
            gameMap.moveUnitRight(unit);
          }
          break;
        case 4:
          s = gameMap.getPotentialCollision(unit, "RIGHT_DOWN");
          if(s.type == "air"){
            gameMap.moveUnitRight(unit);
            gameMap.moveUnitDown(unit);
          }
          break;
        case 5:
          s = gameMap.getPotentialCollision(unit, "DOWN");
          if(s.type == "air"){
            gameMap.moveUnitDown(unit);
          }
          break;
        case 6:
          s = gameMap.getPotentialCollision(unit, "LEFT_DOWN");
          if(s.type == "air"){
            gameMap.moveUnitLeft(unit);
            gameMap.moveUnitDown(unit);
          }
          break;
        case 7:
          s = gameMap.getPotentialCollision(unit, "LEFT");
          if(s.type == "air"){
            gameMap.moveUnitLeft(unit);
          }
          break;
        default:
      }

      if(s.type == "player"){
        gameOver = true;
        gameOverText = "You got bombed :(";
        return;
      }
      if(s.type != "air"){
        gameMap.removeSprite(unit);
      }

      unit.value_1++;
    }

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
    Unit spriteBelow = gameMap.getPotentialCollision(unit, "DOWN", playerPriority: "low");
    switch (spriteBelow.type) {
      case "player":
        gameOver = true;
        gameOverText = "You got eaten :(";
        break;
      case "-1":
        gameMap.removeSprite(unit);
        return;
      case "air":
        gameMap.moveUnitDown(unit);
        return;
      default:
    }

    Unit spriteLeft = gameMap.getPotentialCollision(unit, "LEFT", playerPriority: "low");
    switch (spriteLeft.type) {
      case "player":
        gameOver = true;
        gameOverText = "You got eaten :(";
        break;
      case "air":
        gameMap.moveUnitLeft(unit);
        break;
      default:
        unit.type = "monster_right";
    }
    
  }

  void spriteMonsterRight(Unit unit){
    Unit spriteBelow = gameMap.getPotentialCollision(unit, "DOWN", playerPriority: "low");
    switch (spriteBelow.type) {
      case "player":
        gameOver = true;
        gameOverText = "You got eaten :(";
        break;
      case "-1":
        gameMap.removeSprite(unit);
        return;
      case "air":
        gameMap.moveUnitDown(unit);
        return;
      default:
    }
    

    Unit spriteLeft = gameMap.getPotentialCollision(unit, "RIGHT", playerPriority: "low");
    switch (spriteLeft.type) {
      case "player":
        gameOver = true;
        gameOverText = "You got eaten :(";
        break;
      case "air":
        gameMap.moveUnitRight(unit);
        break;
      default:
        unit.type = "monster_left";
    }
    
  }

  void spriteSpikedMonsterLeft(Unit unit){

    Unit spriteBelow = gameMap.getPotentialCollision(unit, "DOWN", playerPriority: "low");
    switch (spriteBelow.type) {
      case "player":
        gameOver = true;
        gameOverText = "You got eaten :(";
        break;
      case "-1":
        gameMap.removeSprite(unit);
        return;
      case "air":
        gameMap.moveUnitDown(unit);
        return;
      default:
    }

    unit.value_1 ++;
    if(unit.value_1.isOdd){
      return;
    }

    Unit spriteLeft = gameMap.getPotentialCollision(unit, "LEFT", playerPriority: "low");
    switch (spriteLeft.type) {
      case "player":
        gameOver = true;
        gameOverText = "You got eaten :(";
        break;
      case "air":
        gameMap.moveUnitLeft(unit);
        break;
      default:
        unit.type = "spiked_monster_right";
    }
    
  }

  void spriteSpikedMonsterRight(Unit unit){
    Unit spriteBelow = gameMap.getPotentialCollision(unit, "DOWN", playerPriority: "low");
    switch (spriteBelow.type) {
      case "player":
        gameOver = true;
        gameOverText = "You got eaten :(";
        break;
      case "-1":
        gameMap.removeSprite(unit);
        return;
      case "air":
        gameMap.moveUnitDown(unit);
        return;
      default:
    }

    
    unit.value_1 ++;
    if(unit.value_1.isOdd){
      return;
    }

    Unit spriteLeft = gameMap.getPotentialCollision(unit, "RIGHT", playerPriority: "low");
    switch (spriteLeft.type) {
      case "player":
        gameOver = true;
        gameOverText = "You got eaten :(";
        break;
      case "air":
        gameMap.moveUnitRight(unit);
        break;
      default:
        unit.type = "spiked_monster_left";
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
      Unit spriteAbove = gameMap.getPotentialCollision(unit, "UP");
      switch (spriteAbove.type) {
        case "air":
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
      Unit spriteAbove = gameMap.getPotentialCollision(unit, "DOWN");
      switch (spriteAbove.type) {
        case "player":
          gameOver = true;
          gameOverText = "You got smushed";
          return;
        case "air":
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
    for(int i = 0; i < movingSpeed; i++) {
    Unit spriteRight = gameMap.getPotentialCollision(gameMap.player, "RIGHT");
    switch (spriteRight.type) {
      case "air":
        gameMap.moveUnitRight(gameMap.player);
        break;
      case "spiked_monster_left":
      case "spiked_monster_right":
        gameOver = true;
        gameOverText = "You ran into a monster :(";
        return;
      default:
    }
    }
  }

  void moveLeft(){
    for(int i = 0; i < movingSpeed; i++){
      Unit spriteLeft = gameMap.getPotentialCollision(gameMap.player, "LEFT");
      switch (spriteLeft.type) {
        case "air":
          gameMap.moveUnitLeft(gameMap.player);
          break;
        case "spiked_monster_left":
        case "spiked_monster_right":
          gameOver = true;
          gameOverText = "You ran into a monster :(";
          return;
        default:
      }
    }
  }


  bool isOnSolidGround(Unit unit){
    Unit spriteBelow = gameMap.getPotentialCollision(unit, "DOWN");
    switch (spriteBelow.type) {
      case "grass":
      case "monster_dead":
      case "brick":
      case "log":
      case "log_horizontal":
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
        Unit spriteAbove = gameMap.getPotentialCollision(gameMap.player, "UP");
        switch (spriteAbove.type) {
          case "monster_left":
          case "monster_right":
            gameOver = true;
            gameOverText = "You got eaten :(";
            break;
          case "fireball":
            gameOver = true;
            gameOverText = "You hit a fireball :(";
            return;
          case "air":
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
    if(gameMap.player.fall == 0){
      gameMap.player.fall = 1;
    }
    for(int i = 0; i < gameMap.player.fall; i++){
      Unit spriteBelow = gameMap.getPotentialCollision(gameMap.player, "DOWN");
      switch (spriteBelow.type) {
        case "spiked_monster_left":
        case "spiked_monster_right":
          gameOver = true;
          gameOverText = "You fell onto a monster :(";
          return;
        case "monster_left":
        case "monster_right":
          squashMonsters(gameMap.player);
          break;
        case "fireball":
          gameOver = true;
          gameOverText = "You fell onto a fireball :(";
          return;
        case "air":
          gameMap.moveUnitDown(gameMap.player);
          break;
        case "-1":
          gameOver = true;
          gameOverText = "You fell off the edge of the map :(";
          return;
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
      int x = unit.x-1+i;
      int y = unit.y+1;
      if(x < 0 || x > gameMap.map[0].length - 1 || y > gameMap.map.length){
        continue;
      }
      for(int k = 0; k < gameMap.map[y][x].length; k++){
        Unit monster = gameMap.map[unit.y+1][unit.x-1+i][k];
        if((monster.type == "monster_left" || monster.type == "monster_right") && gameMap.isUnitOnUnit(unit, monster)){
          gameMap.changeUnitType(monster, "monster_dead");
          monster.height = 3;
          gameMap.moveUnitDown(monster);
        }
      }
    }
  }
}