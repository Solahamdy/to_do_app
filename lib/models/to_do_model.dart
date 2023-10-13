class ToDoModel{
  final String imagePath; // Required
  final String? title; // Optional
  final String? subtitle;
  bool completed = false;

  ToDoModel({
    required this.completed,
    required this.imagePath,
    this.title,
    this.subtitle,
  });


}