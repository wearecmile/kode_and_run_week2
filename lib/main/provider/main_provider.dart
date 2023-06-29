import 'package:flutter/material.dart';

import '../model/main_model.dart';
import '../service/main_services.dart';

class MainProvider extends ChangeNotifier {
  final _service = MainService(); //its the instance of api definition class
  bool isLoading = false;
  List<Todo> todos = []; //_todos
  //List<Todo> get todos => _todos; //using Encapsulation

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    todos = response; //_todos
    isLoading = false;
    notifyListeners();
  }
}
