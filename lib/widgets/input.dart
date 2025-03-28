// lib/widgets/input.dart
import 'package:flutter/material.dart';
import 'package:marriage_onchain_web/utils/styles_util.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final IconData? icon;
  final TextEditingController controller;

  const CustomInput({
    required this.label,
    required this.placeholder,
    this.icon,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          // style: AppStyles.textStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: placeholder,
            prefixIcon: icon != null ? Icon(icon) : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
