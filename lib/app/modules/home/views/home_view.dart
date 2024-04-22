import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo/app/modules/home/widgets/todo_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.addTask();
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('TODO App'),
          centerTitle: true,
          backgroundColor: Colors.amberAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              for (int i = 0;
                  i < (controller.todoModels.value?.todos?.length ?? 0);
                  i++)
                TodoWidget(
                  controller: controller,
                  todoModel: controller.todoModels.value?.todos?[i],
                ),
            ],
          ),
        ),
      );
    });
  }
}
