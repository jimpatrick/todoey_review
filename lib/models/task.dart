class Task {
  Task({required this.title, required this.isDone});

  String title;
  bool? isDone = false;

  void changeIsDone (bool? value) {
    isDone = value;
  }

}