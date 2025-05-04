import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  List<Map<String, dynamic>> notifications = [];

  void addNotification(Map<String, dynamic> notification) {
    notifications.add(notification);
    notifyListeners();
  }

  void removeNotification(int index) {
    if (index >= 0 && index < notifications.length) {
      notifications.removeAt(index);
      notifyListeners();
    }
  }

  void clearNotifications() {
    notifications.clear();
    notifyListeners();
  }
}