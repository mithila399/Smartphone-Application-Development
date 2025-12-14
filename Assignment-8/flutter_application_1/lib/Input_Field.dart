//Input_Field Code
import 'package:flutter/material.dart';

class Input_Field extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hint;
  final String label;
  final String? errorText;
  final IconData icon;

  const Input_Field({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.hint,
    required this.label,
    required this.errorText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );
  }
}