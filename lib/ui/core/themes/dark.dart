import 'package:flutter/material.dart';

const textColor = Color(0xFFf5e0ec);
const backgroundColor = Color(0xFF140900);
const primaryColor = Color(0xFFf07523);
const primaryFgColor = Color(0xFF140900);
const secondaryColor = Color(0xFF90c052);
const secondaryFgColor = Color(0xFF140900);
const accentColor = Color(0xFF40c440);
const accentFgColor = Color(0xFF140900);

const colorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: backgroundColor,
  onSurface: textColor,
  error:
      Brightness.dark == Brightness.light
          ? Color(0xffB3261E)
          : Color(0xffF2B8B5),
  onError:
      Brightness.dark == Brightness.light
          ? Color(0xffFFFFFF)
          : Color(0xff601410),
);
