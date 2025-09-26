import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;
  bool get isAuthenticated => _token != null;
  String? get token => _token;

  Future<bool> login(String email, String password) async {
    final response =
        await ApiService.post("login", {"email": email, "password": password});

    if (response.containsKey("token")) {
      _token = response["token"];
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> register(String name, String email, String password) async {
    final response = await ApiService.post("register",
        {"name": name, "email": email, "password": password});

    if (response.containsKey("token")) {
      _token = response["token"];
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _token = null;
    notifyListeners();
  }
}
