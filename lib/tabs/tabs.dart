import 'package:flutter/material.dart';

@immutable
class BottomTabs extends StatefulWidget {
  BottomTabs({Key? key, this.index = 0, this.callback}) : super(key: key);

  int index = 0;
  final callback;

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  void _changeTabs(int index) {
    setState(() {
      // widget.index = index;
      widget.callback(index);
    });
  }

  List<BottomNavigationBarItem> _getItem() {
    List<BottomNavigationBarItem> items = const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.people),
        label: 'my',
      ),
    ];
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.index,
      onTap: _changeTabs,
      items: _getItem(),
    );
  }
}
