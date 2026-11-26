import 'package:material_ui/material_ui.dart';

/// Soft light-orange surfaces paired with fresh green actions.
abstract final class AppColors {
  static const background = Color(0xFFFFF4E6);
  static const surface = Color(0xFFFFFFFF);
  static const orangeSoft = Color(0xFFFFE3C2);
  static const orangeAccent = Color(0xFFFFB366);
  static const orangeDeep = Color(0xFF9A4A00);

  static const green = Color(0xFF2EA84F);
  static const greenDark = Color(0xFF1B6B33);
  static const greenSoft = Color(0xFFE3F6E8);

  static const textPrimary = Color(0xFF2B2118);
  static const textSecondary = Color(0xFF5E4E40);
}

/// Screen width breakpoints.
abstract final class Breakpoints {
  static const tablet = 600.0;
  static const desktop = 1024.0;
}

ThemeData buildAppTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.green,
    brightness: Brightness.light,
  ).copyWith(
    primary: AppColors.greenDark,
    onPrimary: Colors.white,
    secondary: AppColors.orangeAccent,
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: 'Roboto',
    fontFamilyFallback: const ['Segoe UI', 'Helvetica', 'Arial', 'sans-serif'],
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? Colors.white
            : AppColors.orangeDeep,
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? AppColors.green
            : AppColors.orangeSoft,
      ),
      trackOutlineColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? AppColors.green
            : AppColors.orangeDeep,
      ),
    ),
    focusColor: AppColors.green.withValues(alpha: 0.2),
  );
}
