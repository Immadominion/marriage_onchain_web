// lib/widgets/switch.dart
import 'package:flutter/material.dart';
import 'package:marriage_onchain_web/providers/theme_switch.dart';
import 'package:provider/provider.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

     final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch(
      value: value,
      onChanged: (value) {
        onChanged(!value);
        themeProvider.toggleTheme();
      },
      activeColor: Colors.purple,
      inactiveThumbColor: Colors.grey,
    );
  }
}