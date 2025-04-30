import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Để sử dụng PlatformDispatcher

class HskDarkModeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  HskDarkModeProvider() {
    // Khởi tạo biến isDarkMode theo cài đặt hệ thống
    _isDarkMode = PlatformDispatcher.instance.platformBrightness == Brightness.dark;
  }

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners(); // Thông báo cho các widget lắng nghe sự thay đổi
  }
}
