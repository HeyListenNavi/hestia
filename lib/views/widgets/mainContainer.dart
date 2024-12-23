import 'package:flutter/material.dart';
import 'package:hestia/utils.dart';

class MainContainer extends StatelessWidget {
  final Color backgroundColor;
  final Widget? child;

  const MainContainer({
    super.key,
    this.backgroundColor = ColorPalette.background,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: child,
    );
  }
}
