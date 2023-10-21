import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/models/unit.dart';
import 'package:my_app/painters/bombpainter.dart';
import 'package:my_app/painters/deadmonsterpainter.dart';
import 'package:my_app/painters/jumperpainter.dart';
import 'package:my_app/painters/monsterpainter.dart';
import 'package:my_app/painters/playerpainter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../painters/grasspainter.dart';
import '../../painters/traingelpainter.dart';
import '../../util/util.dart';

class ViewUtils {
  static List<Widget> getMapScreen(
      List<List<List<Unit>>> map,
      double width,
      double height,
      double offsetX,
      double offsetY,
      int viewMapLeft,
      int viewMapRight,
      {int numCellsToDisplay = 13}) {
    List<Widget> positions = [
      // Positioned(
      //   left: offsetX,
      //   bottom: offsetY,
      //   child: Container(
      //     width: width * numCellsToDisplay + width / kCellSize,
      //     height: height * map.length,
      //     color: Colors.blue,
      //   ),
      // )
    ];

    offsetX -= width / 2;

    int vL = viewMapLeft ~/ kCellSize;
    // if(vL > 0){
    //   vL --;
    // print("minusing");
    // }
    int vLo = viewMapLeft % kCellSize;
    int vR = viewMapRight ~/ kCellSize + (kCellSize ~/ 4);
    if(vR > map[0].length){
      vR = map[0].length;
    }

    for (int i = 0; i < map.length; i++) {
      for (int j = vL; j < vR; j++) {
        for (int k = 0; k < map[i][j].length; k++) {
          Unit unit = map[i][j][k];
          if (unit.type == "air") {
            continue;
          }
          double left = width * (j - vL - (vLo / kCellSize)) +
              offsetX +
              (width * unit.offsetX / kCellSize);
          double top = height * i + offsetY + (height * unit.offsetY / kCellSize);
          double boxWidth = width * unit.width / kCellSize;
          positions.add(
            Positioned(
              left: left,
              top: top,
              child: SizedBox(
                width: boxWidth,
                height: height * unit.height / kCellSize,
                child: Image.asset(
                  getPositionedImage(
                      unit), // Replace with the actual image path
                  fit: BoxFit
                      .contain, // Adjust the image within the specified box
                ),
              ),
            ),
          );
        }
      }
    }

    positions.add(Positioned(
      left: offsetX,
      top: offsetY - (width * (3) / 2),
      child: Container(
        width: width * (numCellsToDisplay + 1),
        height: height * map.length + width * (kCellSize -1),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: width + width,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
      ),
    ));

    return positions;
  }

  static String getPositionedImage(Unit unit) {
    switch (unit.type) {
      case "signage":
        return "assets/sign_ghosts.png";
      case "bomb":
        return 'assets/bomb.png';
      case "bomb_charged":
        return 'assets/bomb_charged.png';
      case "brick":
        return 'assets/brick.png';
      case "explosion":
        return 'assets/explosion_tiny.png';
      case "player_fireball":
        return 'assets/player_fireball.png';
      case "fireball_powerup":
        if(unit.value_1 < 21){
          return 'assets/powerup_fireball_3.png';
        } else if(unit.value_1 < 23) {
          return 'assets/powerup_fireball_0.png';
        } else if(unit.value_1 < 25) {
          return 'assets/powerup_fireball_1.png';
        } else {
          return 'assets/powerup_fireball_2.png';
        }
      case "fireball":
        return 'assets/fireball.png';
      case "fire_monster_left":
        return 'assets/fire_monster_small_left.png';
        // if(unit.value_1 == 28){
        //   return 'assets/fire_monster_left_phase_2.png';
        // }
        // // if(unit.value_1 == 9){
        // //   return 'assets/fire_monster_left_phase_3.png';
        // // }
        // if(unit.value_2 == 1){
        //   return 'assets/fire_monster_left_looking_up.png';
        // }
        // return 'assets/fire_monster_left.png';
      case "fire_monster_right":
      
        return 'assets/fire_monster_small_right.png';
        // if(unit.value_1 == 28){
        //   return 'assets/fire_monster_right_phase_2.png';
        // }
        // if(unit.value_2 == 1){
        //   return 'assets/fire_monster_right_looking_up.png';
        // }
        // if(unit.value_1 == 9){
        //   return 'assets/fire_monster_right_phase_3.png';
        // }
        // return 'assets/fire_monster_right.png';
      case "grass":
        if(unit.value_1 == 0){
          return 'assets/grass1x1.png';
        }else if(unit.value_1 == 1){
          return 'assets/grass4x4.png';
        }else if(unit.value_1 == 2){
          return 'assets/grass4x1.png';
        } else if(unit.value_1 == 3){
          return 'assets/grass1x4.png';
        } else if(unit.value_1 == 4){
          return 'assets/marble_column1x4.png';
        }else if(unit.value_1 == 5){
          return 'assets/marble_arch1x1.png';
        }else{
          return 'assets/grass1x1.png';
        }
      case "icicle":
      case "icicle_falling":
        return 'assets/icicle.png';
      case "log":
        return 'assets/log.png';
      case "log_horizontal":
        return 'assets/log.png';
      case "jumper_rising":
      case "jumper_falling":
        return 'assets/jumper.png';
      case "monster_dead":
        if(unit.value_2 == 1){
          return 'assets/ghost_dead.png';
        }else if(unit.value_2 == 2){
          return 'assets/fire_monster_small_dead.png';
        }else if(unit.value_2 == 3){
          return 'assets/jumper_dead.png';
        }else if(unit.value_2 == 4){
          return 'assets/bomb_dead.png';
        }
        return 'assets/monster_dead.png';
      case "monster_left":
        if (unit.value_1 < 2){
          return 'assets/monster_left_small.png';
        }else{
          return 'assets/monster_left_small_2.png';
        }
      case "monster_right":
        if (unit.value_1 < 2){
          return 'assets/monster_right_small.png';
        }else{
          return 'assets/monster_right_small_2.png';
        }
      case "player":
        if (unit.direction == 0) {
          return 'assets/player_right_small.png';
        } else {
          return 'assets/player_left_small.png';
        }
      case "spiked_monster_left":
        if (unit.value_1 < 4){
          return 'assets/spiked_monster_left_small.png';
        }else{
          return 'assets/spiked_monster_left_small_2.png';
        }
      case "spiked_monster_right":
        if (unit.value_1 < 4){
          return 'assets/spiked_monster_right_small.png';
        }else{
          return 'assets/spiked_monster_right_small_2.png';
        }
      case "winged_monster":
        if((unit.value_1 == 0 && unit.value_3 == 0) || (unit.value_1 == 1 && unit.value_3 == 1)){
          return 'assets/ghost_2.png';
        }else{
          return 'assets/ghost_3.png';
        }
      default:
        return "";
    }
  }

  static CustomPaint getPaintedCell(Unit unit) {
    switch (unit.type) {
      // case "bomb":
      //   return CustomPaint(
      //     painter: BombPainter(color: Colors.black),
      //   );
      // case "bomb_charged":
      //   return CustomPaint(
      //     painter: BombPainter(color: Colors.orange),
      //   );
      // case "explosion":
      //   return CustomPaint(
      //     painter: BombPainter(color: Colors.orange),
      //   );
      // case "grass":
      //   return CustomPaint(
      //     painter: GrassPainter(),
      //   );
      // case "icicle":
      // case "icicle_falling":
      //   return CustomPaint(
      //     painter: IciclePainter(
      //       color: Colors.white,
      //     ),
      //   );
      // case "jumper_rising":
      // case "jumper_falling":
      //   return CustomPaint(
      //     painter: JumperPainter(),
      //   );
      case "monster_dead":
        return CustomPaint(
          painter: DeadMonsterPainter(),
        );
      // case "monster_left":
      //   return CustomPaint(
      //       painter: MonsterPainter(
      //         direction: 0
      //       ),
      //   );
      // case "monster_right":
      //   return CustomPaint(
      //       painter: MonsterPainter(
      //         direction: 1
      //       ),
      //   );
      // case "player":
      //   return CustomPaint(
      //     painter: PlayerPainter(color: Colors.red, direction: unit.direction),
      //   );
      default:
        return CustomPaint();
    }
  }

  static topAppBar(param0, BuildContext context) {}
}
