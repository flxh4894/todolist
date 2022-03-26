import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/models/todo_model.dart';

/*
* ToDoList Controller
* Service
* */
class ToDoController extends GetxService {
  static ToDoController get to => Get.find<ToDoController>();
  late Box todoBox;

  RxList<ToDo> todolist = <ToDo>[].obs;
  RxList<ToDo> todolistFalse = <ToDo>[].obs;

  @override
  void onInit() async {
    todoBox = await Hive.openBox("todolist");
    _getTodolistFromHive();

    super.onInit();
  }

  /*
  * 초기화시 데이터베이스 불러오기
  * */
  _getTodolistFromHive() {
    for(int i=0; i<todoBox.length; i++){
      final ToDo todo = ToDo.fromJson(todoBox.get(i));
      todo.index = todoBox.keyAt(i);

      if(!todo.flag) {
        todolist.add( todo );
      } else {
        todolistFalse.add( todo );
      }
    }
    todolist.assignAll(List.from(todolist.reversed));
    todolistFalse.assignAll(List.from(todolistFalse.reversed));
  }

  /*
  * 상태 변경
  * */
  void changeToDoFlag(int index, bool flag) {

    ToDo oldTodo;
    if(flag) {
      oldTodo = todolist[index];
    } else {
      oldTodo = todolistFalse[index];
    }

    final newTodo = ToDo(todo: oldTodo.todo, flag: !oldTodo.flag, index: oldTodo.index);

    if(newTodo.flag) {
      todolist.removeAt(index);
      todolistFalse.add(newTodo);
      todolistFalse.sort((a,b) => b.index!.compareTo(a.index!));
    } else {
      todolistFalse.removeAt(index);
      todolist.add(newTodo);
      todolist.sort((a,b) => b.index!.compareTo(a.index!));
    }

    todoBox.put(newTodo.index, newTodo.toJson());
  }


  /*
  * ToDoList 추가
  * */
  addToDoList(ToDo todo) {
    // 추가 로직 실행
    todoBox.add(todo.toJson());

    todo.index =todoBox.keys.last;
    todolist.insert(0, todo);
  }
}