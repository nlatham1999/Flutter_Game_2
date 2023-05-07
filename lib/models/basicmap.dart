// ignore_for_file: overridden_fields

import 'package:my_app/models/map.dart';

class BasicMap extends GameMap {

  //a: air
  //b: bomb (inert)
  //B: bomb (about to go off)
  //e: explosion
  //g: grass
  //j: jumper (going up)
  //J: jumper (going down)
  //m: monster (moving left)
  //M: monster (moving right)
  //p: main character

  @override
  List<List<String>> map = [
    ["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a",],
    ["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a",],
    ["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a",],
    ["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a",],
    ["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a",],
    ["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a",],
    ["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a",],
    ["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","g","g","a","g","a","g","a","a","a","a","a","a","a","a","a",],
    ["a","a","a","a","a","a","a","a","a","a","a","a","a","m","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","g","g","a","a","a","a","a","a","a","a","a","a","a","a","a","a",],
    ["a","a","a","a","a","a","a","a","a","a","a","g","g","g","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","g","g","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a",],
    ["a","a","a","a","a","a","j","a","a","a","a","a","a","g","g","g","g","g","g","g","a","a","a","a","a","a","a","a","a","a","a","a","g","g","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a",],
    ["a","a","a","a","a","g","g","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","g","a","g","a","g","g","a","g","g","a","g","g","a","a","a","a","a","a","a","a","a","a","a",],
    ["a","a","a","a","g","g","a","a","a","a","a","a","a","a","a","a","a","g","g","g","g","a","a","a","a","a","g","g","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a",],
    ["p","a","b","g","g","a","a","a","a","a","a","a","a","a","a","a","g","a","a","a","a","a","a","a","a","g","g","g","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a",],
    ["g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g","g",],
  ];

  @override
  int playerX = 0;

  @override
  int playerY = 13;

}