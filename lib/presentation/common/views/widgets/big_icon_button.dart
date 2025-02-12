import 'package:flutter/material.dart';
import 'package:hestia/core/styles.dart';

class BigIconButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final IconData icon;
  final bool isSecondary;

  const BigIconButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  }) : isSecondary = false;

  const BigIconButton.secondary({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  }) : isSecondary = true;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = isSecondary ? ButtonStyles.secondaryBigIconButton : ButtonStyles.bigIconButton;
    final Color fontColor = isSecondary ? ColorPalette.highlight : ColorPalette.foregroundLight;

    return Padding(
      padding: EdgeInsets.all(12.0),
      child: SizedBox(
        height: 110,
        child: IconButton.filled(
          onPressed: onPressed,
          icon: Column(
            spacing: 8.0,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TypographyStyles.textTheme.labelSmall!.copyWith(
                  color: fontColor,
                ),
              ),
            ],
          ),
          style: style,
        ),
      ),
    );
  }
}
