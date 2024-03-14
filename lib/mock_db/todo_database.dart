import 'package:todo_app/model/todo_model.dart';

// Class for managing Todo data
class TodoDatabase {
  // Static list to store TodoModel objects representing Todo items
  static List<TodoModel> todos = [
    // Pre-populated sample Todo items
    TodoModel(
      id: 1,
      title: 'Todo 1',
      description: 'Description for Todo 1',
    ),
    TodoModel(
      id: 2,
      title: 'Todo 2',
      description: 'Description for Todo 2',
    ),
    TodoModel(
      id: 3,
      title: 'Todo 3',
      description: 'Description for Todo 3',
      completed: true,
    ),
  ];
  // Static methods to interact with the Todo data

  // Get all Todo items from the list
  static List<TodoModel> getAllTodos() {
    return todos;
  }

  // Add a new Todo item to the list
  static void addTodo(TodoModel todo) {
    todos.add(todo);
  }

  // Update an existing Todo item
  static void updateTodo(TodoModel todo) {
    // Find the index of the Todo item with matching id
    int index = todos.indexWhere((element) => element.id == todo.id);
    // If found, update the item at that index
    if (index != -1) {
      todos[index] = todo;
    }
  }

  // Mark a Todo item as completed based on its id
  static void markTodoAsCompleted(int id) {
    // Find the index of the Todo item with matching id
    int index = todos.indexWhere((element) => element.id == id);
    // If found, update the completed flag
    if (index != -1) {
      todos[index].completed = true; // Use elementAt for safety
    }
  }

// Delete a Todo item based on its id
  static void deleteTodo(int id) {
    // Remove all items where the id matches
    todos.removeWhere((element) => element.id == id);
  }
}
