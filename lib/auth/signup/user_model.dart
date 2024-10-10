import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String _firstName = '';
  String _lastName = '';

  // Getters
  String get firstName => _firstName;
  String get lastName => _lastName;

  // Setters
  void setFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  void setLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }
}
