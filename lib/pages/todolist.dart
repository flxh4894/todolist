import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/components/todo.dart';
import 'package:todolist/controllers/todo_controller.dart';

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
          () => ListView.builder(
            itemCount: ToDoController.to.todolist.length,
            itemBuilder: (context, index) {
              final todo = ToDoController.to.todolist[index];
              return ToDoComponent(todo: todo.todo, flag: todo.flag, index: index,);
            },
          ),
        )
      ),
    );
  }
}
