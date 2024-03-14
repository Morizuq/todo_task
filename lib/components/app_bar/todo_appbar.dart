import 'package:flutter/material.dart';
import 'package:todo_app/app_colors.dart';

// Custom AppBar class for flexibility
class TodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoAppBar(
      {super.key,
      this.leading,
      required this.automaticallyImplyLeading,
      this.title,
      this.actions,
      this.flexibleSpace,
      this.bottom,
      this.elevation,
      this.scrolledUnderElevation,
      this.shadowColor,
      this.surfaceTintColor,
      this.shape,
      this.backgroundColor,
      this.foregroundColor,
      this.appBarHeight = 60,
      this.centerTitle = false,
      this.iconColor,
      this.textColor,
      this.leadingWidth});
  // Constructor with properties for customization
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final double? scrolledUnderElevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double appBarHeight;
  final bool centerTitle;
  final Color? iconColor;
  final Color? textColor;
  final double? leadingWidth;

  // Factory method for general AppBar creation
  factory TodoAppBar.create({String? title}) {
    return TodoAppBar(
      automaticallyImplyLeading: true,
      iconColor: Colors.white,
      backgroundColor: AppColors.primaryColor,
      title: title != null
          ? Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 23),
              ),
            )
          : null,
    );
  }
  // Factory method for creating the Home screen's AppBar
  factory TodoAppBar.createHomeAppbar() {
    return TodoAppBar(
      backgroundColor: AppColors.primaryColor,
      automaticallyImplyLeading: false,
      title: const Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: Text("TODO APP", style: TextStyle(fontSize: 20)),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Image.asset("assets/img_calendar.png"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleTextStyle: TextStyle(fontSize: 16, color: textColor),
      titleSpacing: 1,
      iconTheme: IconThemeData(color: iconColor ?? Colors.black),
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title,
      actions: actions,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
      elevation: elevation ?? 0.0,
      scrolledUnderElevation: scrolledUnderElevation,
      shadowColor: shadowColor,
      shape: shape,
      backgroundColor: backgroundColor ?? Colors.white,

      /// Maybe transparent
      foregroundColor: foregroundColor,
      centerTitle: centerTitle,
      leadingWidth: leadingWidth ?? 40.0,
    );
  }

  // Size of the AppBar, used for layout calculations
  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
