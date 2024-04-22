import 'package:flutter/material.dart';
import 'package:todo/app/modules/home/controllers/home_controller.dart';
import 'package:todo/app/modules/home/model/todo_model.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({
    super.key,
    required this.controller,
    required this.todoModel,
  });

  final HomeController controller;
  final TodoModel? todoModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black45,
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              color: Colors.greenAccent,
            ),
            padding: const EdgeInsets.all(16),
            child: Text(
              todoModel?.title ?? '',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black45,
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Text(
              todoModel?.description ?? '',
            ),
          )
        ],
      ),
    );
  }
}
