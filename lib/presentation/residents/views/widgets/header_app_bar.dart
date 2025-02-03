import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:hestia/core/styles.dart';

class HeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.background,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: AppBar(
        title: Text(
          'Hestia',
        ),
        actions: [
          IconButton(
            icon: Icon(Boxicons.bx_bell),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(72.0);
  }
}
