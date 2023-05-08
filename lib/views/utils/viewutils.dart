import 'package:flutter/material.dart';

import '../../util/util.dart';

class ViewUtils {

  static List<Widget> getMapScreen(List<List<String>> map, double width, double height, double offsetX, double offsetY, int viewMapLeft, int viewMapRight){
    List<Widget> positions = [
      Positioned(
        left: offsetX,
        top: offsetY,
        child: Container(
          width: width * 13,
          height: height * map.length,
          color: Colors.blue,
        ),
      )
    ];

    for(int i = 0; i < map.length; i++){
      for(int j = viewMapLeft; j <= viewMapRight; j++){
        switch (getSpriteType(map[i][j])) {
          case "a":
            break;
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
          case "m":
          case "d":
            double left = width * (j- viewMapLeft) + offsetX - ((width / 4) * getSpriteAmount(map[i][j]));
            double widthToUse = width;
            if(j == viewMapLeft){
              left = width * (j- viewMapLeft) + offsetX;
              widthToUse = ((width / 4) * getSpriteAmount(map[i][j]));
            }
            positions.add(Positioned(
              left: left,
              top: height * i + offsetY,
              child: Container(
                width: widthToUse,
                height: height,
                decoration: getCell(map[i][j])
              ),
            ));
            break;
          case "M":
          case "D":
            double left = width * (j- viewMapLeft) + offsetX + ((width / 4) * getSpriteAmount(map[i][j]));
            double widthToUse = width;
            if(j == viewMapRight){
              widthToUse = width - ((width / 4) * getSpriteAmount(map[i][j]));
            }
            positions.add(Positioned(
              left: left,
              top: height * i + offsetY,
              child: Container(
                width: widthToUse,
                height: height,
                decoration: getCell(map[i][j])
              ),
            ));
            break;
          case "e":
            positions.add(Positioned(
              left: width * (j- viewMapLeft) - offsetX ,
              top: height * i + offsetY,
              child: Container(
                width: width * .75,
                height: height * .75,
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
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0),
          topLeft: Radius.circular(10.0)
        ),
       );
     case "g":
       return const BoxDecoration(
        color: Colors.green,
       );
     case "j":
     case "J":
      return const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      );
     case "m":
      return const BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
        ),
      );
     case "M":
      return const BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0),
        ),
      );
     case "b":
     case "B":
      return const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      );
     case "e":
     case "E":
      return const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      );
    case "d":
      return const BoxDecoration(
        color: Colors.purple,
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

}