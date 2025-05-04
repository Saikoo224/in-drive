import 'package:flutter/material.dart';
import 'app_theme.dart';

class AppStyles {
  // الألوان
  static const Color primaryColor = AppTheme.primaryColor;
  static const Color secondaryColor = AppTheme.secondaryColor;
  static const Color accentColor = AppTheme.accentColor;
  static const Color errorColor = AppTheme.errorColor;
  static const Color successColor = AppTheme.successColor;
  static const Color warningColor = AppTheme.warningColor;
  static const Color infoColor = AppTheme.infoColor;
  static const Color textPrimaryColor = AppTheme.textPrimaryColor;
  static const Color textSecondaryColor = AppTheme.textSecondaryColor;
  static const Color textHintColor = AppTheme.textHintColor;

  // المسافات
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double extraLargePadding = 32.0;

  // نصف قطر الزوايا
  static const double defaultBorderRadius = 12.0;
  static const double smallBorderRadius = 8.0;
  static const double largeBorderRadius = 20.0;

  // أحجام الأيقونات
  static const double defaultIconSize = 24.0;
  static const double largeIconSize = 40.0;

  // أنماط النصوص
  static const TextStyle headingStyle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppTheme.textPrimaryColor,
    fontFamily: 'Cairo',
  );

  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: AppTheme.textPrimaryColor,
    fontFamily: 'Cairo',
  );

  static const TextStyle titleStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AppTheme.textPrimaryColor,
    fontFamily: 'Cairo',
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppTheme.textPrimaryColor,
    fontFamily: 'Cairo',
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 14.0,
    color: AppTheme.textSecondaryColor,
    fontFamily: 'Cairo',
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Cairo',
  );

  // تنسيقات البطاقات
  static BoxDecoration cardDecoration = BoxDecoration(
    color: AppTheme.surfaceColor,
    borderRadius: BorderRadius.circular(defaultBorderRadius),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10,
        offset: const Offset(0, 5),
      ),
    ],
  );

  // تنسيقات الحالة
  static BoxDecoration statusDecoration = BoxDecoration(
    color: successColor,
    borderRadius: BorderRadius.circular(largeBorderRadius),
  );

  // تنسيقات حقول الإدخال
  static InputDecoration inputDecoration({
    required String labelText,
    IconData? prefixIcon,
    Widget? suffixIcon,
    String? hintText,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: AppTheme.surfaceColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(color: AppTheme.textHintColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(color: AppTheme.textHintColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(color: AppTheme.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(color: AppTheme.errorColor),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding,
      ),
    );
  }

  // تنسيقات الأزرار
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppTheme.primaryColor,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(
      horizontal: defaultPadding,
      vertical: defaultPadding,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(defaultBorderRadius),
    ),
  );

  static ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppTheme.secondaryColor,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(
      horizontal: defaultPadding,
      vertical: defaultPadding,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(defaultBorderRadius),
    ),
  );

  static ButtonStyle dangerButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppTheme.errorColor,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(
      horizontal: defaultPadding,
      vertical: defaultPadding,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(defaultBorderRadius),
    ),
  );
}
