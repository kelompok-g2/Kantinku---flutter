import 'package:flutter/material.dart';

abstract final class AppColors {
  static const background = Color(0xfff8f9ff), surface = Colors.white;
  static const primary = Color(0xff1e3a8a), ink = Color(0xff011d35);
  static const body = Color(0xff444651), muted = Color(0xff757682);
  static const pale = Color(0xffeef4ff), border = Color(0xffdbe2f0);
  static const blue = Color(0xff0058be), green = Color(0xff047857);
  static const mint = Color(0xffecfdf5), amber = Color(0xfff59e0b);
  static const peach = Color(0xfffff1e6), brown = Color(0xff6e2d00);
}

abstract final class Space {
  static const tiny = 4.0, small = 8.0, medium = 12.0, page = 16.0;
  static const large = 20.0, section = 24.0, roomy = 32.0, wide = 40.0;
  static const button = 48.0, avatar = 36.0, logo = 80.0;
  static const hero = 128.0, heroPhoto = 96.0, card = 240.0, photo = 123.75;
  static const cardInset = 10.0, closeGap = 2.0;
  static const detailPhoto = 260.0, desktopWidth = 460.0;
  static const radius = 12.0, cardRadius = 16.0, pill = 99.0;
  static const hairline = 1.0, line = 1.5, icon = 20.0;
  static const padding = EdgeInsets.all(page);
  static const cardPadding = EdgeInsets.all(medium);
  static const gap = SizedBox(height: small);
  static const block = SizedBox(height: section);
  static const rowGap = SizedBox(width: small);
}

ThemeData buildAppTheme() {
  const headings = TextStyle(
    fontFamily: 'PlusJakartaSans',
    color: AppColors.ink,
    fontWeight: FontWeight.w800,
  );
  const body = TextStyle(
    fontFamily: 'Inter',
    color: AppColors.body,
    height: 1.5,
  );
  final scheme = ColorScheme.fromSeed(seedColor: AppColors.primary).copyWith(
    primary: AppColors.primary,
    surface: AppColors.surface,
    onSurface: AppColors.ink,
    secondary: AppColors.blue,
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    fontFamily: 'Inter',
    scaffoldBackgroundColor: AppColors.background,
    textTheme: TextTheme(
      headlineLarge: headings.copyWith(fontSize: 28, height: 1.22),
      headlineMedium: headings.copyWith(fontSize: 24, height: 1.3),
      headlineSmall: headings.copyWith(fontSize: 20, height: 1.4),
      titleLarge: headings.copyWith(fontSize: 18, height: 1.4),
      titleMedium: headings.copyWith(fontSize: 16, height: 1.5),
      titleSmall: headings.copyWith(fontSize: 14, height: 1.5),
      bodyLarge: body.copyWith(fontSize: 16),
      bodyMedium: body.copyWith(fontSize: 14),
      bodySmall: body.copyWith(fontSize: 12, color: AppColors.muted),
      labelLarge: headings.copyWith(fontSize: 14),
      labelMedium: headings.copyWith(fontSize: 12),
      labelSmall: headings.copyWith(fontSize: 10),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: Space.page,
        vertical: Space.medium,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Space.radius),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Space.radius),
        borderSide: const BorderSide(color: AppColors.border),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.surface,
        minimumSize: const Size.fromHeight(Space.button),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Space.radius),
        ),
        textStyle: headings.copyWith(fontSize: 14),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.ink,
      centerTitle: false,
      elevation: 0,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.border,
      thickness: Space.hairline,
    ),
    visualDensity: VisualDensity.standard,
  );
}
