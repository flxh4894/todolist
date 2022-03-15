import 'package:flutter/material.dart';
import 'package:todolist/controllers/todo_controller.dart';

class ToDoComponent extends StatelessWidget {
  final int index;
  final String todo;
  final bool flag;

  const ToDoComponent({
    Key? key,
    required this.index,
    required this.todo,
    required this.flag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.all(Colors.red),
            value: flag,
            shape: const CircleBorder(),
            onChanged: (bool? value) {
              ToDoController.to.changeToDoFlag(index);
            },
          ),
          Expanded(
            child: Text(
              todo,
              maxLines: 5,
              style: TextStyle(
                decoration: flag ? TextDecoration.lineThrough : null
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
