import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumGray70002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray70002,
        fontSize: 13.fSize,
      );
  static get bodyMediumOnSecondaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onSecondaryContainer.withOpacity(1),
        fontSize: 13.fSize,
      );
  static get bodyMediumPoppinsGray70002 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: appTheme.gray70002,
        fontSize: 13.fSize,
      );
  // Display text style
  static get displayLargeOnSecondaryContainer =>
      theme.textTheme.displayLarge!.copyWith(
        color: theme.colorScheme.onSecondaryContainer.withOpacity(1),
      );
  static get displayLargeOnSecondaryContainer_1 =>
      theme.textTheme.displayLarge!.copyWith(
        color: theme.colorScheme.onSecondaryContainer.withOpacity(1),
      );
}

extension on TextStyle {
  TextStyle get outfit {
    return copyWith(
      fontFamily: 'Outfit',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
