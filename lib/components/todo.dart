import 'package:flutter/material.dart';

class ToDoComponent extends StatelessWidget {
  final String todo;
  final bool flag;

  const ToDoComponent({
    Key? key,
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
            fillColor: MaterialStateProperty.all(Colors.blue),
            value: true,
            shape: const CircleBorder(),
            onChanged: (bool? value) {},
          ),
          Expanded(
            child: Text(
              todo,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
