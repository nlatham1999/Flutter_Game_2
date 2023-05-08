import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../models/basicmap.dart';
import '../models/map.dart';
import '../util/util.dart';

class GameController  extends ChangeNotifier{
  late GameMap gameMap;
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

  late List<List<String>> mapTemp = [];

  late double cellWidth;
  late double cellHeight;

  late double offsetX;
  double offsetY;
  Size screenSize;

  String gameOverText = "";

  int cellsPerView = 15;

  int distanceTraveled = 0;

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
      moveLeft();
      // if(!leftPressed){
        leftTrigger = false;
      // }
    }

    if(rightTrigger){
      moveRight();
      // if(!rightPressed){
        rightTrigger = false;
      // }
    }

    if(!jumpState && !isOnSolidGround()){
      fallDown();
    }

    if(jumpState){
      updateJump();
    }

    updateSprites();

    updateViewMap();

  }

  void updateSprites(){
    mapTemp = [];
    
    for(int i = 0; i < gameMap.map.length; i++){
      List<String> tempList = [];
      for(int j = 0; j < gameMap.map[i].length; j++){
        tempList.add(gameMap.map[i][j]);
      }
      mapTemp.add(tempList);
    }

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
        switch (getSpriteType(gameMap.map[i][j])) {
          case "j":
            spriteJumperUp(j, i);        
            break;
          case "J":
            spriteJumperDown(j, i);
            break;
          case "m":
            spriteMonsterLeft(j, i);
            break;
          case "M":
            spriteMonsterRight(j, i);
            break;
          case "b":
            spriteBombInert(j, i);
            break;
          case "B":
            spriteBombCharged(j, i);
            break;
          case "e":
            spriteExplosion(j, i);
            break;
          case "E":
            spriteExplosion2(j, i);
            break;
          case "i":
            spriteIcicleCheck(j, i);
            break;
          case "I":
            spriteIcicleFallDown(j, i);
            break;
          default:
        }
      }
    }

    for(int i = 0; i < gameMap.map.length; i++){
      for(int j = 0; j < gameMap.map[i].length; j++){
        gameMap.map[i][j] = mapTemp[i][j];
      }
    }
  }

  void spriteIcicleCheck(int x, int y){
    if(gameMap.playerX == x && gameMap.playerY >= y){
      mapTemp[y][x] = "I";
    }
  }

  void spriteIcicleFallDown(int x, int y){

    String spriteBelow = getSpriteType(gameMap.map[y+1][x]);

    if(isOnSolidGroundFromPos(x, y)){
      mapTemp[y][x] = "a";
      return;
    }

    switch (spriteBelow) {
      case "p":
        gameOver = true;
        gameOverText = "You got spiked";
        break;
      default:
        mapTemp[y][x] = "a";
        mapTemp[y+1][x] = "I";
    }
  }

  void spriteExplosion2(x, y){
    mapTemp[y][x] = "a";
  }

  void spriteExplosion(x, y){
    mapTemp[y][x] = "E";
  }

  void spriteBombInert(x, y){
    if((gameMap.playerX - x).abs() < 2 && (gameMap.playerY - y).abs() < 2){
      mapTemp[y][x] = "B1";
    }
  }

  void spriteBombCharged(x, y){

    num amount = getSpriteAmount(gameMap.map[y][x]);
    amount++;
    if(amount < 40){
      mapTemp[y][x] = "B" + amount.toString(); 
      return;
    }

    for(int i = x-1; i <= x+1; i++){
      for(int j = y-1; j <= y+1; j++){
        switch (getSpriteType(gameMap.map[j][i])) {
          case "a":
          case "B":
            mapTemp[j][i] = "e";
            break;
          case "p":
            gameOver = true;
            gameOverText = "You 'sploded";
            break;
          default:
        }
      }
    }
  }

  void spriteMonsterLeft(int x, int y){

    if(x == 0){
      mapTemp[y][x] = "M0";
      return;
    }
    
    //handle dropping off the face
    if(y == mapTemp.length - 1){
      mapTemp[y][x] = "a";
      return;
    }

    if(gameMap.map[y+1][x] == "a"){
      mapTemp[y][x] = "a";
      mapTemp[y+1][x] = "m0";
      return;
    }

    if(getSpriteType(gameMap.map[y+1][x]) == "p"){
      gameOver = true;
      gameOverText = "You got eaten";
      return;
    }
    
    String spriteAhead = getSpriteType(gameMap.map[y][x-1]);

    if(spriteAhead == "a"){
      num amount = getSpriteAmount(gameMap.map[y][x]);
      if(amount < 4){
        amount++;
        mapTemp[y][x] = "m" + amount.toString();
        return;
      }
    }

    switch (spriteAhead) {
      case "a":
        mapTemp[y][x] = "a";
        mapTemp[y][x-1] = "m0";
        break;
      case "p":
        gameOver = true;
        gameOverText = "You got eaten";
        break;
      default:
        mapTemp[y][x] = "M0";
    }
  }

  
  void spriteMonsterRight(int x, int y){
    if(x == mapTemp[0].length -1){
      mapTemp[y][x] = "m0";
      return;
    }

    //handle dropping off the face
    if(y == mapTemp.length - 1){
      mapTemp[y][x] = "a";
      return;
    }

    if(gameMap.map[y+1][x] == "a"){
      mapTemp[y][x] = "a";
      mapTemp[y+1][x] = "M0";
      return;
    }

    if(getSpriteType(gameMap.map[y+1][x]) == "p"){
      gameOver = true;
      gameOverText = "You got eaten";
      return;
    }

    String spriteAhead = getSpriteType(gameMap.map[y][x+1]);

    if(spriteAhead == "a"){
      num amount = getSpriteAmount(gameMap.map[y][x]);
      if(amount < 4){
        amount++;
        mapTemp[y][x] = "M" + amount.toString();
        return;
      }
    }

    switch (spriteAhead) {
      case "a":
        mapTemp[y][x] = "a";
        mapTemp[y][x+1] = "M0";
        break;
      case "p":
        gameOver = true;
        gameOverText = "You got eaten";
        break;
      default:
        mapTemp[y][x] = "m0";
    }
  }

  void spriteJumperUp(int x, int y){

    num amount = getSpriteAmount(gameMap.map[y][x]);
    if(amount < 4){
      amount++;
      mapTemp[y][x] = "j" + amount.toString();
      return;
    }

    //super jank to have it go two up
    switch (gameMap.map[y+1][x]) {
      case "g":
        mapTemp[y][x] = "a";
        mapTemp[y-1][x] = "j0";
        break;
      default:
        switch (gameMap.map[y+2][x]){
          case "g":
            mapTemp[y][x] = "a";
            mapTemp[y-1][x] = "j0";
            break;
          default:
            mapTemp[y][x] = "a";
            mapTemp[y-1][x] = "J0";
        }
    }
  }

  void spriteJumperDown(int x, int y){
    switch (getSpriteType(gameMap.map[y+1][x])) {
      case "p":
        gameOver = true;
        gameOverText = "You got smushed";
        break;
      default:
    }

    mapTemp[y][x] = "a";
    mapTemp[y+1][x] = "J0";
    switch (gameMap.map[y+2][x]) {
      case "g":
        mapTemp[y+1][x] = "j0";
        break;
      case "a":
        break;
      default:
    }
  }

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

  void moveRight(){
    if(gameMap.map[gameMap.playerY].length <= gameMap.playerX + 1){
      return;
    }

    switch (getSpriteType(gameMap.map[gameMap.playerY][gameMap.playerX+1])) {
      case "a":
        gameMap.map[gameMap.playerY][gameMap.playerX] = "a";
        gameMap.playerX++;
        gameMap.map[gameMap.playerY][gameMap.playerX] = "p";
        break;
      case "m":
      case "M":
        gameOver = true;
        gameOverText = "You got eaten";
        return;
      case "j":
      case "J":
        gameOver = true;
        gameOverText = "You got smushed";
        return;
      default:
        break;
    }
  }

  void moveLeft(){
    if(gameMap.playerX < 1){
      return;
    }

    switch (getSpriteType(gameMap.map[gameMap.playerY][gameMap.playerX-1])) {
      case "a":
        gameMap.map[gameMap.playerY][gameMap.playerX] = "a";
        gameMap.playerX--;
        gameMap.map[gameMap.playerY][gameMap.playerX] = "p";
        break;
      case "m":
      case "M":
        gameOver = true;
        gameOverText = "You got eaten";
        return;
      case "j":
      case "J":
        gameOver = true;
        gameOverText = "You got smushed";
        return;
      default:
        break;
    }
  }

  void jump(){

    if(!isOnSolidGround() && !isOnJumpableSprite()){
      return;
    }

    if(gameMap.playerY < 1){
      return;
    }

    if(jumpState){
      return;
    }

    switch (gameMap.map[gameMap.playerY-1][gameMap.playerX]) {
      case "a":
        jumpState = true;
        jumpCount = 0;
        gameMap.map[gameMap.playerY][gameMap.playerX] = "a";
        gameMap.playerY--;
        gameMap.map[gameMap.playerY][gameMap.playerX] = "p";
        break;
      default:
    }
  }

  void updateJump(){
    if(jumpCount < 3 && jumpCount > 0){
      if(gameMap.playerY < 1){
        jumpCount = 0;
        jumpState = false;
      }

      switch (getSpriteType(gameMap.map[gameMap.playerY-1][gameMap.playerX])) {
        case "a":
          gameMap.map[gameMap.playerY][gameMap.playerX] = "a";
          gameMap.playerY--;
          gameMap.map[gameMap.playerY][gameMap.playerX] = "p";
          break;
        case "m":
        case "M":
          gameOver = true;
          gameOverText = "You got eaten";
          return;
        case "j":
        case "J":
          gameOver = true;
          gameOverText = "You got smushed";
          return;
        case "i":
        case "I":
          gameOver = true;
          gameOverText = "You got spiked";
          break;
        default:
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

  bool isOnSolidGroundFromPos(int x, int y){
    switch (getSpriteType(gameMap.map[y+1][x])) {
      case "g":
      case "d":
      case "D":
        return true;
      default:
        return false;
    }
  }

  bool isOnSolidGround(){
    return isOnSolidGroundFromPos(gameMap.playerX, gameMap.playerY);
  } 

  bool isOnJumpableSprite(){
    switch (getSpriteType(gameMap.map[gameMap.playerY+1][gameMap.playerX])) {
      case "m":
      case "M":
      case "b":
      case "B":
      case "j":
      case "J":
        return true;
      default:
        return false;
    }
  }

  void fallDown(){
    if(gameMap.playerY == gameMap.map.length - 1){
      gameOver = true;
      gameOverText = "You fell off the map";
    }

    switch (getSpriteType(gameMap.map[gameMap.playerY+1][gameMap.playerX])) {
      case "a":
        gameMap.map[gameMap.playerY][gameMap.playerX] = "a";
        gameMap.playerY++;
        gameMap.map[gameMap.playerY][gameMap.playerX] = "p";
        break;
      case "m":
        gameMap.map[gameMap.playerY+1][gameMap.playerX] = "d";
        break;
      case "M":
        print("Falling down");
        gameMap.map[gameMap.playerY+1][gameMap.playerX] = "D";
        break;
      case "j":
      case "J":
        jumpTrigger = true;
        break;
      default:
    }

    //look for monsters that are on the "edge"
    if(gameMap.playerX+1 < gameMap.map[0].length-1){
      switch (getSpriteType(gameMap.map[gameMap.playerY+1][gameMap.playerX+1])){
        case "m":
          gameMap.map[gameMap.playerY+1][gameMap.playerX+1] = "d${getSpriteAmount(gameMap.map[gameMap.playerY+1][gameMap.playerX+1])}";
          break;
      }
    }
    if(gameMap.playerX-1 > 0){
      switch (getSpriteType(gameMap.map[gameMap.playerY+1][gameMap.playerX-1])){
        case "M":
          gameMap.map[gameMap.playerY+1][gameMap.playerX-1] = "D${getSpriteAmount(gameMap.map[gameMap.playerY+1][gameMap.playerX-1])}";
          break;
      }
    }
  }

  

  
}