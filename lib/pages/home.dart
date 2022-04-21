import 'package:flutter/material.dart';

import '../tabs/tabs.dart';
import '../tabs/home_widget.dart';
import '../tabs/account_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;

  final List<String> _title = <String>['首页', '我的'];

  final List<Widget> _widgets = [
    const HomeWidget(),
    const AccountWidget(),
  ];

  void setIndex(int index) {
    setState(() {
      tabIndex = index;
      debugPrint('$index');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title[tabIndex]),
      ),
      body: _widgets[tabIndex],
      bottomNavigationBar: BottomTabs(index: tabIndex, callback: setIndex),
    );
  }
}
