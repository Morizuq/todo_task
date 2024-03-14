class TodoModel {
  // Unique identifier for the Todo item
  final int id;
  // Title of the Todo item
  final String title;
   // Detailed description of the Todo item
  final String description;
   // Indicates whether the Todo item has been completed
   bool completed;

   // Constructor to create a Todo item
  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    this.completed = false, // Default to not completed
  });
}