import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:todolist/models/todo_model.dart';
import 'package:todolist/pages/todolist.dart';

import 'controllers/todo_controller.dart';

class ContentRoot extends StatefulWidget {
  const ContentRoot({Key? key}) : super(key: key);

  @override
  _ContentRootState createState() => _ContentRootState();
}

class _ContentRootState extends State<ContentRoot> {
  final TextEditingController _controller = TextEditingController();

  int _index = 0;
  bool _isModalShow = false;

  void _changeIndex(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {

        // 해당 페이지에서만 키보드를 제어하기 위해 _isModalShow를 넣음.
        if(!isKeyboardVisible && _isModalShow) {
          _isModalShow = false;
          Get.back();
        }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: _body(),
          floatingActionButton: _floatingButton(context),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: _bottomAppBar(),
        );
      },
    );
  }

  /*
  * 바디
  * */
  IndexedStack _body() {
    return IndexedStack(
      index: _index,
      children: [
        const ToDoListPage(),
        Container(
          alignment: Alignment.center,
          child: const Text('2'),
        ),
      ],
    );
  }

  /*
  * bottom app bar
  * */
  BottomAppBar _bottomAppBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                _changeIndex(0);
              },
              icon: const Icon(Icons.home)),
          IconButton(
              onPressed: () {
                _changeIndex(1);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
    );
  }

  /*
  * floating action button
  * */
  FloatingActionButton _floatingButton(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        _isModalShow = true;
        showModalBottomSheet(
            backgroundColor: Colors.black.withOpacity(0.5),
            isScrollControlled: true,
            context: context,
            isDismissible: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
            ),
            builder: (context) => _modal(context));
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
    );
  }

  /*
  * todolist modal
  * */
  Widget _modal(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: TextFormField(
          autofocus: true,
          controller: _controller,
          onEditingComplete: () {
            if(_controller.text != ''){
              ToDoController.to.addToDoList(ToDo(todo: _controller.text, flag: false));
              _controller.text = '';
            }
          },
          style: const TextStyle(
            color: Colors.white
          ),
          decoration: const InputDecoration(
            hintStyle: TextStyle(color: Colors.white),
            hintText: "예) 우주미남도원", border: InputBorder.none),
        ),
      ),
    );
  }
}
