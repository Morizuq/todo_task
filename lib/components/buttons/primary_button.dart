import 'package:flutter/material.dart';
import 'package:todo_app/app_colors.dart';

class TodoPrimaryButton extends StatelessWidget {
  const TodoPrimaryButton(
      {super.key,
      required this.text,
      this.inProgress = false,
      this.height = 56,
      this.isEnabled = true,
      this.buttonStyle,
      this.onPressed,
      this.width,
      this.buttonRadius,
      this.fontSize});

  final String text;
  final bool inProgress;
  final double height;
  final bool isEnabled;
  final ButtonStyle? buttonStyle;
  final VoidCallback? onPressed;
  final double? width;
  final double? buttonRadius;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled)
                  ? AppColors.primaryColor.withOpacity(0.4)
                  : themeData.colorScheme.primaryContainer,
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled)
                  ? AppColors.primaryColor.withOpacity(0.4)
                  : AppColors.primaryColor,
            ),
            textStyle: MaterialStateProperty.resolveWith(
              (state) => state.contains(MaterialState.disabled)
                  ? themeData.textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                    )
                  : themeData.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            iconColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.disabled)
                  ? Colors.white
                  : Colors.white,
            ),
          ),
          onPressed: onPressed,
          child: inProgress
              ? const Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.white,
                    height: 1,
                  ),
                )),
    );
  }
}
