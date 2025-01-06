import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ColorPalette {
  // Main Colors
  static const Color highlight = Color(0xff265571);
  static const Color lightHighlight = Color(0xff0b7ec1);

  // Foreground Colors
  static const Color foreground = Color(0xff1e1e1e);
  static const Color foregroundSecondary = Color(0xff808080);
  static const Color foregroundTertiary = Color(0xffafb3b6);
  static const Color foregroundLight = Color(0xffffffff);

  // Background Colors
  static const Color background = Color(0xffffffff);
  static const Color backgroundSecondary = Color(0xfff2f2f3);
  static const Color backgroundTertiary = Color(0xffafb3b6);

  // Util colors
  static const Color transparent = Color(0x00000000);
  static const Color error = Color(0xffbb1b1b);
}

abstract class TypographyStyles {
  // Font Sizes
  static const double fontSizeXXLarge = 64.0;
  static const double fontSizeXLarge = 40.0;
  static const double fontSizeLarge = 24.0;
  static const double fontSizeMedium = 16.0;
  static const double fontSizeSmall = 14.0;
  static const double fontSizeXSmall = 12.0;

  // Text Styles
  static final TextTheme textTheme = TextTheme(
    // Display
    displayLarge: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      color: ColorPalette.highlight,
      fontSize: fontSizeXXLarge,
      letterSpacing: 0.0,
    ),

    displayMedium: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      color: ColorPalette.highlight,
      fontSize: fontSizeXLarge,
      letterSpacing: 0.0,
    ),

    // Headline
    headlineLarge: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      color: ColorPalette.foreground,
      fontSize: fontSizeLarge,
      letterSpacing: 0.0,
    ),

    headlineMedium: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      color: ColorPalette.foreground,
      fontSize: fontSizeMedium,
      letterSpacing: 0.0,
    ),

    // Body
    bodyLarge: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      color: ColorPalette.foreground,
      fontSize: fontSizeSmall,
      letterSpacing: 0.0,
    ),

    bodyMedium: GoogleFonts.inter(
      fontWeight: FontWeight.normal,
      color: ColorPalette.foreground,
      fontSize: fontSizeSmall,
      letterSpacing: 0.0,
    ),

    bodySmall: GoogleFonts.inter(
      fontWeight: FontWeight.normal,
      color: ColorPalette.foregroundTertiary,
      fontSize: fontSizeSmall,
      letterSpacing: 0.0,
    ),

    // Label
    labelLarge: GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      color: ColorPalette.foreground,
      fontSize: fontSizeSmall,
      letterSpacing: 0.0,
    ),

    labelMedium: GoogleFonts.inter(
      fontWeight: FontWeight.normal,
      color: ColorPalette.foregroundSecondary,
      fontSize: fontSizeSmall,
      letterSpacing: 0.0,
    ),

    labelSmall: GoogleFonts.inter(
      fontWeight: FontWeight.normal,
      color: ColorPalette.foregroundTertiary,
      fontSize: fontSizeXSmall,
      letterSpacing: 0.0,
    ),
  );
}

abstract class ButtonStyles {
  static final ButtonStyle filledButton = FilledButton.styleFrom(
    // Color Styles
    backgroundColor: ColorPalette.highlight,
    foregroundColor: ColorPalette.foregroundLight,
    iconColor: ColorPalette.foregroundLight,
    disabledBackgroundColor: ColorPalette.backgroundSecondary,
    disabledForegroundColor: ColorPalette.foregroundTertiary,

    // Text Style
    textStyle: GoogleFonts.inter(
      fontWeight: FontWeight.w600,
      letterSpacing: 0.0,
    ),

    // Shape Styles
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 12.0,
    ),
    maximumSize: Size(double.infinity, double.infinity),
  );

  static final ButtonStyle outlineButton = OutlinedButton.styleFrom(
    // Color Styles
    backgroundColor: ColorPalette.transparent,
    foregroundColor: ColorPalette.foregroundTertiary,
    iconColor: ColorPalette.foregroundTertiary,
    disabledBackgroundColor: ColorPalette.backgroundSecondary,
    disabledForegroundColor: ColorPalette.foregroundTertiary,
    side: BorderSide(
      width: 2.0,
      color: ColorPalette.foregroundTertiary,
    ),

    // Text Style
    textStyle: GoogleFonts.inter(
      fontWeight: FontWeight.w600,
      letterSpacing: 0.0,
    ),

    // Shape Styles
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 12.0,
    ),
    maximumSize: Size(double.infinity, double.infinity),
  );

  static final ButtonStyle textButton = TextButton.styleFrom(
    // Color Styles
    backgroundColor: ColorPalette.transparent,
    foregroundColor: ColorPalette.foregroundSecondary,
    iconColor: ColorPalette.foregroundSecondary,
    disabledBackgroundColor: ColorPalette.backgroundSecondary,
    disabledForegroundColor: ColorPalette.foregroundTertiary,

    // Text Style
    textStyle: GoogleFonts.inter(
      fontWeight: FontWeight.normal,
      letterSpacing: 0.0,
    ),

    // Shape Styles
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 12.0,
    ),
    maximumSize: Size(double.infinity, double.infinity),
  );

  static final ButtonStyle secondaryButton = FilledButton.styleFrom(
    // Color Styles
    backgroundColor: ColorPalette.background,
    foregroundColor: ColorPalette.foregroundSecondary,
    iconColor: ColorPalette.foregroundSecondary,
    disabledBackgroundColor: ColorPalette.backgroundSecondary,
    disabledForegroundColor: ColorPalette.foregroundTertiary,

    // Text Style
    textStyle: GoogleFonts.inter(
      fontWeight: FontWeight.w600,
      letterSpacing: 0.0,
    ),

    // Shape Styles
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 12.0,
    ),
    maximumSize: Size(double.infinity, double.infinity),
  );
}

abstract class MiscellaneousStyles {
  static final BottomSheetThemeData bottomSheet = BottomSheetThemeData(
    backgroundColor: ColorPalette.background,
    dragHandleColor: ColorPalette.foregroundTertiary,
    showDragHandle: true,
    dragHandleSize: Size(50.0, 3.0),
  );

  static final TabBarThemeData tabBar = TabBarThemeData(
    labelColor: ColorPalette.highlight,
    indicatorColor: ColorPalette.highlight,
    unselectedLabelColor: ColorPalette.foregroundSecondary,
    unselectedLabelStyle: TypographyStyles.textTheme.labelMedium,
    labelStyle: GoogleFonts.inter(
      fontWeight: FontWeight.normal,
    ),
  );

  static final InputDecorationTheme input = InputDecorationTheme(
    filled: true,
    fillColor: ColorPalette.background,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide.none,
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: 6.0,
      vertical: 4.0,
    ),
    errorStyle: GoogleFonts.inter(
      color: ColorPalette.error,
      fontSize: TypographyStyles.fontSizeXSmall,
    ),
    prefixIconColor: ColorPalette.foregroundTertiary,
    suffixIconColor: ColorPalette.foregroundTertiary,
    hintStyle: GoogleFonts.inter(
      color: ColorPalette.foregroundTertiary,
      fontWeight: FontWeight.normal,
      fontSize: TypographyStyles.fontSizeSmall,
      letterSpacing: 0.0,
    ),
  );

  static final AppBarTheme appBar = AppBarTheme(
    backgroundColor: ColorPalette.background,
    titleTextStyle: TypographyStyles.textTheme.displayMedium,
    iconTheme: IconThemeData(
      color: ColorPalette.highlight,
    ),
    titleSpacing: 0.0,
  );
}

abstract class CustomIcons {
  static final SvgPicture googleIcon = SvgPicture.asset(
    'assets/google_logo.svg',
    width: 22.0,
    height: 22.0,
  );
}
