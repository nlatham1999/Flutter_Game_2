

import 'package:flutter/material.dart';
import 'package:monster_maze/controllers/gamecontroller.dart';
import 'package:monster_maze/models/basicmap.dart';
import 'package:monster_maze/models/map.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../unit.dart';

class Checkpoint extends Unit {
  Checkpoint({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  String getImage(){
    return 'assets/bell.png';
  }

  @override
  void doAction(GameController gameController){


    if(gameController.gameMap.isSpriteInVicinity(gameController.gameMap.player, this, 0)){
        gameController.gameMap.removeSprite(this);
        gameController.playerStartX = this.x;
        gameController.playerStartY = this.y;
    }
  }
}