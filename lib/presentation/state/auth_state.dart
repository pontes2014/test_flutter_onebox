import 'package:flutter/material.dart';

class AuthState extends ChangeNotifier {
  String username = '';
  String password = '';
  String? usernameError;
  String? passwordError;
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void updateUsername(String value) {
    username = value;
    validateUsername();
    notifyListeners();
  }

  void updatePassword(String value) {
    password = value;
    validatePassword();
    notifyListeners();
  }

  bool validateUsername() {
    if (username.length < 3 || RegExp(r'[!@#%^&*(),.?":{}|<>]').hasMatch(username)) {
      usernameError = 'Login inválido: deve ter pelo menos 3 caracteres e não conter caracteres especiais.';
      return false;
    } else {
      usernameError = null;
      return true;
    }
  }

  bool validatePassword() {
    if (password.length < 2) {
      passwordError = 'Senha inválida: deve ter pelo menos 2 caracteres.';
      return false;
    } else {
      passwordError = null;
      return true;
    }
  }

  bool validateLogin() {
    return validateUsername();
  }

  bool validateUserPassword() {
    return validatePassword();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}
