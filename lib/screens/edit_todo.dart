import 'package:flutter/material.dart';
import 'package:todo_app/components/app_bar/todo_appbar.dart';
import 'package:todo_app/components/buttons/primary_button.dart';
import 'package:todo_app/components/form_field/primary_form_field.dart';
import 'package:todo_app/mock_db/todo_database.dart';
import 'package:todo_app/model/todo_model.dart';

class EditTodoScreen extends StatefulWidget {
  final int id;
  final Function() onUpdate;
  const EditTodoScreen({super.key, required this.id, required this.onUpdate});

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoAppBar.create(
        title: 'Edit Task',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TodoPrimaryButton(
                width: MediaQuery.of(context).size.width * 0.4,
                text: "Update",
                // Can only update when the two fields are not empty
                onPressed: () {
                  // Create a new TodoModel instance with the entered title and detail
                  TodoModel newTodo = TodoModel(
                    id: widget.id,
                    title: _titleController.text,
                    description: _detailController.text,
                    completed: false,
                  );
                  // Update todo
                  TodoDatabase.updateTodo(newTodo);
                  // Call the onUpdate callback to trigger a state update in the parent widget
                  widget.onUpdate();
                  // Close the screen
                  Navigator.pop(context);
                },
              ),
              TodoPrimaryButton(
                width: MediaQuery.of(context).size.width * 0.4,
                text: "Cancel",
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          )
        ]),
      ),
    );
  }
}
