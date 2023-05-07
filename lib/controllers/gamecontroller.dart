import 'dart:convert';

import 'package:flutter/foundation.dart';

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

  late int viewMapLeft;
  late int viewMapRight;
  late int viewMapWidth;

  late bool gameOver;

  late List<List<String>> mapTemp = [];

  double cellWidth;
  double cellHeight;

  double offsetX;
  double offsetY;

  GameController({
    required this.cellHeight,
    required this.cellWidth,
    required this.offsetX,
    required this.offsetY,
  }){
    cellHeight = cellHeight;
    cellWidth = cellWidth;
    reset();
  }

  void reset(){
    gameMap = BasicMap();
    jumpState = false;
    jumpCount = 0;

    jumpTrigger = false;
    leftTrigger = false;
    rightTrigger = false;

    viewMapLeft = 0;
    viewMapRight = 15;
    viewMapWidth = 15;

    gameOver = false;
  }

  void setNextState(){

    if(jumpTrigger){
      jump();
      jumpTrigger = false;
    }

    if(leftTrigger){
      moveLeft();
      leftTrigger = false;
    }

    if(rightTrigger){
      moveRight();
      rightTrigger = false;
    }

    if(!jumpState && !isOnSolidGround()){
      fallDown();
    }

    if(jumpState){
      updateJump();
    }

    updateSprites();

    updateViewMap();
    
    notifyListeners();

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

    for(int i = 0; i < gameMap.map.length; i++){
      for(int j = 0; j < gameMap.map[i].length; j++){
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

  void spriteExplosion(x, y){
    mapTemp[y][x] = "a";
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
            break;
          default:
        }
      }
    }
  }

  void spriteMonsterLeft(int x, int y){

    if(x == 0){
      mapTemp[y][x] = "M";
      return;
    }
    
    //handle dropping off the face
    if(y == mapTemp.length - 1){
      mapTemp[y][x] = "a";
      return;
    }

    if(gameMap.map[y+1][x] == "a"){
      mapTemp[y][x] = "a";
      mapTemp[y+1][x] = "m";
      return;
    }

    if(getSpriteType(gameMap.map[y+1][x]) == "p"){
      gameOver = true;
      return;
    }

    switch (getSpriteType(gameMap.map[y][x-1])) {
      case "a":
        mapTemp[y][x] = "a";
        mapTemp[y][x-1] = "m";
        break;
      case "p":
        gameOver = true;
        break;
      default:
        mapTemp[y][x] = "M";
    }
  }

  
  void spriteMonsterRight(int x, int y){
    if(x == mapTemp[0].length -1){
      mapTemp[y][x] = "m";
      return;
    }

    //handle dropping off the face
    if(y == mapTemp.length - 1){
      mapTemp[y][x] = "a";
      return;
    }

    if(gameMap.map[y+1][x] == "a"){
      mapTemp[y][x] = "a";
      mapTemp[y+1][x] = "M";
      return;
    }

    if(getSpriteType(gameMap.map[y+1][x]) == "p"){
      gameOver = true;
      return;
    }

    switch (getSpriteType(gameMap.map[y][x+1])) {
      case "a":
        mapTemp[y][x] = "a";
        mapTemp[y][x+1] = "M";
        break;
      case "p":
        gameOver = true;
        break;
      default:
        mapTemp[y][x] = "m";
    }
  }

  void spriteJumperUp(int x, int y){
    switch (getSpriteType(gameMap.map[y+1][x])) {
      case "p":
        gameOver = true;
        return;
      default:
    }

    switch (gameMap.map[y+1][x]) {
      case "g":
        mapTemp[y][x] = "a";
        mapTemp[y-1][x] = "j";
        break;
      case "a":
        mapTemp[y][x] = "a";
        mapTemp[y-1][x] = "J";
        break;
      default:
    }
  }

  void spriteJumperDown(int x, int y){
    switch (getSpriteType(gameMap.map[y+1][x])) {
      case "p":
        gameOver = true;
        break;
      default:
    }

    mapTemp[y][x] = "a";
    mapTemp[y+1][x] = "J";
    switch (gameMap.map[y+2][x]) {
      case "g":
        mapTemp[y+1][x] = "j";
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
      case "j":
      case "J":
        gameOver = true;
        return;
      default:
        break;
    }
    
    notifyListeners();
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
      case "j":
      case "J":
        gameOver = true;
        return;
      default:
        break;
    }
    
    notifyListeners();
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
     
    notifyListeners();
  }

  void updateJump(){
    if(jumpCount == 1){
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
        case "j":
        case "J":
          gameOver = true;
          return;
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

  bool isOnSolidGround(){
    switch (getSpriteType(gameMap.map[gameMap.playerY+1][gameMap.playerX])) {
      case "g":
        return true;
      default:
        return false;
    }
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
    }

    switch (getSpriteType(gameMap.map[gameMap.playerY+1][gameMap.playerX])) {
      case "a":
        gameMap.map[gameMap.playerY][gameMap.playerX] = "a";
        gameMap.playerY++;
        gameMap.map[gameMap.playerY][gameMap.playerX] = "p";
        break;
      case "m":
      case "M":
      case "b":
      case "B":
      case "j":
      case "J":
        jumpTrigger = true;
        break;
      default:
    }
  }

  

  
}