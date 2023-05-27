
import 'package:flutter/foundation.dart';

class GameContext extends ChangeNotifier{

  int level = 0;

  void setLevel(int l){
    level = l;
    notifyListeners();
  }
}