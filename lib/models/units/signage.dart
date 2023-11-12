import 'package:my_app/controllers/gamecontroller.dart';

import '../unit.dart';

class Signage extends Unit {

  String signageType;

  @override
  int zindex = 0;


  Signage({required this.signageType, required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});

    
  @override
  String getImage(){
    if (signageType == "grass") {
      return 'assets/signage_grass.png';
    } else if (signageType == "grass_large") {
      return 'assets/signage_grass_large.png';
    } else {
      throw Exception("This signage type has not been implemented");
    }
  }

  @override
  void doAction(GameController gameController) {
  }
}