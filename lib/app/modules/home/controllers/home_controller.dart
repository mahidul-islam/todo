import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/modules/home/model/todo_model.dart';
import 'package:todo/app/modules/home/model/todo_models.dart';
import 'package:todo/app/service/error/error_notification.dart';
import 'package:todo/app/service/storage/storage_box.dart';
import 'package:todo/app/shared_widget/button/bar_button.dart';
import 'package:todo/app/shared_widget/text_field/general_text_field.dart';
import 'package:todo/app/service/modal/modal_util.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Rx<TodoModels?> todoModels = TodoModels().obs;

  @override
  void onInit() async {
    todoModels.value = StorageBox.to.todoModels;
    super.onInit();
  }

  void save() {
    StorageBox.to.setTodos(todos: todoModels.value);
  }

  void addTask() {
    ModalUtil.to.showbasicModal(contents: [
      const Text(
        'Add a new TODO',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      const SizedBox(
        height: 16,
      ),
      TextFieldWidget.oneLine(
        controller: titleController,
        labelText: 'Title',
        padding: EdgeInsets.zero,
      ),
      const SizedBox(
        height: 16,
      ),
      TextFieldWidget.multiline(
        controller: descriptionController,
        labelText: 'Description',
        maxLength: 500,
        lineCount: 5,
        padding: EdgeInsets.zero,
      ),
      const SizedBox(
        height: 16,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BarButton.secondary(
            onPressed: () {
              Get.back(closeOverlays: true);
            },
            title: 'Cancel',
          ),
          const SizedBox(
            width: 16,
          ),
          BarButton.primary(
            onPressed: () {
              if (titleController.text == '' ||
                  descriptionController.text == '') {
                ErrorNotification.to
                    .show(error: 'Title and Description is required');
                return;
              }
              List<TodoModel>? todos = todoModels.value?.todos?.toList();
              todos ??= [];
              todos.add(
                TodoModel(
                  title: titleController.text,
                  description: descriptionController.text,
                  date: DateTime.now(),
                ),
              );
              titleController.text = '';
              descriptionController.text = '';
              todoModels.value = todoModels.value?.copyWith(todos: todos);
              save();
              // todoModels.value =
              //     todoModels.value.copyWith(update: !todoModels.value.update);
              Get.back(closeOverlays: true);
            },
            title: 'Create',
          ),
        ],
      )
    ]);
  }
}
