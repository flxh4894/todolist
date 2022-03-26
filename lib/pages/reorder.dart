import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  List<int> _list = List.generate(50, (index) => index+1);

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      shrinkWrap: false,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            key: Key('$index'),
            child: Text('#${_list[index]}'),
          );
        },
        itemCount: _list.length,
        onReorder: (int oldIndex, int newIndex){
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = _list.removeAt(oldIndex);
            _list.insert(newIndex, item);
          });
        },
    );
  }
}
