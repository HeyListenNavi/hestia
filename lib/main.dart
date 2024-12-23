import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hestia/utils.dart';
import 'package:hestia/views/pages/authentication.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: ColorPalette.highlight,
      theme: ThemeData(
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

        // Inputs Theme
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: ColorPalette.background,
            dragHandleColor: ColorPalette.foregroundTertiary,
            showDragHandle: true,
            dragHandleSize: Size(50.0, 3.0)),

        tabBarTheme: TabBarThemeData(
          labelColor: ColorPalette.highlight,
          indicatorColor: ColorPalette.highlight,
          unselectedLabelColor: ColorPalette.foregroundSecondary,
          unselectedLabelStyle: TypographyStyles.textTheme.labelMedium,
          labelStyle: GoogleFonts.inter(
            fontWeight: FontWeight.normal,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorPalette.background,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 10.0,
          ),
          prefixIconColor: ColorPalette.foregroundTertiary,
          hintStyle: GoogleFonts.inter(
            color: ColorPalette.foregroundTertiary,
            fontWeight: FontWeight.normal,
            fontSize: 14.0,
            letterSpacing: 0.0,
          ),
        ),
      ),
      home: AuthenticationPage(),
    );
  }
}
