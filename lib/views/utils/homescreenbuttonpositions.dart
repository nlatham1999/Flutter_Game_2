import 'dart:ui';

import 'buttonpositions.dart';

class HomeScreenButtonPositions {
    Map<String, ButtonPositions> positions = {};

  //takes in the size of the screen and sets all the positions for the buttons
  HomeScreenButtonPositions(Size size) {
    if (size.width < size.height) {
      setButtonsPotraitMode(size);
    }else{
      setButtonsLandscapeMode(size);
    }
  }

  void setButtonsLandscapeMode(Size size) {
    double top1 = size.height * 2 / 10;
    double left1 = size.width / 10;
    double width1 = size.width / 3;
    positions["button_1"] = ButtonPositions(left: left1, top: top1, width: width1, height: 0);
    
    double top2 = size.height * 3 / 10;
    double left2 = size.width / 10;
    double width2 = size.width / 3;
    positions["button_2"] = ButtonPositions(left: left2, top: top2, width: width2, height: 0);
    
    double top3 = size.height * 4 / 10;
    double left3 = size.width / 10;
    double width3 = size.width / 3;
    positions["button_3"] = ButtonPositions(left: left3, top: top3, width: width3, height: 0);
  }

  void setButtonsPotraitMode(Size size){
    double top1 = size.height * 2 / 10;
    double left1 = size.width / 8;
    double width1 = size.width / 8 * 6;
    positions["button_1"] = ButtonPositions(left: left1, top: top1, width: width1, height: 0);
    
    double top2 = size.height * 3 / 10;
    double left2 = size.width / 8;
    double width2 = size.width / 8 * 6;
    positions["button_2"] = ButtonPositions(left: left2, top: top2, width: width2, height: 0);
    
    double top3 = size.height * 4 / 10;
    double left3 = size.width / 8;
    double width3 = size.width / 8 * 6;
    positions["button_3"] = ButtonPositions(left: left3, top: top3, width: width3, height: 0);

  }
}