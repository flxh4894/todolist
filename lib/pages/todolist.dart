import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/components/todo.dart';
import 'package:todolist/controllers/todo_controller.dart';
import 'package:todolist/models/todo_model.dart';

class ToDoListPage extends StatelessWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Obx(
            () => SingleChildScrollView(
              child: Column(
                children: [
                  for(ToDo todo in ToDoController.to.todolist)...[
                    ToDoComponent(todo: todo.todo, flag: todo.flag, index: ToDoController.to.todolist.indexOf(todo),)
                  ],
                  for(ToDo todo in ToDoController.to.todolistFalse)...[
                    ToDoComponent(todo: todo.todo, flag: todo.flag, index: ToDoController.to.todolistFalse.indexOf(todo),)
                  ]
                ],
              ),
            )
        )
      ),
    );
  }
}
