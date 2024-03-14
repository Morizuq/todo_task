import 'package:flutter/material.dart';
import 'package:todo_app/components/app_bar/todo_appbar.dart';
import 'package:todo_app/mock_db/todo_database.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/screens/widgets/todo_tile.dart';

class TodoCompletedScreen extends StatefulWidget {
  const TodoCompletedScreen({super.key});

  @override
  State<TodoCompletedScreen> createState() => _TodoCompletedScreenState();
}

class _TodoCompletedScreenState extends State<TodoCompletedScreen> {
    List<TodoModel> todos = [];

  @override
  void initState() {
    super.initState();
    loadTodos();
  }

  void loadTodos() {
    setState(() {
      todos = TodoDatabase.getAllTodos();
    });
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Filter out uncompleted todos
    List<TodoModel> completedTodos =
        todos.where((todo) => todo.completed).toList();
    return Scaffold(
        appBar: TodoAppBar.create(
          title: "Completed Task",
        ),
        backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
        body: ListView.separated(
          padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
          itemCount: completedTodos.length,
          itemBuilder: (context, index) {
            TodoModel todo = completedTodos[index];
            return TodoTile(
              onUpdate: loadTodos,
              id: todo.id,
              title: todo.title,
              description: todo.description,
              isCompleted: todo.completed,
              onDelete: (){},
              onCompleted: (){},
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
        ));
  }
}
