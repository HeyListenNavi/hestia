import 'package:flutter/material.dart';
import 'package:hestia/core/styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: ColorPalette.foregroundTertiary,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "o",
              style: TextStyle(
                color: ColorPalette.foregroundTertiary,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: ColorPalette.foregroundTertiary,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
