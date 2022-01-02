import 'package:flutter/material.dart';

class ShapedTextField extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? icon;
  final String? hint;
  final String? label;
  final bool? obscureText;

  const ShapedTextField(
      {Key? key,
      this.controller,
      this.icon,
      this.hint,
      this.label,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ?? TextEditingController(),
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white70,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
        labelText: label ?? "",
        labelStyle: TextStyle(color: Colors.blue.shade800),
        hintText: hint ?? "",
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: Icon(
          icon,
          color: Colors.blue.shade800,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade800),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
