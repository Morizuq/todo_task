import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app_colors.dart';
import 'package:todo_app/screens/edit_todo.dart';

class TodoTile extends StatelessWidget {
  final String title;
  final String description;
  final bool isCompleted;
  final int id;
  final VoidCallback onDelete;
  final VoidCallback onCompleted;
  final Function() onUpdate;
  const TodoTile(
      {super.key,
      required this.title,
      required this.id,
      required this.description,
      required this.onCompleted,
      required this.onUpdate,
      required this.onDelete,
      required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(color: AppColors.primaryColor, fontSize: 20),
                ),
                Text(description, style: theme.textTheme.bodySmall)
              ],
            ),
            const Spacer(),
            isCompleted == false
                ? Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (_) => EditTodoScreen(
                                          id: id,
                                          onUpdate: () => onUpdate(),
                                        )));
                          },
                          child: Image.asset("assets/img_pencil.png")),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: onDelete,
                          child: Image.asset("assets/img_trash.png")),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: onCompleted,
                          child: Image.asset("assets/img_check-circle.png")),
                    ],
                  )
                : Container(),
          ],
        ));
  }
}
