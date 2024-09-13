import 'package:flutter/foundation.dart';

class SettingsModel with ChangeNotifier {
  bool _notificationsEnabled = false;

  bool get notificationsEnabled => _notificationsEnabled;

  void toggleNotifications() {
    _notificationsEnabled = !_notificationsEnabled;
    notifyListeners();
  }
}
