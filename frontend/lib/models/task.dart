class Task {
  final int id;
  String title;
  bool completed;

  Task({required this.id, required this.title, required this.completed});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json["id"],
      title: json["title"],
      completed: json["completed"] == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "completed": completed ? 1 : 0};
  }
}
