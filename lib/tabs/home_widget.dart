import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //宽度占满屏幕
      width: double.infinity,
      //高度占满屏幕
      height: double.infinity,
      //背景颜色  白色
      color: Colors.white,
      //居中
      alignment: Alignment.center,
      child: const Center(
        child: Text("首页占位符"),
      ),
    );
  }
}
