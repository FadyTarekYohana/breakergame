import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;

  static const _keyEquippedColor = "equippedColor";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future clear() async => _preferences!.clear();

  static Future setEquippedColor(String equippedColor) async =>
      await _preferences?.setString(_keyEquippedColor, equippedColor);

  static String getEquippedColor() =>
      _preferences?.getString(_keyEquippedColor) ?? Colors.grey.toString();
}
