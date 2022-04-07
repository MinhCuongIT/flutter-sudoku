import 'package:flutter/material.dart';

class FullWidhtContainer extends StatelessWidget {
  final double? height;
  final double? verticalMargin;
  final double? horizzontalMargin;
  final double? verticalPadding;
  final double? horizzontalPadding;
  final Widget child;

  const FullWidhtContainer({
    Key? key,
    required this.child,
    this.height,
    this.verticalMargin,
    this.horizzontalMargin,
    this.verticalPadding,
    this.horizzontalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 50,
      margin: EdgeInsets.symmetric(
          vertical: verticalMargin ?? 0, horizontal: horizzontalMargin ?? 0),
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 0, horizontal: horizzontalPadding ?? 0),
      child: child,
    );
  }
}
