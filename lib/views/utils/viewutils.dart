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
    return unit.getImage();
      // case "signage":
      //   return "assets/sign_ghosts.png";
      // case "brick":
      //   return 'assets/brick.png';
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
