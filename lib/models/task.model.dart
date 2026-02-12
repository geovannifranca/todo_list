class Task {
  final String title;
  final String? description;
  bool isCompleted;
  bool isFavorite;

  Task({required this.title, this.description, this.isFavorite = false})
    : isCompleted = false;
}
