import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hestia/apps/common/blocs/router/router_cubit.dart';
import 'package:hestia/config/styles.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final routerCubitState = context.watch<RouterCubit>().state;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      color: ColorPalette.highlight,
      theme: _buildTheme(),
      routerConfig: routerCubitState.router,
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      // Colors
      highlightColor: ColorPalette.highlight,
      colorSchemeSeed: ColorPalette.highlight,
      scaffoldBackgroundColor: ColorPalette.backgroundSecondary,

      // Text Theme
      textTheme: TypographyStyles.textTheme,

      // Button Theme
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyles.filledButton,
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyles.outlineButton,
      ),

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyles.textButton,
      ),

      // Miscellaneous themes
      inputDecorationTheme: MiscellaneousStyles.input,
      tabBarTheme: MiscellaneousStyles.tabBar,
      bottomSheetTheme: MiscellaneousStyles.bottomSheet,
    );
  }
}