import 'package:flutter/material.dart';

class UnderLineFormField extends StatelessWidget {
    final String labelText;
  // final String hintText;
  final TextEditingController controller;
  const UnderLineFormField({super.key, required this.labelText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        // hintText: hintText,
        border: const UnderlineInputBorder(),
      ),
    );
  }
}