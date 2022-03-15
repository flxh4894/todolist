import 'package:flutter/material.dart';
import 'package:todolist/components/todo.dart';

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
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => ToDoComponent(todo: "Hello world!", flag: false),
        )
      ),
    );
  }
}
