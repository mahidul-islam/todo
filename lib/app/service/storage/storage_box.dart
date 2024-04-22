import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/app/modules/home/model/todo_models.dart';

enum StorageKeys {
  todoModels,
}

class StorageBox extends GetxService {
  static StorageBox get to => Get.find();
  final GetStorage _box = GetStorage()..initStorage;

  // todo's
  TodoModels? get todoModels {
    String? data = _box.read(StorageKeys.todoModels.name) ?? '{}';
    // print(data);
    return TodoModels.fromJson(jsonDecode(data));
  }

  void get clearTodos => _box.remove(StorageKeys.todoModels.name);
  void setTodos({required final TodoModels? todos}) async {
    _box.write(StorageKeys.todoModels.name, jsonEncode(todos?.toJson()));
    _box.save();
    // print(_box.read(StorageKeys.todoModels.name));
  }
}
