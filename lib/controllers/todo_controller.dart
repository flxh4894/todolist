import 'package:get/get.dart';
import 'package:todolist/models/todo_model.dart';

/*
* ToDoList Controller
* Service
* */
class ToDoController extends GetxService {
  static ToDoController get to => Get.find<ToDoController>();

  RxList<ToDo> todolist = <ToDo>[].obs;

  @override
  void onInit() {
    todolist.add(ToDo(todo: "안녕하세요?", flag: false));
    todolist.add(ToDo(todo: "내일은 수요일이에요", flag: true));
    todolist.add(ToDo(todo: "출근하기가 싫어요", flag: true));
    super.onInit();
  }

  /*
  * 상태 변경
  * */
  void changeToDoFlag(int index) {
    final todo = todolist[index];
    todolist[index] = ToDo(todo: todo.todo, flag: !todo.flag);
    todolist.refresh();
  }


  /*
  * ToDoList 추가
  * */
  addToDoList(ToDo todo) {
    // 추가 로직 실행
    todolist.insert(0, todo);
  }
}