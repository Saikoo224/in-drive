import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  String name = 'أحمد محمد';
  String email = 'ahmed@email.com';
  String number = '01020304050';

  void updateProfile(String newName, String newEmail, String newNumber) {
    name = newName;
    email = newEmail;
    number = newNumber;
    notifyListeners();
  }
}