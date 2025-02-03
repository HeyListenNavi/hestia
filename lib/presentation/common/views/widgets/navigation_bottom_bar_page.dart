import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hestia/core/styles.dart';

class NavigationBottomBarPage extends StatelessWidget {
  final int actionIndex;
  final IconData icon;

  const NavigationBottomBarPage({
    super.key,
    required this.actionIndex,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.tabsRouter.setActiveIndex(actionIndex);
      },
      icon: Icon(
        icon,
        color: context.tabsRouter.activeIndex == actionIndex
            ? ColorPalette.highlight
            : ColorPalette.foregroundTertiary,
      ),
    );
  }
}
