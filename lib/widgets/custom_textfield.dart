//Custom TextField Clss.......
import 'package:flutter/material.dart';
import 'colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.size,
    required this.hint,
    this.keyboardType,
    required this.controller,
    this.onchange,
  });

  final Size size;
  final TextEditingController? controller;
  final String? hint;
  final TextInputType? keyboardType;
  final void Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: customBalck,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onchange,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.grey.shade300,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: customBalck)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.transparent)),
          contentPadding: EdgeInsets.symmetric(
              vertical: size.height * 0.01, horizontal: size.width * 0.03)),
    );
  }
}
