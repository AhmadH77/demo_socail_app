import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreateDialogProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _index = 0;

  int get index => _index;

  void change(value) {
    _index = value;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('index', index));
  }
}