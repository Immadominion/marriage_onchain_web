import 'package:flutter/material.dart';

/// A utility class that provides consistent styling across the app
class AppStyles {
  // Color schemes
  static const Color primary = Color(0xFFE11D48); // rose-500
  static const Color secondary = Color(0xFF9333EA); // purple-600
  static const Color slate900 = Color(0xFF0F172A);
  static const Color slate800 = Color(0xFF1E293B);
  static const Color slate50 = Color(0xFFF8FAFC);
  static const Color red500 = Color(0xFFEF4444);
  static const Color red900 = Color(0xFF7F1D1D);
  
  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  
  // Text styles
  static TextStyle get headingLarge => const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );
  
  static TextStyle get headingMedium => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  
  static TextStyle get headingSmall => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  
  static TextStyle get bodyLarge => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  
  static TextStyle get bodyMedium => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  
  static TextStyle get bodySmall => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
  
  // Button styles
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primary,
    foregroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );
  
  static ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFFF1F5F9), // slate-100
    foregroundColor: slate900,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );
  
  static ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: slate900,
    side: const BorderSide(color: Color(0xFFE2E8F0)), // slate-200
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );
  
  static ButtonStyle ghostButtonStyle = TextButton.styleFrom(
    foregroundColor: slate900,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );
  
  // Card styles
  static BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );
  
  static BoxDecoration cardDecorationDark = BoxDecoration(
    color: slate800,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: const Color(0xFF334155), width: 1),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );
  
  // Input styles
  static InputDecoration inputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: primary, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  );
  
  // Helper methods
  static BoxDecoration getCardDecoration(bool isDarkMode) {
    return isDarkMode ? cardDecorationDark : cardDecoration;
  }
  
  static Color getButtonColor(String variant, bool isDarkMode) {
    switch (variant) {
      case 'default':
        return isDarkMode ? slate50 : slate900;
      case 'destructive':
        return isDarkMode ? red900 : red500;
      case 'outline':
        return isDarkMode ? slate800 : Colors.white;
      case 'secondary':
        return isDarkMode ? slate800 : const Color(0xFFF1F5F9);
      case 'ghost':
        return Colors.transparent;
      case 'link':
        return Colors.transparent;
      default:
        return isDarkMode ? slate50 : slate900;
    }
  }
  
  static Size getButtonSize(String size) {
    switch (size) {
      case 'sm':
        return const Size(double.infinity, 36);
      case 'lg':
        return const Size(double.infinity, 44);
      case 'icon':
        return const Size(40, 40);
      default:
        return const Size(double.infinity, 40);
    }
  }
}


class StylesUtil {
  static BoxDecoration roundedBoxDecoration({
    Color? color,
    double borderRadius = 8.0,
    BoxBorder? border,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      border: border,
    );
  }

  static TextStyle textStyle({
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}