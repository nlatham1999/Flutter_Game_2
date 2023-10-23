import 'package:my_app/controllers/gamecontroller.dart';
import 'package:my_app/models/unit.dart';

class BombInert extends Unit{
  BombInert({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  String getImage(){
    return 'assets/bomb.png';
  }

  @override 
  void doAction(GameController gameController){
    if(gameController.gameMap.isSpriteInVicinity(this, gameController.gameMap.player, 2)){
      gameController.queueUnitTypeChange(this, "bomb_charged");
    }
  }
}