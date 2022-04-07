import 'package:flutter/material.dart';

class FullWidthBtn extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  final double height;
  final VoidCallback handlePress;
  final Widget? icon;
  final OutlinedBorder? shape;

  const FullWidthBtn({
    Key? key,
    required this.text,
    required this.color,
    required this.backgroundColor,
    required this.height,
    required this.handlePress,
    this.icon,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: TextButton.icon(
        onPressed: handlePress,
        icon: icon ?? const SizedBox.shrink(),
        label: Text(
          text,
          style: TextStyle(color: color, fontSize: 20),
        ),
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: shape,
        ),
      ),
    );
  }
}
