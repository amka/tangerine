import 'package:flutter/material.dart';

const textColor = Color(0xFF1f0a16);
const backgroundColor = Color(0xFFfff5ed);
const primaryColor = Color(0xFFff7112);
const primaryFgColor = Color(0xFF1f0a16);
const secondaryColor = Color(0xFFaed67a);
const secondaryFgColor = Color(0xFF1f0a16);
const accentColor = Color(0xFF3bbf3b);
const accentFgColor = Color(0xFF1f0a16);

const colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: backgroundColor,
  onSurface: textColor,
  error:
      Brightness.light == Brightness.light
          ? Color(0xffB3261E)
          : Color(0xffF2B8B5),
  onError:
      Brightness.light == Brightness.light
          ? Color(0xffFFFFFF)
          : Color(0xff601410),
);
