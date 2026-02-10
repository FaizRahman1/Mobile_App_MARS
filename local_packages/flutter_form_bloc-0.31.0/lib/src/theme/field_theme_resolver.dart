import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/src/theme/form_bloc_theme.dart';
import 'package:flutter_form_bloc/src/theme/material_states.dart';
import 'package:flutter_form_bloc/src/utils/to_string.dart';

/// Resolves looking for the appropriate value to use in the widget
class FieldThemeResolver {
  final ThemeData theme;
  final FormTheme formTheme;
  final FieldTheme? fieldTheme;

  const FieldThemeResolver(this.theme, this.formTheme, [this.fieldTheme]);

InputDecorationTheme get decorationTheme {
  if (fieldTheme?.decorationTheme != null) {
    return fieldTheme!.decorationTheme!;
  }

  if (formTheme.decorationTheme != null &&
      formTheme.decorationTheme is InputDecorationTheme) {
    return formTheme.decorationTheme as InputDecorationTheme;
  }

  if (theme.inputDecorationTheme is InputDecorationTheme) {
    return theme.inputDecorationTheme as InputDecorationTheme;
  }

  // fallback: empty theme to avoid type issues
  return const InputDecorationTheme();
}

  TextStyle get textStyle {
    return fieldTheme?.textStyle ??
        formTheme.textStyle ??
        theme.textTheme.titleMedium!;
  }

  WidgetStateProperty<Color?> get textColor {
    return fieldTheme?.textColor ??
        formTheme.textColor ??
        SimpleMaterialStateProperty(
          normal: theme.textTheme.titleMedium!.color,
          disabled: theme.disabledColor,
        );
  }
}

/// Represents the basic theme for a field
abstract class FieldTheme extends Equatable {
  /// Represents the style of the text within the field
  /// If null, defaults to the `subtitle` text style from the current [Theme].
  final TextStyle? textStyle;

  /// Resolves the color of the [textStyle].
  /// You will receive [WidgetState.disabled]
  final WidgetStateProperty<Color?>? textColor;

  /// The theme for InputDecoration of this field
  final InputDecorationTheme? decorationTheme;

  const FieldTheme({
    this.textStyle,
    this.textColor,
    this.decorationTheme,
  });

  @override
  List<Object?> get props => [textStyle, textColor, decorationTheme];

  @override
  String toString([ToString? toString]) {
    return (toString
          ?..add('textStyle', textStyle)
          ..add('textColor', textColor)
          ..add('decorationTheme', decorationTheme))
        .toString();
  }
}
