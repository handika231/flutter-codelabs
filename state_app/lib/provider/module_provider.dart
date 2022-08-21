import 'package:flutter/material.dart';

class ModuleProvider extends ChangeNotifier {
  final List<String> _moduleList = [];
  List<String> get moduleList => _moduleList;

  void addModule(String module) {
    _moduleList.add(module);
    notifyListeners();
  }
}
