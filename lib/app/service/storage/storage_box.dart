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
  TodoModels get todoModels => TodoModels.fromJson(
      jsonDecode(_box.read<String?>(StorageKeys.todoModels.name) ?? ''));
  void get clearTodos => _box.remove(StorageKeys.todoModels.name);
  void setTodos({required final TodoModels todos}) {
    _box.write(StorageKeys.todoModels.name, todos.toString());
  }
}
