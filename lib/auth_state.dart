import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthState extends ChangeNotifier {
  bool isLoggedIn = false;
  String userName = '';

  // 🔹 Проверка при запуске
  Future<void> checkAuth() async {
    final prefs = await SharedPreferences.getInstance();

    isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    userName = prefs.getString('userName') ?? '';

    notifyListeners();
  }

  // 🔹 Регистрация
  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userName', name);

    isLoggedIn = true;
    userName = name;

    notifyListeners();
  }

  // 🔹 Вход
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('password');
    final savedName = prefs.getString('name') ?? '';

    if (email == savedEmail && password == savedPassword) {
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userName', savedName);

      isLoggedIn = true;
      userName = savedName;

      notifyListeners();
      return true;
    }

    return false;
  }

  // 🔥 НОВОЕ: ОБНОВЛЕНИЕ ПРОФИЛЯ
  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('phone', phone);
    await prefs.setString('userName', name);

    userName = name;

    notifyListeners();
  }

  // 🔹 Выход
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isLoggedIn', false);

    isLoggedIn = false;
    userName = '';

    notifyListeners();
  }
}