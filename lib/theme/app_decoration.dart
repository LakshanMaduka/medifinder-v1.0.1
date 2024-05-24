import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray5001,
      );
  static BoxDecoration get fillGray50 => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
// Outline decorations
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimary1 => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder15 => BorderRadius.circular(
        15.h,
      );
  static BorderRadius get roundedBorder30 => BorderRadius.circular(
        30.h,
      );
}
