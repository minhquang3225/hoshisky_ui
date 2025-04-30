import 'package:flutter/material.dart';

class HskInputProvider with ChangeNotifier {
  static final HskInputProvider _instance = HskInputProvider._internal();
  Map<String, TextEditingController> controllers = {};
  int _counter = 0; // Đếm số lượng controller đã được tạo
  String _text = "";

  // Getter for the singleton instance
  factory HskInputProvider() {
    return _instance;
  }

  // Private constructor for singleton
  HskInputProvider._internal();

  int get counter => _counter;
  String get text => _text;

  // Hàm tạo key tự động và thêm controller
  void addController() {
    String key = 'input${_counter++}'; // Tạo key tự động và tăng counter
    controllers[key] = TextEditingController();
  }

  // Cập nhật giá trị văn bản cho controller tại key
  void updateController(String key, String value) {
    if (controllers.containsKey(key)) {
      controllers[key]?.value = controllers[key]!.value.copyWith(
            text: value,
            selection: TextSelection.collapsed(offset: value.length),
          );

      // Xoá Value của các controller khác
      controllers.forEach((otherKey, controller) {
        if (otherKey != key) {
          controller.value = controller.value.copyWith(text: "");
        }
      });
      _text = value;
      notifyListeners();
    }
  }

 // Create a controller and return its key
  String getKey() {
    addController(); // Create a new controller
    return 'input${_counter - 1}'; // Get the key of the newly created controller
  }

  @override
  void dispose() {
    controllers.forEach((key, controller) {
      controller.dispose();
    });
    super.dispose();
  }
}
