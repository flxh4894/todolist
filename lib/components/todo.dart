import 'package:flutter/material.dart';
import 'package:todolist/components/modal/todo_edit_modal.dart';
import 'package:todolist/controllers/todo_controller.dart';
import 'package:todolist/models/todo_model.dart';

class ToDoComponent extends StatelessWidget {
  final int index;
  final ToDo todo;

  const ToDoComponent({
    Key? key,
    required this.todo,
    required this.index,
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
            value: todo.flag,
            shape: const CircleBorder(),
            onChanged: (bool? flag) {
              ToDoController.to.changeToDoFlag(index, flag!);
            },
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.todo,
                  maxLines: 5,
                  style: TextStyle(
                      color: todo.flag ? Colors.grey : Colors.black,
                      decoration: todo.flag ? TextDecoration.lineThrough : null
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                if(todo.desc != null)
                  Text(
                    todo.desc!,
                    style: TextStyle(
                        fontSize: 12,
                        color: todo.flag ? Colors.grey : Colors.black,
                        decoration: todo.flag ? TextDecoration.lineThrough : null
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                if(todo.hashTag != null)
                  Text(
                    "#${todo.hashTag!}",
                    style: TextStyle(
                        color: todo.flag ? Colors.grey : Colors.blue,
                        decoration: todo.flag ? TextDecoration.lineThrough : null
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          if(!todo.flag)
            IconButton(onPressed: (){
              _updateTodoDetail();
              _openModal(context, todo);
            }, icon: const Icon(Icons.notifications_outlined, color: Colors.red,))
        ],
      ),
    );
  }

  void _openModal(BuildContext context, ToDo todo) {
    showModalBottomSheet(
        backgroundColor: const Color(0xff353535),
        isScrollControlled: true,
        context: context,
        isDismissible: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0)),
        ),
        builder: (context) => TodoEditModal(todo: todo)
    );
  }

  void _updateTodoDetail() {
    final todo = ToDoController.to.todolist[index];
    final newTodo = ToDo(todo: todo.todo, flag: todo.flag, hashTag: "HI", desc: "우주미남도원", index: todo.index);

    ToDoController.to.todolist[index] = newTodo;
  }
}
