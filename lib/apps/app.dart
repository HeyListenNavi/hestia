import 'package:flutter/material.dart';
import 'package:hestia/config/routing/router.dart';
import 'package:hestia/config/styles.dart';

final _appRouter = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      color: ColorPalette.highlight,
      theme: _buildTheme(),
      routerConfig: _appRouter.config(),
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
      appBarTheme: AppBarTheme(
        backgroundColor: ColorPalette.background,
        titleTextStyle: TypographyStyles.textTheme.displayMedium,
        iconTheme: IconThemeData(
          color: ColorPalette.highlight,
        ),
        titleSpacing: 0.0,
      ),
    );
  }
}