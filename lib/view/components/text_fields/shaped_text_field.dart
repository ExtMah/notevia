import 'package:flutter/material.dart';

class ShapedTextField extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? icon;
  final String? hint;
  final String? label;
  final bool? obscureText;
  final VoidCallback? onTap;
  final Color? iconColor;

  const ShapedTextField(
      {Key? key,
      this.controller,
      this.icon,
      this.hint,
      this.label,
      this.obscureText,
      this.onTap,
      this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ?? TextEditingController(),
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        filled: true,
        // fillColor: Colors.white70,
        fillColor: const Color(0xFF1e3b51),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
        labelText: label ?? "",
        // labelStyle: TextStyle(color: Colors.blue.shade800),
        labelStyle: const TextStyle(color: Colors.white),
        hintText: hint ?? "",
        hintStyle: TextStyle(color: Colors.grey[400]),
        suffixIcon: InkWell(
          onTap: onTap,
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade800),
            borderRadius: BorderRadius.circular(15)),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
