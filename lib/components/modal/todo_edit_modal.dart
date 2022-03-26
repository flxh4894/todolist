import 'package:flutter/material.dart';
import 'package:todolist/controllers/todo_controller.dart';

import '../../models/todo_model.dart';

class TodoEditModal extends StatefulWidget {
  const TodoEditModal({Key? key, required this.todo}) : super(key: key);
  final ToDo todo;

  @override
  State<TodoEditModal> createState() => _TodoEditModalState();
}

class _TodoEditModalState extends State<TodoEditModal> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool isEditMode = false;
  bool isFirst = true;
  double _h = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(isFirst){
      setState(() {
        _h = MediaQuery.of(context).size.height / 2;
        isFirst = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.todo.todo;
    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
          height: _h,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: _contentArea()),
    );
  }

  Widget _contentArea() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          if(isEditMode)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){
                setState(() {
                  _focusNode.unfocus();
                  isEditMode = false;
                });
              }, icon: const Icon(Icons.arrow_back), color: Colors.white,),
              const Text("작업편집", style: TextStyle(color: Colors.white, fontSize: 16),),
              IconButton(onPressed: (){}, icon: const Icon(Icons.send), color: Colors.white,)
            ],
          ),
          TextFormField(
            controller: _controller,
            focusNode: _focusNode,
            onEditingComplete: () {
              if (_controller.text != '') {
                ToDoController.to
                    .addToDoList(ToDo(todo: _controller.text, flag: false));
                _controller.text = '';
              }

              setState(() {
                isEditMode = false;
              });
            },
            onTap: () {
              setState(() {
                _focusNode.unfocus();
                isEditMode = true;
                _h = MediaQuery.of(context).size.height;
                _focusNode.requestFocus();
              });
            },
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(0),
                hintStyle: TextStyle(color: Colors.white),
                hintText: "제목",
                border: InputBorder.none),
          ),
          TextFormField(
            initialValue: widget.todo.desc,
            onEditingComplete: () {
              if (_controller.text != '') {
                ToDoController.to
                    .addToDoList(ToDo(todo: _controller.text, flag: false));
                _controller.text = '';
              }
            },
            style: const TextStyle(color: Colors.white, ),
            decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "설명",
                border: InputBorder.none),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
              IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
              IconButton(onPressed: () {}, icon: Icon(Icons.seven_k)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (widget.todo.hashTag != null)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey
                  ),
                  child: Text(
                    widget.todo.hashTag!,
                    style: TextStyle(color: Colors.white),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}
