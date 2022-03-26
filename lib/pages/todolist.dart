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
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Obx(
            () => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for(ToDo todo in ToDoController.to.todolist)...[
                    ToDoComponent(todo: todo, index: ToDoController.to.todolist.indexOf(todo))
                  ],
                  for(ToDo todo in ToDoController.to.todolistFalse)...[
                    ToDoComponent(todo: todo, index: ToDoController.to.todolistFalse.indexOf(todo))
                  ]
                ],
              ),
            )
        )
      ),
    );
  }
}
