import 'package:flutter/material.dart';

import '../../util/util.dart';

class ViewUtils {

  static List<Widget> getMapScreen(List<List<String>> map, double width, double height, double offsetX, double offsetY, int viewMapLeft, int viewMapRight){
    List<Widget> positions = [
      Positioned(
        left: offsetX,
        top: offsetY,
        child: Container(
          width: width * 16,
          height: height * map.length,
          color: Colors.blue,
        ),
      )
    ];


    for(int i = 0; i < map.length; i++){
      for(int j = viewMapLeft; j <= viewMapRight; j++){
        switch (getSpriteType(map[i][j])) {
          case "j":
          case "J":
            positions.add(Positioned(
              left: width * (j- viewMapLeft) + offsetX ,
              top: height * i + offsetY - ((height / 4) * getSpriteAmount(map[i][j])),
              child: Container(
                width: width,
                height: height,
                decoration: getCell(map[i][j])
              ),
            ));
            break;
          default:
            positions.add(Positioned(
              left: width * (j- viewMapLeft) + offsetX ,
              top: height * i + offsetY,
              child: Container(
                width: width,
                height: height,
                decoration: getCell(map[i][j])
              ),
            ));
        }
      }
    }

    return positions;
  }

  static BoxDecoration getCell(String type){
   switch (getSpriteType(type)) {
     case "p":
       return const BoxDecoration(
        color: Colors.red,
       );
     case "g":
       return const BoxDecoration(
        color: Colors.green,
       );
     case "j":
     case "J":
      return const BoxDecoration(
        color: Colors.amber,
      );
     case "m":
     case "M":
      return const BoxDecoration(
        color: Colors.purple,
      );
     case "b":
     case "B":
      return const BoxDecoration(
        color: Colors.black,
      );
     case "e":
      return const BoxDecoration(
        color: Colors.orange,
      );
     default:
       return const BoxDecoration(
        color: Colors.blue,
       );
   }
  }

}