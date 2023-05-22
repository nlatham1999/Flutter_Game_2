// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:my_app/models/map.dart';
import 'package:my_app/models/unit.dart';

class BasicMap extends GameMap {

  //a: air
  //b: bomb (inert)
  //B: bomb (about to go off)
  //d: dead monster
  //e: explosion
  //E: explosion 2
  //g: grass
  //j: jumper (going up)
  //J: jumper (going down)
  //m: monster (moving left)
  //M: monster (moving right)
  //p: main character
  //i: icicle
  //I: icicle (falling)

  List<String> mapTemplate = [
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaagaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaagaaaaamagaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaagaaaaaaagaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaagaaaaggggaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaagaaagaaagaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaagaagaaaagaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaagaaaaaaagaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaagaaaaaaagaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaaggggaaaagaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaagaaagaaagaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "aaagaaaagaagaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "apagaaaaaaagaaaagaaaaaaaaaaaaaagaaaaaaaaaaaaaaaaagaaaaaaaaaaaaag",
    "gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg",
  ];

  @override
  List<List<List<Unit>>> map = [];

  @override
  int playerX = 0;

  @override
  int playerY = 13;

  late Unit player;

  List<List<String>> collisionMap = [];

  BasicMap(){
    buildMapFromTemplate();

    buildCollisionMap();
  }

  void buildMapFromTemplate(){
    map = [];
    for(int i = 0; i < mapTemplate.length; i++){
      List<List<Unit>> row = [];
      for(int j = 0; j < mapTemplate[i].length; j++){
        List<Unit> cell = [];
        switch (mapTemplate[i][j]) {
          case "a":
            cell.add(Unit(type: "air", x: j, y: i, offsetX: 0, offsetY: 0, width: 4, height: 4));
            break;
          case "g":
            cell.add(Unit(type: "grass", x: j, y: i, offsetX: 0, offsetY: 0, width: 4, height: 4));
            break;
          case "m":
            cell.add(Unit(type: "monster_left", x: j, y: i, offsetX: 0, offsetY: 0, width: 4, height: 4));
            break;
          case "p":
            player = Unit(type: "player", x: j, y: i, offsetX: 0, offsetY: 0, width: 4, height: 4); 
            cell.add(player);
            playerX = j;
            playerY = i;
            break;
          default:
        }
        row.add(cell);
      }
      map.add(row);
    }
  }

  void buildCollisionMap(){
    collisionMap = [];

    for(int i = 0; i < map.length * 4; i++){
      List<String> row = [];
      for(int j = 0; j < map[0].length * 4; j++){
        row.add("air");
      }
      collisionMap.add(row);
    }

    for(int i = 0; i < map.length; i++){
      for(int j = 0; j < map[i].length; j++){
        for(int k = 0; k < map[i][j].length; k++){
          Unit unit = map[i][j][k];
          for(int m = 0; m < unit.height; m++){
            for(int l = 0; l < unit.width; l++){
              collisionMap[(i*4) + unit.offsetY + m][(j*4) + unit.offsetX + l] = unit.type;
            }
          } 
        }
      }
    }
  }

  String getPotentialCollision(Unit unit, String direction){
    switch (direction) {
      // @TODO if there is a player and a grass to the left (like the player is on the block) what should be returned?
      case "LEFT":
        int top = unit.y * 4 + unit.offsetY;
        int left = unit.x * 4 + unit.offsetX - 1;
        if(left < 0){
          return "-1";
        }
        for(int i = 0; i < unit.height; i++){
          if(collisionMap[top+i][left] != "air"){
            return collisionMap[top+i][left];
          }
        }
        break;

      case "RIGHT":
        int top = unit.y * 4 + unit.offsetY;
        int left = unit.x * 4 + unit.offsetX + unit.width;
        if(left > collisionMap[0].length - 1){
          return "-1";
        }
        for(int i = 0; i < unit.height; i++){
          if(collisionMap[top+i][left] != "air"){
            return collisionMap[top+i][left];
          }
        }
        break;
      
      case "DOWN":
        int bottom = unit.y * 4 + unit.offsetY + unit.height;
        int left = unit.x * 4 + unit.offsetX;
        if (bottom > collisionMap.length - 1) {
          return "-1";
        }
        for(int i = 0; i < unit.width; i++){
          if(collisionMap[bottom][left+i] != "air"){
            return collisionMap[bottom][left+i];
          }
        }
        break;

      case "UP":
        int top = unit.y * 4 + unit.offsetY - 1;
        int left = unit.x * 4 + unit.offsetX;
        if (top < 0) {
          return "-1";
        }
        for(int i = 0; i < unit.width; i++){
          if(collisionMap[top][left+i] != "air"){
            return collisionMap[top][left+i];
          }
        }
        break;

      default:

    }
    return "";
  }

  void moveUnitLeft(Unit unit){
    int top = unit.y * 4 + unit.offsetY;
    int left = unit.x * 4 + unit.offsetX - 1;
    int right = unit.x * 4 + unit.offsetX + unit.width - 1;
    for(int i = 0; i < unit.height; i++){
      collisionMap[top+i][left] = unit.type;
      collisionMap[top+i][right] = "air";
    }

    unit.offsetX--;
    if(unit.offsetX < 0){
      unit.offsetX = 3;
      unit.x--;
      map[unit.y][unit.x+1].remove(unit);
      map[unit.y][unit.x].add(unit);
    }
  }

  void moveUnitRight(Unit unit){
    int top = unit.y * 4 + unit.offsetY;
    int left = unit.x * 4 + unit.offsetX;
    int right = unit.x * 4 + unit.offsetX + unit.width;
    for(int i = 0; i < unit.height; i++){
      collisionMap[top+i][left] = "air";
      collisionMap[top+i][right] = unit.type;
    }

    unit.offsetX++;
    if(unit.offsetX > 3){
      unit.offsetX = 0;
      unit.x++;
      map[unit.y][unit.x-1].remove(unit);
      map[unit.y][unit.x].add(unit);
    }
  }

  void moveUnitDown(Unit unit){
    int top = unit.y * 4 + unit.offsetY;
    int bottom = unit.y * 4 + unit.offsetY + unit.height;
    int left = unit.x * 4 + unit.offsetX;
    for(int i = 0; i < unit.width; i++){
      collisionMap[top][left+i] = "air";
      collisionMap[bottom][left+i] = unit.type;
    }

    unit.offsetY++;
    if(unit.offsetY > 3){
      unit.offsetY = 0;
      unit.y++;
      map[unit.y-1][unit.x].remove(unit);
      map[unit.y][unit.x].add(unit);
    }
  }

  void moveUnitUp(Unit unit){
    int top = unit.y * 4 + unit.offsetY - 1;
    int bottom = unit.y * 4 + unit.offsetY + unit.height - 1;
    int left = unit.x * 4 + unit.offsetX;
    for(int i = 0; i < unit.width; i++){
      collisionMap[top][left+i] = unit.type;
      collisionMap[bottom][left+i] = "air";
    }

    unit.offsetY--;
    if(unit.offsetY < 0){
      unit.offsetY = 3;
      unit.y--;
      map[unit.y+1][unit.x].remove(unit);
      map[unit.y][unit.x].add(unit);
    }
  }
}