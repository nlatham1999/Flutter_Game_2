import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/unit.dart';
import 'explosion.dart';

import '../../constants.dart';

class BombCharged extends Unit {
  BombCharged({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  String getImage(){
    return 'assets/bomb_charged.png';
  }

  @override
  void doAction(GameController gameController) {

    if(value_1 < 12){
      value_1 ++;
      return;
    }

    gameController.gameMap.removeSprite(this);

    // Unit explosion1 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 0, offsetY: 0, width: 1, height: 1);
    // explosion1.value_2 = 0;
    // gameMap.addUnit(explosion1);
    Unit explosion2 = Explosion(type: "explosion", x: x, y: y, offsetX: 1, offsetY: 0, width: 1 * (kCellSize ~/ 4), height: 1 * (kCellSize ~/ 4));
    explosion2.value_2 = 1;
    gameController.gameMap.addUnit(explosion2);
    Unit explosion3 = Explosion(type: "explosion", x: x, y: y, offsetX: 2, offsetY: 0, width: 1 * (kCellSize ~/ 4), height: 1 * (kCellSize ~/ 4));
    explosion3.value_2 = 1;
    gameController.gameMap.addUnit(explosion3);
    // Unit explosion4 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 3, offsetY: 0, width: 1, height: 1);
    // explosion4.value_2 = 2;
    // gameMap.addUnit(explosion4);

    Unit explosion5 = Explosion(type: "explosion", x: x, y: y, offsetX: 0, offsetY: 1, width: 1 * (kCellSize ~/ 4), height: 1 * (kCellSize ~/ 4));
    explosion5.value_2 = 7;
    gameController.gameMap.addUnit(explosion5);
    Unit explosion6 = Explosion(type: "explosion", x: x, y: y, offsetX: 1, offsetY: 1, width: 1 * (kCellSize ~/ 4), height: 1 * (kCellSize ~/ 4));
    explosion6.value_2 = 0;
    gameController.gameMap.addUnit(explosion6);
    Unit explosion7 = Explosion(type: "explosion", x: x, y: y, offsetX: 2, offsetY: 1, width: 1 * (kCellSize ~/ 4), height: 1 * (kCellSize ~/ 4));
    explosion7.value_2 = 2;
    gameController.gameMap.addUnit(explosion7);
    Unit explosion8 = Explosion(type: "explosion", x: x, y: y, offsetX: 3, offsetY: 1, width: 1 * (kCellSize ~/ 4), height: 1 * (kCellSize ~/ 4));
    explosion8.value_2 = 3;
    gameController.gameMap.addUnit(explosion8);

    Unit explosion9 = Explosion(type: "explosion", x: x, y: y, offsetX: 0, offsetY: 2, width: 1 * (kCellSize ~/ 4), height: 1 * (kCellSize ~/ 4));
    explosion9.value_2 = 7;
    gameController.gameMap.addUnit(explosion9);
    Unit explosion10 = Explosion(type: "explosion", x: x, y: y, offsetX: 1, offsetY: 2, width: 1 * (kCellSize ~/ 4), height: 1 * (kCellSize ~/ 4));
    explosion10.value_2 = 6;
    gameController.gameMap.addUnit(explosion10);
    Unit explosion11 = Explosion(type: "explosion", x: x, y: y, offsetX: 2, offsetY: 2, width: 1 * (kCellSize ~/ 4), height: 1 * (kCellSize ~/ 4));
    explosion11.value_2 = 4;
    gameController.gameMap.addUnit(explosion11);
    Unit explosion12 = Explosion(type: "explosion", x: x, y: y, offsetX: 3, offsetY: 2, width: 1 * (kCellSize ~/ 4), height: 1 * (kCellSize ~/ 4));
    explosion12.value_2 = 3;
    gameController.gameMap.addUnit(explosion12);

    // Unit explosion13 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 0, offsetY: 3, width: 1, height: 1);
    // explosion13.value_2 = 6;
    // gameMap.addUnit(explosion13);
    Unit explosion14 = Explosion(type: "explosion", x: x, y: y, offsetX: 1, offsetY: 3, width: 1 * (kCellSize ~/ 4), height: 1 * (kCellSize ~/ 4));
    explosion14.value_2 = 5;
    gameController.gameMap.addUnit(explosion14);
    Unit explosion15 = Explosion(type: "explosion", x: x, y: y, offsetX: 2, offsetY: 3, width: 1 * (kCellSize ~/ 4), height: 1 * (kCellSize ~/ 4));
    explosion15.value_2 = 5;
    gameController.gameMap.addUnit(explosion15);
    // Unit explosion16 = Unit(type: "explosion", x: unit.x, y: unit.y, offsetX: 3, offsetY: 3, width: 1, height: 1);
    // explosion16.value_2 = 4;
    // gameMap.addUnit(explosion16);
  }
}