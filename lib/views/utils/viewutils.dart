import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/models/unit.dart';
import 'package:my_app/painters/bombpainter.dart';
import 'package:my_app/painters/deadmonsterpainter.dart';
import 'package:my_app/painters/jumperpainter.dart';
import 'package:my_app/painters/monsterpainter.dart';
import 'package:my_app/painters/playerpainter.dart';

import '../../painters/grasspainter.dart';
import '../../painters/traingelpainter.dart';
import '../../util/util.dart';

class ViewUtils {

  static List<Widget> getMapScreen(List<List<List<Unit>>> map, double width, double height, double offsetX, double offsetY, int viewMapLeft, int viewMapRight){
    List<Widget> positions = [
      Positioned(
        left: offsetX,
        top: offsetY,
        child: Container(
          width: width * 12 + width / 4,
          height: height * map.length,
          color: Colors.blue,
        ),
      )
    ];

    int vL = viewMapLeft ~/ 4;
    // if(vL > 0){
    //   vL --;
      // print("minusing");
    // }
    int vLo = viewMapLeft % 4;
    int vR  = viewMapRight ~/ 4 + 1;
    int vRo = viewMapRight % 4;

    for(int i = 0; i < map.length; i++){
      for(int j = vL; j < vR; j++){
        for(int k = 0; k < map[i][j].length; k++){
          Unit unit = map[i][j][k];
          switch (getSpriteType(unit)) {
            case "air":
              break;
            default:
              double left = width * (j- vL - (vLo/4)) + offsetX + (width * unit.offsetX / 4);
              double top = height * i + offsetY + (height * unit.offsetY / 4);
              double boxWidth = width * unit.width / 4;
              positions.add(Positioned(
                left: left,
                top: top,
                child: SizedBox(
                  width:  boxWidth,
                  height: height * unit.height / 4,
                  child: getPaintedCell(unit)
                ),
              ),
            );
          }
        }
      }
    }

    positions.add(Positioned(
        left: offsetX - width,
        top: offsetY - width,
        child: Container(
          width: width * 14 + width / 4,
          height: height * map.length + width * 2,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: width,
            ),
          ),
        ),
    ));

    return positions;
  }

  static CustomPaint getPaintedCell(Unit unit){
    switch (unit.type) {
      case "bomb":
        return CustomPaint(
          painter: BombPainter(color: Colors.black),
        );
      case "bomb_charged":
        return CustomPaint(
          painter: BombPainter(color: Colors.orange),
        );
      case "explosion":
        return CustomPaint(
          painter: BombPainter(color: Colors.orange),
        );
      case "grass":
        return CustomPaint(
          painter: GrassPainter(),
        );
      case "icicle":
      case "icicle_falling":
        return CustomPaint(
          painter: IciclePainter(
            color: Colors.white,
          ),
        );
      case "jumper_rising":
      case "jumper_falling":
        return CustomPaint(
          painter: JumperPainter(),
        );
      case "monster_dead":
        return CustomPaint(
            painter: DeadMonsterPainter(),
        );
      case "monster_left":
        return CustomPaint(
            painter: MonsterPainter(
              direction: 0
            ),
        );  
      case "monster_right":
        return CustomPaint(
            painter: MonsterPainter(
              direction: 1
            ),
        );      
      case "player":
        return CustomPaint(
          painter: PlayerPainter(color: Colors.red, direction: unit.direction),
        );
      default:
        return CustomPaint();
    }
  }

  static topAppBar(param0, BuildContext context) {}

}