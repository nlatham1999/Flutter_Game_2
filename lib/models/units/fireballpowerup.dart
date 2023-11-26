

import 'package:flutter/material.dart';
import 'package:monster_maze/controllers/gamecontroller.dart';
import 'package:monster_maze/models/basicmap.dart';
import 'package:monster_maze/models/map.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../unit.dart';

class FireballPowerup extends Unit {
  FireballPowerup({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  String getImage(){
    // if(value_1 < 21){
    //   return 'assets/powerup_fireball_3.png';
    // } else if(value_1 < 23) {
    //   return 'assets/powerup_fireball_0.png';
    // } else if(value_1 < 25) {
    //   return 'assets/powerup_fireball_1.png';
    // } else {
    //   return 'assets/powerup_fireball_2.png';
    // }
    return 'assets/powerup_fireball_static.png';
  }

  @override
  void doAction(GameController gameController){

    value_1 = (value_1 + 1) % 27;

    if(gameController.gameMap.isSpriteInVicinity(gameController.gameMap.player, this, 0)){
        gameController.gameMap.removeSprite(this);
        gameController.gameMap.player.value_1 = 3;
        gameController.gameMap.player.justAddedFireball = true;
    }
  }
}