import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hestia/color_palette.dart';
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
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: AuthenticationPage(),
    );
  }
}
