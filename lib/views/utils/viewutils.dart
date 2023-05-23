import 'package:flutter/material.dart';
import 'package:my_app/models/unit.dart';

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
                child: Container(
                  width:  boxWidth,
                  height: height * unit.height / 4,
                  decoration: getCell(unit))
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

  static BoxDecoration getCell(Unit unit){
   switch (getSpriteType(unit)) {
     case "player":
       return const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0),
          topLeft: Radius.circular(10.0)
        ),
       );
     case "grass":
       return const BoxDecoration(
        color: Colors.green,
       );
     case "jumper_rising":
     case "jumper_falling":
      return const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      );
     case "monster_left":
      return const BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
        ),
      );
     case "monster_right":
      return const BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0),
        ),
      );
     case "b":
      return const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      );
     case "B":
      return BoxDecoration(
        color: Colors.orange.shade900,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      );
     case "e":
     case "E":
      return const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      );
    case "coin":
      return const BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      );
    case "monster_dead":
      return const BoxDecoration(
        color: Colors.purple,
      );
    case "crate":
      return const BoxDecoration(
        color: Colors.brown,
      );
    case "i":
    case "I":
      return const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(10, 40),
          bottomRight: Radius.elliptical(10, 40),
        )
      );
     default:
       return const BoxDecoration(
        color: Colors.blue,
       );
   }
  }

  static topAppBar(param0, BuildContext context) {}

}