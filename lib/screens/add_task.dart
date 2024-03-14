import 'package:flutter/material.dart';
import 'package:todo_app/components/app_bar/todo_appbar.dart';
import 'package:todo_app/components/buttons/primary_button.dart';
import 'package:todo_app/components/form_field/primary_form_field.dart';
import 'package:todo_app/mock_db/todo_database.dart';
import 'package:todo_app/model/todo_model.dart';

class AddTaskScreen extends StatefulWidget {
  final Function() onTaskAdded;
  const AddTaskScreen({super.key, required this.onTaskAdded});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoAppBar.create(
        title: 'Add Task',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          UnderLineFormField(labelText: "Title", controller: _titleController),
          UnderLineFormField(
              labelText: "Detail", controller: _detailController),
          const SizedBox(
            height: 60,
          ),
          TodoPrimaryButton(
              text: "ADD",
              onPressed: () {
                // Create a new TodoModel instance with the entered title and detail
                TodoModel newTodo = TodoModel(
                  id: DateTime.now().millisecondsSinceEpoch,
                  title: _titleController.text,
                  description: _detailController.text,
                  completed: false,
                );
                // Add the new todo to the database
                TodoDatabase.addTodo(newTodo);
                // Call the onTaskAdded callback to trigger a state update in the parent widget
                widget.onTaskAdded();
                // Close the screen
                Navigator.pop(context);
              })
        ]),
      ),
    );
  }
}
