import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:hestia/core/styles.dart';
import 'package:hestia/presentation/common/views/widgets/main_container.dart';

@RoutePage()
class ResidentsHomePage extends StatelessWidget {
  final String userName;

  const ResidentsHomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 22.0,
      ),
      child: Column(
        spacing: 22.0,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _headerContainer(userName: userName),
        ],
      ),
    );
  }

  MainContainer _headerContainer({required String userName}) {
    return MainContainer(
      backgroundColor: ColorPalette.highlight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.0,
        children: [
          Row(
            children: [
              Text(
                '¡Bienvenido!',
                style: TypographyStyles.textTheme.headlineMedium!.copyWith(
                  color: ColorPalette.foregroundLight,
                ),
              ),
              Icon(
                Boxicons.bx_chevron_right,
                color: ColorPalette.foregroundLight,
              )
            ],
          ),
          Row(
            spacing: 8.0,
            children: [
              Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  color: ColorPalette.background,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    userName[0],
                    style: TypographyStyles.textTheme.headlineLarge,
                  ),
                ),
              ),
              Text(
                userName,
                style: TypographyStyles.textTheme.headlineLarge!.copyWith(
                  color: ColorPalette.foregroundLight,
                ),
              ),
            ],
          ),
          Text(
            'Ubicacion de la privada',
            style: TypographyStyles.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
