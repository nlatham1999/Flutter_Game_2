import 'package:my_app/controllers/gamecontroller.dart';

import '../unit.dart';

class Player extends Unit {
  Player({required super.type, required super.x, required super.y, required super.offsetX, required super.offsetY, required super.width, required super.height});
  
  @override
  void doAction(GameController gameController) {
  }
}