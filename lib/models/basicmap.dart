// ignore_for_file: overridden_fields

import 'package:my_app/constants.dart';
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
  //l log (vertical movement)
  //L: log (horizontal movement)
  //m: monster (moving left)
  //M: monster (moving right)
  //p: main character
  //r: brick
  //s: spiked monster left
  //S: spiked monster right
  //w: winged monster

  List<String> mapTemplate;
  @override
  List<List<List<Unit>>> map = [];

  @override
  int playerX = 0;

  @override
  int playerY = 13;

  late Unit player;

  List<List<Unit>> collisionMap = [];

  Unit airUnit = Unit(type: "air", x: 0, y: 0, offsetX: 0, offsetY: 0, width: kCellSize, height: kCellSize);
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
            cell.add(Unit(type: "bomb", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize, height: kCellSize));
            break;
          case "c":
            cell.add(Unit(type: "crate", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize, height: kCellSize));
            break;
          case "C":
            cell.add(Unit(type: "coin", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize ~/ 4, height: kCellSize ~/ 4));
            break;
          case "f":
            cell.add(Unit(type: "fire_monster_left", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize * 2, height: kCellSize * 2));
            break;
          case "F":
            cell.add(Unit(type: "fire_monster_right", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize * 2, height: kCellSize * 2));
            break;
          case "g":
            Unit grass = Unit(type: "grass", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize, height: kCellSize);
            grass.value_1 = 0;
            cell.add(grass);
            break;
          case "G":
            Unit grass = Unit(type: "grass", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize * 4, height: kCellSize * 4);
            grass.value_1 = 1;
            cell.add(grass);
            break;
          case "Ĝ":
            Unit grass = Unit(type: "grass", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize, height: kCellSize);
            grass.value_1 = 2;
            cell.add(grass);
            break;
          case "Ğ":
            Unit grass = Unit(type: "grass", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize, height: kCellSize * 4);
            grass.value_1 = 3;
            cell.add(grass);
            break;
          case "h":
            Unit grass = Unit(type: "grass", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize, height: kCellSize * 4);
            grass.value_1 = 4;
            cell.add(grass);
            break;
          case "H":
            Unit grass = Unit(type: "grass", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize, height: kCellSize);
            grass.value_1 = 5;
            cell.add(grass);
            break;
          case "i":
            cell.add(Unit(type: "icicle", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize ~/ 4, height: kCellSize));
            break;
          case "I":
            cell.add(Unit(type: "icicle", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize ~/ 4, height: kCellSize));
            cell.add(Unit(type: "icicle", x: j, y: i, offsetX: kCellSize ~/ 4, offsetY: 0, width: kCellSize ~/ 4, height: kCellSize));
            cell.add(Unit(type: "icicle", x: j, y: i, offsetX: kCellSize ~/ 4 * 2, offsetY: 0, width: kCellSize ~/ 4, height: kCellSize));
            cell.add(Unit(type: "icicle", x: j, y: i, offsetX: kCellSize ~/ 4 * 3, offsetY: 0, width: kCellSize ~/ 4, height: kCellSize));
            break;
          case "j":
            Unit jumper = Unit(type: "jumper_rising", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize, height: kCellSize);
            jumper.value_2 = 16;
            cell.add(jumper);
            break;
          case "J":
            Unit jumper = Unit(type: "jumper_falling", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize, height: kCellSize);
            jumper.value_2 = 16;
            cell.add(jumper);
            break;
          case "Ĵ":
            Unit jumper = Unit(type: "jumper_rising", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize, height: kCellSize);
            jumper.value_2 = 12;
            cell.add(jumper);
            break;
          case "l":
            cell.add(Unit(type: "log", x: j, y: i, offsetX: 0, offsetY: kCellSize * 3 ~/ 4, width: kCellSize * 2, height: kCellSize ~/ 4));
            break;
          case "L":
            Unit log = Unit(type: "log_horizontal", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize * 2, height: kCellSize ~/ 4);
            log.value_3 = 24;
            cell.add(log);
            break;
          case "Ĺ":
            Unit log = Unit(type: "log_horizontal", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize * 2, height: kCellSize ~/ 4);
            log.value_3 = 12;
            cell.add(log);
            break;
          case "m":
            cell.add(Unit(type: "monster_left", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize, height: kCellSize));
            break;
          case "M":
            cell.add(Unit(type: "monster_right", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize, height: kCellSize));
            break;
          case "p":
            player = Unit(type: "player", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize, height: kCellSize); 
            cell.add(player);
            playerX = j;
            playerY = i;
            break;
          case "r":
            cell.add(Unit(type: "brick", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize, height: kCellSize));
            break;
          case "s":
            cell.add(Unit(type: "spiked_monster_left", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize * 5 ~/ 4, height: kCellSize * 5 ~/ 4));
            break;
          case "S":
            cell.add(Unit(type: "spiked_monster_right", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize * 5 ~/ 4, height: kCellSize * 5 ~/ 4));
            break;
          case "w":
            cell.add(Unit(type: "winged_monster", x: j, y: i, offsetX: 0, offsetY: 0, width: kCellSize, height: kCellSize));
            break;
          case "α":
            cell.add(Unit(type: "signage", x: 0, y: 0, offsetX: 0, offsetY: 0, width: kCellSize, height: kCellSize));
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

    for(int i = 0; i < map.length * kCellSize; i++){
      List<Unit> row = [];
      for(int j = 0; j < map[0].length * kCellSize; j++){
        row.add(airUnit);
      }
      collisionMap.add(row);
    }

    for(int i = 0; i < map.length; i++){
      for(int j = 0; j < map[i].length; j++){
        for(int k = 0; k < map[i][j].length; k++){
          Unit unit = map[i][j][k];
          if(unit.type == "signage"){
            continue; //we don't want to add signage to the collision map
          }
          for(int m = 0; m < unit.height; m++){
            for(int l = 0; l < unit.width; l++){
              collisionMap[(i*kCellSize) + unit.offsetY + m][(j*kCellSize) + unit.offsetX + l] = unit;
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
        int top = unit.y * kCellSize + unit.offsetY;
        int left = unit.x * kCellSize + unit.offsetX - 1;
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
        int top = unit.y * kCellSize + unit.offsetY;
        int left = unit.x * kCellSize + unit.offsetX + unit.width;
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
        int bottom = unit.y * kCellSize + unit.offsetY + unit.height;
        int left = unit.x * kCellSize + unit.offsetX;
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
        int top = unit.y * kCellSize + unit.offsetY - 1;
        int left = unit.x * kCellSize + unit.offsetX;
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
        int top = unit.y * kCellSize + unit.offsetY - 1;
        int left = unit.x * kCellSize + unit.offsetX - 1;
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
        int top = unit.y * kCellSize + unit.offsetY + 1;
        if(top > collisionMap.length - 1){
          return outOfBoundsUnit;
        }
        int left = unit.x * kCellSize + unit.offsetX - 1;
        int bottom = unit.y * kCellSize + unit.offsetY + unit.height;
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
        int top = unit.y * kCellSize + unit.offsetY - 1;
        int left = unit.x * kCellSize + unit.offsetX + 1;
        if (top < 0) {
          return outOfBoundsUnit;
        }
        int right = unit.x * kCellSize + unit.offsetX + unit.width;
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
        int top = unit.y * kCellSize + unit.offsetY + 1;
        int right = unit.x * kCellSize + unit.offsetX + unit.width;
        int bottom = unit.y * kCellSize + unit.offsetY + unit.height;
        int left = unit.x * kCellSize + unit.offsetX + 1;
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

  //gets a list of all units above
  //if onlyOnUnit is true, will only grab those soley resting on the unit
  List<Unit> getUnitsAbove(Unit unit, {bool onlyOnUnit = false}){
    Set<Unit> unitsSet = {};

    
    int top = unit.y * kCellSize + unit.offsetY - 1;
    int left = unit.x * kCellSize + unit.offsetX;
    if (top < 0) {
      return [outOfBoundsUnit];
    }
    for(int i = 0; i < unit.width; i++){
      Unit unitAbove = collisionMap[top][left+i];
      if(unitAbove.type != "air"){
        if(!onlyOnUnit || unitOnlyOnUnit(unit, unitAbove)){
          unitsSet.add(unitAbove);
        }
      }
    } 

    return unitsSet.toList();
  }

  //is b only on a
  bool unitOnlyOnUnit(Unit a, Unit b){
    int bottom = b.y * kCellSize + b.offsetY + b.height;
    int left = b.x * kCellSize + b.offsetX;
    for(int i = 0; i < b.width; i++){
      Unit unitBelow = collisionMap[bottom][left+i];
      if(unitBelow != a && unitBelow != airUnit){
        return false;
      }
    } 

    return true;
  }

  //is unit b within the width of unit a
  bool unitWithinUnitX(Unit a, Unit b){
    if(b.x * kCellSize + b.offsetX < a.x * kCellSize + a.offsetX){
      return false;
    }

    if(a.x * kCellSize + a.offsetX + a.width < b.x * kCellSize + b.offsetX + b.width){
      return false;
    }

    return true;
  }

  void moveUnitLeft(Unit unit){
    int top = unit.y * kCellSize + unit.offsetY;
    int left = unit.x * kCellSize + unit.offsetX - 1;
    int right = unit.x * kCellSize + unit.offsetX + unit.width - 1;
    for(int i = 0; i < unit.height; i++){
      collisionMap[top+i][left] = unit;
      collisionMap[top+i][right] = airUnit;
    }

    unit.offsetX--;
    if(unit.offsetX < 0){
      unit.offsetX = kCellSize-1;
      unit.x--;
      map[unit.y][unit.x+1].remove(unit);
      map[unit.y][unit.x].add(unit);
    }
  }

  void moveUnitRight(Unit unit){
    int top = unit.y * kCellSize + unit.offsetY;
    int left = unit.x * kCellSize + unit.offsetX;
    int right = unit.x * kCellSize + unit.offsetX + unit.width;
    for(int i = 0; i < unit.height; i++){
      collisionMap[top+i][left] = airUnit;
      collisionMap[top+i][right] = unit;
    }

    unit.offsetX++;
    if(unit.offsetX > kCellSize-1){
      unit.offsetX = 0;
      unit.x++;
      map[unit.y][unit.x-1].remove(unit);
      map[unit.y][unit.x].add(unit);
    }
  }

  void moveUnitDown(Unit unit){
    int top = unit.y * kCellSize + unit.offsetY;
    int bottom = unit.y * kCellSize + unit.offsetY + unit.height;
    int left = unit.x * kCellSize + unit.offsetX;
    for(int i = 0; i < unit.width; i++){
      collisionMap[top][left+i] = airUnit;
      collisionMap[bottom][left+i] = unit;
    }

    unit.offsetY++;
    if(unit.offsetY > kCellSize-1){
      unit.offsetY = 0;
      unit.y++;
      map[unit.y-1][unit.x].remove(unit);
      map[unit.y][unit.x].add(unit);
    }
  }

  void moveUnitUp(Unit unit){
    int top = unit.y * kCellSize + unit.offsetY - 1;
    int bottom = unit.y * kCellSize + unit.offsetY + unit.height - 1;
    int left = unit.x * kCellSize + unit.offsetX;
    for(int i = 0; i < unit.width; i++){
      collisionMap[top][left+i] = unit;
      collisionMap[bottom][left+i] = airUnit;
    }

    unit.offsetY--;
    if(unit.offsetY < 0){
      unit.offsetY = kCellSize-1;
      unit.y--;
      map[unit.y+1][unit.x].remove(unit);
      map[unit.y][unit.x].add(unit);
    }
  }

  //checks to see if unit a is on unit b
  bool isUnitOnUnit(Unit a, Unit b){
    
    //make sure there is no gap in the y
    if(!(a.y * kCellSize + a.height + a.offsetY == b.y * kCellSize + b.offsetY)){
      return false;
    }

    //is b before a
    if(b.x * kCellSize + b.offsetX + b.width - 1 < a.x * kCellSize + a.offsetX){
      return false;
    }

    //is a before b
    if(a.x * kCellSize + a.offsetX + a.width - 1 < b.x * kCellSize + b.offsetX){
      return false;
    }

    return true;
  }

  //is unit b somewhere before unit a
  bool isUnitSomewherBeforeUnit(Unit a, Unit b){
    return a.x * kCellSize + a.offsetX > b.x * kCellSize + b.offsetX;
  }

  //is unit b somewhere above unit a
  bool isUnitSomewherAboveUnit(Unit a, Unit b){
    return a.y * kCellSize + a.offsetY > b.y * kCellSize + b.offsetY;
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
    if(b.x * kCellSize + b.offsetX > a.x * kCellSize + a.offsetX + a.width + radius){
      return false;
    }

    if(a.x * kCellSize + a.offsetX - radius > b.x * kCellSize + b.offsetX + b.width){
      return false;
    }

    if(b.y * kCellSize + b.offsetY > a.y * kCellSize + a.offsetY + a.width + radius){
      return false;
    }

    if(a.y * kCellSize + a.offsetY - radius > b.y * kCellSize + b.offsetY + b.width){
      return false;
    }

    return true;
  }

  void removeSprite(Unit unit){
    for(int i = 0; i < unit.height; i++){
      for(int j = 0; j < unit.width; j++){
        collisionMap[unit.y * kCellSize + unit.offsetY + i][unit.x * kCellSize + unit.offsetX + j] = airUnit;
      }
    }
    map[unit.y][unit.x].remove(unit);
  }

  void addUnit(Unit unit){
    for(int i = 0; i < unit.height; i++){
      for(int j = 0; j < unit.width; j++){
        collisionMap[unit.y * kCellSize + unit.offsetY + i][unit.x * kCellSize + unit.offsetX + j] = unit;
      }
    }
    map[unit.y][unit.x].add(unit);
  }

  //is unit b below unit a
  bool isUnitBelowUnit(Unit a, Unit b){
    if(b.y * kCellSize + b.offsetY < a.y * kCellSize + a.offsetY + a.height){
      return false;
    }

    //is b before a
    if(b.x * kCellSize + b.offsetX + b.width - 1 < a.x * kCellSize + a.offsetX){
      return false;
    }

    //is a before b
    if(a.x * kCellSize + a.offsetX + a.width - 1 < b.x * kCellSize + b.offsetX){
      return false;
    }

    return true;
  }
}