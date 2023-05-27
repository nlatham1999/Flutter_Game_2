class Unit {

  String type;
  int x;
  int y;
  int offsetX;
  int offsetY;
  int width;
  int height;

  int fall = 0;

  int value_1 = 0;
  int value_2 = 0;

  bool alreadyUpdated = false;

  int direction = 0;

  Unit({
    required this.type,
    required this.x,
    required this.y,
    required this.offsetX,
    required this.offsetY,
    required this.width,
    required this.height
  });

}