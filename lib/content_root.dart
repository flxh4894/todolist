import 'package:flutter/material.dart';
import 'package:todolist/pages/todolist.dart';

class ContentRoot extends StatefulWidget {
  const ContentRoot({Key? key}) : super(key: key);

  @override
  _ContentRootState createState() => _ContentRootState();
}

class _ContentRootState extends State<ContentRoot> {

  int _index = 0;

  void _changeIndex(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          const ToDoListPage(),
          Container(
            alignment: Alignment.center,
            child: const Text('2'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){_changeIndex(0);}, icon: const Icon(Icons.home)),
            IconButton(onPressed: (){_changeIndex(1);}, icon: const Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
