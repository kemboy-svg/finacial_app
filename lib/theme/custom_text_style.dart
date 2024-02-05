import 'package:flutter/material.dart';
import '../app_exports.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Title text style
  static get titleLargeIndigo900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.indigo900,
      );
  static get titleLargeYellowA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.yellowA700,
      );
      static get bodyLargeIndigo800 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.indigo800.withOpacity(0.71),
      );

       static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );

      static get titleLargeLight => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w300,
      );

       static get bodyLargeGreen500 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.green500,
      );
      

       static get titleMediumBlack900_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );

      static get bodyLargeRed900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.red900,
      );

  static get titleLargeIndigo800 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.indigo800,
        fontWeight: FontWeight.w700,
      );
 static get titleMediumIndigo800 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.indigo800.withOpacity(0.8),
      );
       static get titleMediumIndigo800_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.indigo800.withOpacity(0.69),
      );
       static get bodyLargeIndigo800_2 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.indigo800.withOpacity(0.71),
      );

      static get bodyLargeIndigo800_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.indigo800.withOpacity(0.64),
      );

      static get headlineSmallIndigo800 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.indigo800.withOpacity(0.78),
        fontWeight: FontWeight.w600,
      );
      static get bodyMediumIndigo800 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.indigo800,
        fontSize: 12.fSize,
      );

      static get titleLargeWhiteA700_1 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleLargeIndigo800SemiBold =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.indigo800,
        fontWeight: FontWeight.w600,
      );

      static get titleMediumGray900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray900,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
