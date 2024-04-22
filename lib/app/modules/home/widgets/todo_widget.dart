import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
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
            padding: EdgeInsets.all(16),
            child: Text(
              'Title for the Todo',
              style: TextStyle(fontWeight: FontWeight.w600),
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
            padding: EdgeInsets.all(16),
            child: Text(
                'Description for the Todo, Description for the Todo Description for the Todo Description for the TodoDescription for the Todo '),
          )
        ],
      ),
    );
  }
}
