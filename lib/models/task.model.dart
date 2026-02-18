class Task {
  String title;
  String? description;
  bool isCompleted;
  bool isFavorite;
  DateTime createdAt;

  Task({required this.title, this.description, this.isFavorite = false})
    : isCompleted = false,
      createdAt = DateTime.now();
}
