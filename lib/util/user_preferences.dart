import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;

  static const _keyEquippedColor = "equippedColor";
  static const _keyMusic = "music";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future clear() async => _preferences?.clear();

  static Future setEquippedColor(String equippedColor) async =>
      await _preferences?.setString(_keyEquippedColor, equippedColor);

  static String getEquippedColor() =>
      _preferences?.getString(_keyEquippedColor) ?? Colors.white.toString();

  static Future setMusic(bool music) async =>
      await _preferences?.setBool(_keyMusic, music);

  static bool getMusic() => _preferences?.getBool(_keyMusic) ?? true;
}
