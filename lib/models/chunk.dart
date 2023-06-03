class Chunk {
  List<String> level;
  String slope;
  String type;
  String description;

  Chunk({
    required this.description,
    required this.slope,
    required this.level,
    this.type = "regular",
  });
}