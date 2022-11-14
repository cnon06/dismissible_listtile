class Lesson {
  final String name;
  final double letterValue;
  final double creditValue;
  Lesson(
      {required this.name,
      required this.letterValue,
      required this.creditValue});

  @override
  String toString() {
    return "added to model, name: $name, Letter Value: $letterValue, Credit Value: $creditValue";
    // return super.toString();
  }
}
