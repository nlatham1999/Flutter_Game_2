import 'package:my_app/controllers/gamecontroller.dart';

import '../unit.dart';

class Grass extends Unit {
  Grass({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  bool get isSolidGround => true;

  @override
  void doAction(GameController gameController) {
  }
}