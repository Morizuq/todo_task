import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/components/app_bar/todo_appbar.dart';
import 'package:todo_app/mock_db/todo_database.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/screens/add_task.dart';
import 'package:todo_app/screens/widgets/todo_tile.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  List<TodoModel> todos = [];

  @override
  void initState() {
    super.initState();
    loadTodos();
  }
  // Fetch todos || Reload page
  void loadTodos() {
    setState(() {
      todos = TodoDatabase.getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Filter out completed todos
    List<TodoModel> activeTodos =
        todos.where((todo) => !todo.completed).toList();
    return Scaffold(
      appBar: TodoAppBar.createHomeAppbar(),
      backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
        itemCount: activeTodos.length,
        itemBuilder: (context, index) {
          TodoModel todo = activeTodos[index];
          return TodoTile(
            onUpdate: loadTodos,
            id: todo.id,
            title: todo.title,
            description: todo.description,
            isCompleted: todo.completed,
            onDelete: () {
              // Implement delete logic here
              TodoDatabase.deleteTodo(todo.id);
              // Refresh the UI after deleting
              loadTodos();
            },
            onCompleted: () {
              // Implement completion logic here
              TodoDatabase.markTodoAsCompleted(todo.id);
              // Refresh the UI after completing
              loadTodos();
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (_) => AddTaskScreen(
                        onTaskAdded: () => loadTodos(),
                      )));
        },
        backgroundColor: theme.colorScheme.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
