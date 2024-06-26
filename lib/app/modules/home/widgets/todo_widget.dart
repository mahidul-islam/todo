import 'package:flutter/material.dart';
import 'package:todo/app/modules/home/controllers/home_controller.dart';
import 'package:todo/app/modules/home/model/todo_model.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({
    super.key,
    required this.controller,
    required this.todoModel,
    required this.index,
  });

  final HomeController controller;
  final TodoModel? todoModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        controller.updateTodo(todoModel, index);
      },
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
              color: (todoModel?.completed ?? false)
                  ? Colors.greenAccent
                  : Colors.redAccent,
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    todoModel?.title ?? '',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    controller.removeTodo(todoModel);
                  },
                  icon: Icon(
                    Icons.delete_outline,
                    color: (todoModel?.completed ?? false)
                        ? Colors.red
                        : Colors.black,
                    size: 16,
                  ),
                )
              ],
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
