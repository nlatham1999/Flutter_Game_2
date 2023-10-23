import 'dart:math';
import 'dart:ui';

//this is not a multiuse class, it really only serves one purpose
class ButtonsPositions {

  Map<String, ButtonPositions> positions = {};

  //takes in the size of the screen and sets all the positions for the buttons
  ButtonsPositions(double top, double left, double gameWidth, Size size) {
    if (size.width < size.height) {
      setButtonsPotraitMode(top, size);
    }else{
      setButtonsLandscapeMode(left, gameWidth, size);
    }
  }

  void setButtonsPotraitMode(double top, Size size){
    double jumpLeft = size.width / 3;
    double jumpTop = top;
    double jumpWidth = size.width / 3;
    double jumpHeight = (size.height - top) / 2;
    jumpHeight = min(jumpHeight, jumpWidth); // if the height is taller than the width then make square. not concerned about the opposite
    positions["jump"] = ButtonPositions(left: jumpLeft, top: jumpTop, width: jumpWidth, height: jumpHeight);

    double fireLeft = size.width / 3;
    double fireTop = jumpTop + jumpHeight;
    double fireWidth = size.width / 3;
    double fireHeight = (size.height - top) / 2;
    fireHeight = min(fireHeight, fireWidth); 
    positions["fire"] = ButtonPositions(left: fireLeft, top: fireTop, width: fireWidth, height: fireHeight);
    
    double lwLeft = 0;
    double lwTop = top;
    double lwWidth = size.width / 3;
    double lwHeight = (size.height - top) / 2;
    lwHeight = min(lwHeight, lwWidth); 
    positions["left_walk"] = ButtonPositions(left: lwLeft, top: lwTop, width: lwWidth, height: lwHeight);
    
    double lsLeft = 0;
    double lsTop = lwTop + lwHeight;
    double lsWidth = size.width / 3;
    double lsHeight = (size.height - top) / 2;
    lsHeight = min(lsHeight, lsWidth); 
    positions["left_sprint"] = ButtonPositions(left: lsLeft, top: lsTop, width: lsWidth, height: lsHeight);
    
    double rwLeft = size.width * 2 / 3;
    double rwTop = top;
    double rwWidth = size.width / 3;
    double rwHeight = (size.height - top) / 2;
    rwHeight = min(rwHeight, rwWidth); 
    positions["right_walk"] = ButtonPositions(left: rwLeft, top: rwTop, width: rwWidth, height: rwHeight);
    
    double rsLeft = size.width * 2 / 3;
    double rsTop = rwTop + rwHeight;
    double rsWidth = size.width / 3;
    double rsHeight = (size.height - top) / 2;
    rsHeight = min(rsHeight, rsWidth); 
    positions["right_sprint"] = ButtonPositions(left: rsLeft, top: rsTop, width: rsWidth, height: rsHeight);
  }

  void setButtonsLandscapeMode(double left, double gameWidth, Size size){
    double jumpLeft = 0;
    double jumpTop = 0;
    double jumpWidth = left;
    double jumpHeight = size.height / 3;
    positions["jump"] = ButtonPositions(left: jumpLeft, top: jumpTop, width: jumpWidth, height: jumpHeight);
    
    double fireLeft =  left + gameWidth;
    double fireTop = 0;
    double fireWidth = size.width - left - gameWidth;
    double fireHeight = size.height / 3;
    positions["fire"] = ButtonPositions(left: fireLeft, top: fireTop, width: fireWidth, height: fireHeight);

    double lwLeft = 0;
    double lwTop = size.height / 3;
    double lwWidth = left;
    double lwHeight = size.height / 3;
    positions["left_walk"] = ButtonPositions(left: lwLeft, top: lwTop, width: lwWidth, height: lwHeight);
    
    double lsLeft = 0;
    double lsTop = size.height * 2 / 3;
    double lsWidth = left;
    double lsHeight = size.height / 3;
    positions["left_sprint"] = ButtonPositions(left: lsLeft, top: lsTop, width: lsWidth, height: lsHeight);
    
    double rwLeft = left + gameWidth;
    double rwTop = size.height / 3;
    double rwWidth = size.width - left - gameWidth;
    double rwHeight = size.height / 3;
    positions["right_walk"] = ButtonPositions(left: rwLeft, top: rwTop, width: rwWidth, height: rwHeight);
    
    double rsLeft = left + gameWidth;
    double rsTop = size.height * 2 / 3;
    double rsWidth = size.width - left - gameWidth;
    double rsHeight = size.height / 3;
    positions["right_sprint"] = ButtonPositions(left: rsLeft, top: rsTop, width: rsWidth, height: rsHeight);
  }

}

class ButtonPositions {

  double left;
  double  top;
  double width;
  double height;
  late double iconSize;

  ButtonPositions(
    {
      required this.left,
      required this.top,
      required this.width,
      required this.height,
    }
  ){
    iconSize = min(width, height) / 2;
  }

}