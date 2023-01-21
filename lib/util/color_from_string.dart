import 'package:breakergame/util/user_preferences.dart';
import 'package:flutter/material.dart';

equippedColorFromString() {
  final color = UserSimplePreferences.getEquippedColor();
  if (color == Colors.grey.toString()) {
    return Colors.grey;
  } else if (color == Colors.black.toString()) {
    return Colors.black;
  } else if (color == Colors.white.toString()) {
    return Colors.white;
  } else if (color == Colors.deepOrange.toString()) {
    return Colors.deepOrange;
  } else if (color == Colors.orange.toString()) {
    return Colors.orange;
  } else if (color == Colors.amber.toString()) {
    return Colors.amber;
  } else if (color == Colors.purple.toString()) {
    return Colors.purple;
  } else if (color == Colors.pink.toString()) {
    return Colors.pink;
  } else if (color == Colors.cyan.toString()) {
    return Colors.cyan;
  }
}
