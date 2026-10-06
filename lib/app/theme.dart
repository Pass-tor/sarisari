import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Sari Sari Store design system — clean, modern, store-friendly UI.
class AppTheme {
  // ── Brand ──────────────────────────────────────────────────────────────
  static const Color primary = Color(0xFF1B5E3B);       // Deep store green
  static const Color primaryLight = Color(0xFF2E8B57);  // Medium green
  static const Color primarySoft = Color(0xFFE8F5E9);   // Soft green wash
  static const Color accent = Color(0xFF43A047);        // Vibrant accent

  // ── Semantic ───────────────────────────────────────────────────────────
  static const Color danger = Color(0xFFD32F2F);
  static const Color dangerSoft = Color(0xFFFFEBEE);
  static const Color warning = Color(0xFFE65100);
  static const Color warningSoft = Color(0xFFFFF3E0);
  static const Color success = Color(0xFF2E7D32);
  static const Color successSoft = Color(0xFFE8F5E9);
  static const Color info = Color(0xFF1565C0);

  // ── Surfaces ───────────────────────────────────────────────────────────
  static const Color surface = Color(0xFFF5F7F6);       // Cool off-white
  static const Color surfaceElevated = Colors.white;
  static const Color cardBg = Colors.white;
  static const Color darkBg = Color(0xFF121212);
  static const Color darkCard = Color(0xFF1E1E1E);

  // ── Text ───────────────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFF1A1F1C);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color textOnPrimary = Colors.white;

  // ── Borders & dividers ─────────────────────────────────────────────────
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderStrong = Color(0xFFD1D5DB);
  static const Color divider = Color(0xFFF0F1F3);

  // ── Radius tokens ──────────────────────────────────────────────────────
  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;
  static const double radiusXl = 20;
  static const double radiusFull = 999;

  // ── Shadows ────────────────────────────────────────────────────────────
  static List<BoxShadow> get shadowSm => [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get shadowMd => [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get shadowLg => [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ];

  static List<BoxShadow> get shadowCart => [
        BoxShadow(
          color: primary.withOpacity(0.18),
          blurRadius: 16,
          offset: const Offset(0, -4),
        ),
      ];

  // ── ThemeData ──────────────────────────────────────────────────────────
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          brightness: Brightness.light,
          primary: primary,
          onPrimary: textOnPrimary,
          secondary: accent,
          surface: surfaceElevated,
          onSurface: textPrimary,
          error: danger,
          surfaceContainerHighest: surface,
        ),
        scaffoldBackgroundColor: surface,
        dialogBackgroundColor: surfaceElevated,
        dividerColor: divider,
        splashFactory: InkSparkle.splashFactory,

        // AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: surfaceElevated,
          foregroundColor: textPrimary,
          elevation: 0,
          scrolledUnderElevation: 0.5,
          centerTitle: false,
          surfaceTintColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          titleTextStyle: TextStyle(
            color: textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
          ),
        ),

        // Cards
        cardTheme: CardThemeData(
          color: cardBg,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusLg),
            side: const BorderSide(color: border, width: 1),
          ),
        ),

        // Inputs
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: surfaceElevated,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusMd),
            borderSide: const BorderSide(color: border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusMd),
            borderSide: const BorderSide(color: border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusMd),
            borderSide: const BorderSide(color: primary, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusMd),
            borderSide: const BorderSide(color: danger),
          ),
          hintStyle: const TextStyle(color: textTertiary, fontSize: 15),
          labelStyle: const TextStyle(color: textSecondary, fontSize: 14),
        ),

        // Buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: textOnPrimary,
            disabledBackgroundColor: primary.withOpacity(0.4),
            disabledForegroundColor: textOnPrimary.withOpacity(0.7),
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radiusMd),
            ),
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.1,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: primary,
            side: const BorderSide(color: primary, width: 1.5),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radiusMd),
            ),
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: primary,
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: textOnPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radiusMd),
            ),
          ),
        ),

        // FAB
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary,
          foregroundColor: textOnPrimary,
          elevation: 3,
          shape: CircleBorder(),
        ),

        // Navigation
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: surfaceElevated,
          elevation: 0,
          height: 68,
          indicatorColor: primarySoft,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: primary,
              );
            }
            return const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: textSecondary,
            );
          }),
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: primary, size: 24);
            }
            return const IconThemeData(color: textSecondary, size: 24);
          }),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: primary,
          unselectedItemColor: textSecondary,
          type: BottomNavigationBarType.fixed,
          backgroundColor: surfaceElevated,
          elevation: 0,
        ),

        // Chips
        chipTheme: ChipThemeData(
          backgroundColor: surface,
          selectedColor: primarySoft,
          disabledColor: surface,
          labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          secondaryLabelStyle:
              const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: primary),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusFull),
            side: const BorderSide(color: border),
          ),
          side: const BorderSide(color: border),
        ),

        // Dialogs / Sheets
        dialogTheme: DialogThemeData(
          backgroundColor: surfaceElevated,
          surfaceTintColor: Colors.transparent,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusXl),
          ),
          titleTextStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: surfaceElevated,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          showDragHandle: true,
          dragHandleColor: borderStrong,
          dragHandleSize: Size(40, 4),
        ),

        // Snackbar
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: textPrimary,
          contentTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMd),
          ),
          elevation: 4,
        ),

        // Typography
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: textPrimary,
            letterSpacing: -0.5,
          ),
          headlineMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: textPrimary,
            letterSpacing: -0.3,
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: textPrimary,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: textPrimary,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: textSecondary,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
          labelMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: textSecondary,
          ),
        ),

        // Progress
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: primary,
          linearTrackColor: primarySoft,
        ),

        // Switch / Checkbox
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith((s) {
            if (s.contains(WidgetState.selected)) return primary;
            return Colors.white;
          }),
          trackColor: WidgetStateProperty.resolveWith((s) {
            if (s.contains(WidgetState.selected)) return primarySoft;
            return border;
          }),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((s) {
            if (s.contains(WidgetState.selected)) return primary;
            return Colors.transparent;
          }),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      );
}
