import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/shared_widget/text_field/general_text_field.dart';
import 'package:todo/app/utils/modal_util.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
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
    ]);
  }
}
