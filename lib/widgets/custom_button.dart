
import 'package:flutter/material.dart';


import 'apptext.dart';
import 'colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: size.width,
      decoration: BoxDecoration(
          color: customBlue, borderRadius: BorderRadius.circular(8)),
      child: const Center(
        child: AppText(
          name: "Place Order",
          size: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
