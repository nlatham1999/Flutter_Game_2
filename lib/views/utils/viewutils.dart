import 'package:flutter/material.dart';

import '../../util/util.dart';

class ViewUtils {

  static List<Positioned> getMapScreen(List<List<String>> map, double width, double height, double offsetX, double offsetY, int viewMapLeft, int viewMapRight){
    List<Positioned> positions = [];

    for(int i = 0; i < map.length; i++){
      for(int j = viewMapLeft; j <= viewMapRight; j++){
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