import 'package:my_app/controllers/gamecontroller.dart';

import '../unit.dart';

class Grass extends Unit {
  Grass({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  String getImage(){
    if(value_1 == 0){
      return 'assets/grass1x1.png';
    }else if(value_1 == 1){
      return 'assets/grass4x4.png';
    }else if(value_1 == 2){
      return 'assets/grass4x1.png';
    } else if(value_1 == 3){
      return 'assets/grass1x4.png';
    } else if(value_1 == 4){
      return 'assets/marble_column1x4.png';
    }else if(value_1 == 5){
      return 'assets/marble_arch1x1.png';
    }else{
      return 'assets/grass1x1.png';
    }
  }

  @override
  bool get isSolidGround => true;

  @override
  bool get needsActionRan => false;

  @override
  void doAction(GameController gameController) {
  }
}