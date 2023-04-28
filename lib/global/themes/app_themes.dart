import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';
import 'app_colors.dart';

class AppThemes {
  static ThemeData light() {
    return getThemeData(
      Brightness.light,
      ColorScheme.fromSeed(
        seedColor: AppColors.colorSeed,
        primary: AppColors.primary,
      ),
    );
  }

  static ThemeData dark() {
    return getThemeData(
      Brightness.dark,
      ColorScheme.fromSeed(
        seedColor: AppColors.colorSeed,
        primary: AppColors.primary,
      ),
    );
  }

  static ThemeData getThemeData(
    Brightness brightness,
    ColorScheme colorScheme,
  ) {
    return ThemeData(
      fontFamily: FontFamily.roboto,
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 21 / 18,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          foregroundColor: AppColors.neutral01,
          minimumSize: const Size(48, 48),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: AppColors.secondaryDefault),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          foregroundColor: AppColors.neutral01,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.neutral04,
        thickness: 1,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          foregroundColor: AppColors.neutral01,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        constraints: const BoxConstraints(
          minHeight: 42,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.neutral04),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.neutral04),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.neutral04),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          height: 22 / 14,
          fontSize: 14,
          color: AppColors.dark0,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: TextStyle(
          height: 1.5,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.dark0,
        ),
        headlineLarge: TextStyle(
          fontSize: 18,
          height: 26 / 18,
          fontWeight: FontWeight.w600,
          color: AppColors.dark0,
        ),
        headlineMedium: TextStyle(
          fontSize: 16,
          height: 24 / 16,
          fontWeight: FontWeight.w600,
          color: AppColors.dark0,
        ),
        headlineSmall: TextStyle(
          fontSize: 14,
          height: 22 / 14,
          fontWeight: FontWeight.w600,
          color: AppColors.dark0,
        ),
        displayLarge: TextStyle(
          fontSize: 28,
          height: 36 / 28,
          fontWeight: FontWeight.w600,
          color: AppColors.dark0,
        ),
        displayMedium: TextStyle(
          fontSize: 24,
          height: 32 / 24,
          fontWeight: FontWeight.w600,
          color: AppColors.dark0,
        ),
        displaySmall: TextStyle(
          fontSize: 20,
          height: 28 / 20,
          fontWeight: FontWeight.w600,
          color: AppColors.dark0,
        ),
        bodySmall: TextStyle(
          height: 20 / 12,
          fontSize: 12,
          color: AppColors.dark0,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: AppColors.dark0,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 16 / 14,
        ),
      ),
    );
  }
}
