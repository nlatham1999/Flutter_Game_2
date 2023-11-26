import 'package:monster_maze/controllers/gamecontroller.dart';
import 'package:monster_maze/models/unit.dart';

class IcicleInert extends Unit {
  IcicleInert({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  String getImage(){
    return 'assets/icicle.png';
  }

  @override
  void doAction(GameController gameController) {
    if(gameController.gameMap.isUnitBelowUnit(this, gameController.gameMap.player)){
      gameController.queueUnitTypeChange(this, "icicle_falling");
    }

  }
}