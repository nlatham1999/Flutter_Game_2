// ignore_for_file: overridden_fields

import 'package:my_app/models/map.dart';
import 'package:my_app/models/unit.dart';

class BasicMap extends GameMap {

  //a: air
  //b: bomb (inert)
  //B: bomb (about to go off)
  //c: crate
  //C: coin
  //d: dead monster
  //e: explosion
  //E: explosion 2
  //g: grass
  //G: grass large block
  //Ĝ: grass skinny
  //Ğ: grass tall
  //h: marble column
  //H: marble arch
  //i: icicle
  //I: icicle row
  //j: jumper (going up)
  //J: jumper (going down)
  //Ĵ: slightly faster jumper
  //l log
  //m: monster (moving left)
  //M: monster (moving right)
  //p: main character
  //r: brick
  //s: spiked monster left
  //S: spiked monster right

  List<String> mapTemplate;
  @override
  List<List<List<Unit>>> map = [];

  @override
  int playerX = 0;

  @override
  int playerY = 13;

  late Unit player;

  List<List<Unit>> collisionMap = [];

  Unit airUnit = Unit(type: "air", x: 0, y: 0, offsetX: 0, offsetY: 0, width: 4, height: 4);
  Unit outOfBoundsUnit = Unit(type: "-1", x: 0, y: 0, offsetX: 0, offsetY: 0, width: 0, height: 0);

  BasicMap({required this.mapTemplate }){
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
          case "b":
            cell.add(Unit(type: "bomb", x: j, y: i, offsetX: 0, offsetY: 0, width: 4, height: 4));
            break;
          case "c":
            cell.add(Unit(type: "crate", x: j, y: i, offsetX: 0, offsetY: 0, width: 4, height: 4));
            break;
          case "C":
            cell.add(Unit(type: "coin", x: j, y: i, offsetX: 0, offsetY: 0, width: 1, height: 1));
            break;
          case "f":
            cell.add(Unit(type: "fire_monster_left", x: j, y: i, offsetX: 0, offsetY: 0, width: 8, height: 8));
            break;
          case "F":
            cell.add(Unit(type: "fire_monster_right", x: j, y: i, offsetX: 0, offsetY: 0, width: 8, height: 8));
            break;
          case "g":
            Unit grass = Unit(type: "grass", x: j, y: i, offsetX: 0, offsetY: 0, width: 4, height: 4);
            grass.value_1 = 0;
            cell.add(grass);
            break;
          case "G":
            Unit grass = Unit(type: "grass", x: j, y: i, offsetX: 0, offsetY: 0, width: 16, height: 16);
            grass.value_1 = 1;
            cell.add(grass);
            break;
          case "Ĝ":
            Unit grass = Unit(type: "grass", x: j, y: i, offsetX: 0, offsetY: 0, width: 16, height: 4);
            grass.value_1 = 2;
            cell.add(grass);
            break;
          case "Ğ":
            Unit grass = Unit(type: "grass", x: j, y: i, offsetX: 0, offsetY: 0, width: 4, height: 16);
            grass.value_1 = 3;
            cell.add(grass);
            break;
          case "h":
            Unit grass = Unit(type: "grass", x: j, y: i, offsetX: 0, offsetY: 0, width: 4, height: 16);
            grass.value_1 = 4;
            cell.add(grass);
            break;
          case "H":
            Unit grass = Unit(type: "grass", x: j, y: i, offsetX: 0, offsetY: 0, width: 4, height: 4);
            grass.value_1 = 5;
            cell.add(grass);
            break;
          case "i":
            cell.add(Unit(type: "icicle", x: j, y: i, offsetX: 0, offsetY: 0, width: 1, height: 4));
            break;
          case "I":
            cell.add(Unit(type: "icicle", x: j, y: i, offsetX: 0, offsetY: 0, width: 1, height: 4));
            cell.add(Unit(type: "icicle", x: j, y: i, offsetX: 1, offsetY: 0, width: 1, height: 4));
            cell.add(Unit(type: "icicle", x: j, y: i, offsetX: 2, offsetY: 0, width: 1, height: 4));
            cell.add(Unit(type: "icicle", x: j, y: i, offsetX: 3, offsetY: 0, width: 1, height: 4));
            break;
          case "j":
            Unit jumper = Unit(type: "jumper_rising", x: j, y: i, offsetX: 0, offsetY: 0, width: 4, height: 4);
            jumper.value_2 = 16;
            cell.add(jumper);
            break;
          case "J":
            Unit jumper = Unit(type: "jumper_falling", x: j, y: i, offsetX: 0, offsetY: 0, width: 4, height: 4);
            jumper.value_2 = 16;
            cell.add(jumper);
            break;
          case "Ĵ":
            Unit jumper = Unit(type: "jumper_rising", x: j, y: i, offsetX: 0, offsetY: 0, width: 4, height: 4);
            jumper.value_2 = 12;
            cell.add(jumper);
            break;
          case "l":
            cell.add(Unit(type: "log", x: j, y: i, offsetX: 0, offsetY: 3, width: 8, height: 1));
            break;
          case "m":
            cell.add(Unit(type: "monster_left", x: j, y: i, offsetX: 0, offsetY: 0, width: 4, height: 4));
            break;
          case "M":
            cell.add(Unit(type: "monster_right", x: j, y: i, offsetX: 0, offsetY: 0, width: 4, height: 4));
            break;
          case "p":
            player = Unit(type: "player", x: j, y: i, offsetX: 0, offsetY: 0, width: 4, height: 4); 
            cell.add(player);
            playerX = j;
            playerY = i;
            break;
          case "r":
            cell.add(Unit(type: "brick", x: j, y: i, offsetX: 0, offsetY: 0, width: 4, height: 4));
            break;
          case "s":
            cell.add(Unit(type: "spiked_monster_left", x: j, y: i, offsetX: 0, offsetY: 0, width: 5, height: 5));
            break;
          case "S":
            cell.add(Unit(type: "spiked_monster_right", x: j, y: i, offsetX: 0, offsetY: 0, width: 5, height: 5));
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
      List<Unit> row = [];
      for(int j = 0; j < map[0].length * 4; j++){
        row.add(airUnit);
      }
      collisionMap.add(row);
    }

    for(int i = 0; i < map.length; i++){
      for(int j = 0; j < map[i].length; j++){
        for(int k = 0; k < map[i][j].length; k++){
          Unit unit = map[i][j][k];
          for(int m = 0; m < unit.height; m++){
            for(int l = 0; l < unit.width; l++){
              collisionMap[(i*4) + unit.offsetY + m][(j*4) + unit.offsetX + l] = unit;
            }
          } 
          // if(unit.type == "grass"){
          //   map[i][j].remove(unit);
          // }
        }
      }
    }
  }

  Unit getPotentialCollision(Unit unit, String direction, {String playerPriority = "neutral"}){
    
    Unit found = airUnit;

    switch (direction) {
      // @TODO if there is a player and a grass to the left (like the player is on the block) what should be returned?
      case "LEFT":
        int top = unit.y * 4 + unit.offsetY;
        int left = unit.x * 4 + unit.offsetX - 1;
        if(left < 0){
          return outOfBoundsUnit;
        }

        for(int i = 0; i < unit.height; i++){
          if(collisionMap[top+i][left].type != "air"){
            Unit collision = collisionMap[top+i][left];
            if(playerPriority == "low" && collision.type == "player"){
              found = collision;
            }else{
              return collision;
            }
          }
        }
        break;

      case "RIGHT":
        int top = unit.y * 4 + unit.offsetY;
        int left = unit.x * 4 + unit.offsetX + unit.width;
        if(left > collisionMap[0].length - 1){
          return outOfBoundsUnit;
        }
        for(int i = 0; i < unit.height; i++){
          if(collisionMap[top+i][left].type != "air"){
            Unit collision = collisionMap[top+i][left];
            if(playerPriority == "low" && collision.type == "player"){
              found = collision;
            }else{
              return collision;
            }
          }
        }
        break;
      
      case "DOWN":
        int bottom = unit.y * 4 + unit.offsetY + unit.height;
        int left = unit.x * 4 + unit.offsetX;
        if (bottom > collisionMap.length - 1) {
          return outOfBoundsUnit;
        }
        for(int i = 0; i < unit.width; i++){
          if(collisionMap[bottom][left+i].type != "air"){
            Unit collision = collisionMap[bottom][left+i];
            if(playerPriority == "low" && collision.type == "player"){
              found = collision;
            }else{
              return collision;
            }
          }
        }
        break;

      case "UP":
        int top = unit.y * 4 + unit.offsetY - 1;
        int left = unit.x * 4 + unit.offsetX;
        if (top < 0) {
          return outOfBoundsUnit;
        }
        for(int i = 0; i < unit.width; i++){
          if(collisionMap[top][left+i].type != "air"){
            Unit collision = collisionMap[top][left+i];
            if(playerPriority == "low" && collision.type == "player"){
              found = collision;
            }else{
              return collision;
            }
          }
        }
        break;

      case "LEFT_UP":
        int top = unit.y * 4 + unit.offsetY - 1;
        int left = unit.x * 4 + unit.offsetX - 1;
        if (top < 0 || left < 0) {
          return outOfBoundsUnit;
        }
        for(int i = 0; i < unit.width; i++){
          if(collisionMap[top][left+i].type != "air"){
            Unit collision = collisionMap[top][left+i];
            if(playerPriority == "low" && collision.type == "player"){
              found = collision;
            }else{
              return collision;
            }
          }
        }
        for(int i = 0; i < unit.height; i++){
          if(collisionMap[top+i][left].type != "air"){
            Unit collision = collisionMap[top+i][left];
            if(playerPriority == "low" && collision.type == "player"){
              found = collision;
            }else{
              return collision;
            }
          }
        }
        break;

      case "LEFT_DOWN":
        int top = unit.y * 4 + unit.offsetY + 1;
        if(top > collisionMap.length - 1){
          return outOfBoundsUnit;
        }
        int left = unit.x * 4 + unit.offsetX - 1;
        int bottom = unit.y * 4 + unit.offsetY + unit.height;
        if (bottom > collisionMap.length - 1) {
          return outOfBoundsUnit;
        }
        for(int i = 0; i < unit.height; i++){
          if(collisionMap[top+i][left].type != "air"){
            Unit collision = collisionMap[top+i][left];
            if(playerPriority == "low" && collision.type == "player"){
              found = collision;
            }else{
              return collision;
            }
          }
        }
        for(int i = 0; i < unit.width; i++){
          if(collisionMap[bottom][left+i].type != "air"){
            Unit collision = collisionMap[bottom][left+i];
            if(playerPriority == "low" && collision.type == "player"){
              found = collision;
            }else{
              return collision;
            }
          }
        }
        break;

      case "RIGHT_UP":
        int top = unit.y * 4 + unit.offsetY - 1;
        int left = unit.x * 4 + unit.offsetX + 1;
        if (top < 0) {
          return outOfBoundsUnit;
        }
        int right = unit.x * 4 + unit.offsetX + unit.width;
        if(right > collisionMap[0].length - 1){
          return outOfBoundsUnit;
        }
        for(int i = 0; i < unit.width; i++){
          if(collisionMap[top][left+i].type != "air"){
            Unit collision = collisionMap[top][left+i];
            if(playerPriority == "low" && collision.type == "player"){
              found = collision;
            }else{
              return collision;
            }
          }
        }
        for(int i = 0; i < unit.height; i++){
          if(collisionMap[top+i][right].type != "air"){
            Unit collision = collisionMap[top+i][right];
            if(playerPriority == "low" && collision.type == "player"){
              found = collision;
            }else{
              return collision;
            }
          }
        }
        break;

      case "RIGHT_DOWN":
        int top = unit.y * 4 + unit.offsetY + 1;
        int right = unit.x * 4 + unit.offsetX + unit.width;
        int bottom = unit.y * 4 + unit.offsetY + unit.height;
        int left = unit.x * 4 + unit.offsetX + 1;
        if (bottom > collisionMap.length - 1 || top > collisionMap.length) {
          return outOfBoundsUnit;
        }
        if(right > collisionMap[0].length - 1 || left > collisionMap[0].length){
          return outOfBoundsUnit;
        }
        for(int i = 0; i < unit.height; i++){
          if(collisionMap[top+i][right].type != "air"){
            Unit collision = collisionMap[top+i][right];
            if(playerPriority == "low" && collision.type == "player"){
              found = collision;
            }else{
              return collision;
            }
          }
        }
        for(int i = 0; i < unit.width; i++){
          if(collisionMap[bottom][left+i].type != "air"){
            Unit collision = collisionMap[bottom][left+i];
            if(playerPriority == "low" && collision.type == "player"){
              found = collision;
            }else{
              return collision;
            }
          }
        }

        break;

      default:

    }
    return found;
  }

  List<Unit> getUnitsAbove(Unit unit){
    Set<Unit> unitsSet = {};

    
    int top = unit.y * 4 + unit.offsetY - 1;
    int left = unit.x * 4 + unit.offsetX;
    if (top < 0) {
      return [outOfBoundsUnit];
    }
    for(int i = 0; i < unit.width; i++){
      if(collisionMap[top][left+i].type != "air"){
        unitsSet.add(collisionMap[top][left+i]);
      }
    } 

    return unitsSet.toList();
  }

  void moveUnitLeft(Unit unit){
    int top = unit.y * 4 + unit.offsetY;
    int left = unit.x * 4 + unit.offsetX - 1;
    int right = unit.x * 4 + unit.offsetX + unit.width - 1;
    for(int i = 0; i < unit.height; i++){
      collisionMap[top+i][left] = unit;
      collisionMap[top+i][right] = airUnit;
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
      collisionMap[top+i][left] = airUnit;
      collisionMap[top+i][right] = unit;
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
      collisionMap[top][left+i] = airUnit;
      collisionMap[bottom][left+i] = unit;
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
      collisionMap[top][left+i] = unit;
      collisionMap[bottom][left+i] = airUnit;
    }

    unit.offsetY--;
    if(unit.offsetY < 0){
      unit.offsetY = 3;
      unit.y--;
      map[unit.y+1][unit.x].remove(unit);
      map[unit.y][unit.x].add(unit);
    }
  }

  //checks to see if unit a is on unit b
  bool isUnitOnUnit(Unit a, Unit b){
    
    //make sure there is no gap in the y
    if(!(a.y * 4 + a.height + a.offsetY == b.y * 4 + b.offsetY)){
      return false;
    }

    //is b before a
    if(b.x * 4 + b.offsetX + b.width - 1 < a.x * 4 + a.offsetX){
      return false;
    }

    //is a before b
    if(a.x * 4 + a.offsetX + a.width - 1 < b.x * 4 + b.offsetX){
      return false;
    }

    return true;
  }

  //is unit b somewhere before unit a
  bool isUnitSomewherBeforeUnit(Unit a, Unit b){
    return a.x * 4 + a.offsetX > b.x * 4 + b.offsetX;
  }

  //is unit b somewhere above unit a
  bool isUnitSomewherAboveUnit(Unit a, Unit b){
    return a.y * 4 + a.offsetY > b.y * 4 + b.offsetY;
  }

  void changeUnitType(Unit unit, String newType){
    // for(int i = 0; i < unit.height; i++){
    //   for(int j = 0; j < unit.width; j++){
    //     collisionMap[unit.y * 4 + unit.offsetY + i][unit.x * 4 + unit.offsetX + j] = newType;
    //   }
    // }

    unit.type = newType;
  }

  //is sprite b within th radius of sprite a?
  bool isSpriteInVicinity(Unit a, Unit b, int radius){
    if(b.x * 4 + b.offsetX > a.x * 4 + a.offsetX + a.width + radius){
      return false;
    }

    if(a.x * 4 + a.offsetX - radius > b.x * 4 + b.offsetX + b.width){
      return false;
    }

    if(b.y * 4 + b.offsetY > a.y * 4 + a.offsetY + a.width + radius){
      return false;
    }

    if(a.y * 4 + a.offsetY - radius > b.y * 4 + b.offsetY + b.width){
      return false;
    }

    return true;
  }

  void removeSprite(Unit unit){
    for(int i = 0; i < unit.height; i++){
      for(int j = 0; j < unit.width; j++){
        collisionMap[unit.y * 4 + unit.offsetY + i][unit.x * 4 + unit.offsetX + j] = airUnit;
      }
    }
    map[unit.y][unit.x].remove(unit);
  }

  void addUnit(Unit unit){
    for(int i = 0; i < unit.height; i++){
      for(int j = 0; j < unit.width; j++){
        collisionMap[unit.y * 4 + unit.offsetY + i][unit.x * 4 + unit.offsetX + j] = unit;
      }
    }
    map[unit.y][unit.x].add(unit);
  }

  //is unit b below unit a
  bool isUnitBelowUnit(Unit a, Unit b){
    if(b.y * 4 + b.offsetY < a.y * 4 + a.offsetY + a.height){
      return false;
    }

    //is b before a
    if(b.x * 4 + b.offsetX + b.width - 1 < a.x * 4 + a.offsetX){
      return false;
    }

    //is a before b
    if(a.x * 4 + a.offsetX + a.width - 1 < b.x * 4 + b.offsetX){
      return false;
    }

    return true;
  }
}