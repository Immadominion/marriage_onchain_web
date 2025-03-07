// lib/widgets/card.dart
import 'package:flutter/material.dart';
import 'package:marriage_onchain_web/utils/styles_util.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const CustomCard({
    required this.child,
    this.padding = const EdgeInsets.all(16),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      // decoration: AppStyles.roundedBoxDecoration(
      //   color: Colors.white,
      //   borderRadius: 12,
      //   border: Border.all(color: Colors.grey.shade200),
      // ),
      child: child,
    );
  }
}