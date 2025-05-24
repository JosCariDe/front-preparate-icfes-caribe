import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF7bb369);
const Color secondaryColor = Color(0xFFb3697b);
const Color tertiaryColor = Color(0xFF3a3a3a);
const Color alternateColor = Color(0xFF69b383);
const Color primaryText = Color(0xFF101213);
const Color secondaryText = Color(0xFF000000);
const Color primaryBackground = Color(0xFFf1f4f8);
const Color secondaryBackground = Color(0xFFffffff);

const List<Color> _colorThemes = [
  primaryColor,
  secondaryColor,
  tertiaryColor,
  alternateColor,
  primaryText,
  secondaryText,
  primaryBackground,
  secondaryBackground,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length-1,
            'Colors must be between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
