import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF326E5C);

  static InputDecoration inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: primaryColor),
      prefixIcon: Icon(icon, color: primaryColor, size: 20),
      contentPadding: const EdgeInsets.symmetric(vertical: 15),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), 
        borderSide: const BorderSide(color: primaryColor, width: 1)
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), 
        borderSide: const BorderSide(color: primaryColor, width: 2)
      ),
    );
  }
}