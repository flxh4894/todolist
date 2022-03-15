import 'package:get/get.dart';
import 'package:todolist/controllers/todo_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ToDoController());
  }
}