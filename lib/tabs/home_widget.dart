import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_starter/provider/auth_provider.dart';
import 'package:flutter_starter/provider/counter_provider.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../config.dart';

import '../constant.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String _currentTime = "";

  Future<void> setDateTime(String value) async {
    bool flag = await _prefs.then((SharedPreferences prefs) {
      return prefs.setString("dateTime", value);
    });
    if (flag) {
      Fluttertoast.showToast(msg: "设置成功");
    }
  }

  Future<void> getDateTime() async {
    String token = await _prefs.then((SharedPreferences prefs) {
      return prefs.getString("dateTime") ?? "";
    });
    if (token.isNotEmpty) {
      setState(() {
        _currentTime = token;
      });
      Fluttertoast.showToast(msg: "获取成功");
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
      child: Column(
        children: <Widget>[
          Text(
            _currentTime,
            style: const TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            child: const Text('写入数据'),
            onPressed: () => setDateTime(DateTime.now().toString()),
          ),
          ElevatedButton(
            child: const Text('读取数据'),
            onPressed: getDateTime,
          ),
          //测试多环境配置
          ElevatedButton(
            child: Text(Env.envConfig.appDomain),
            onPressed: null,
          ),
          // 测试Provider
          ElevatedButton(
            child:
                Text(Provider.of<CounterProvider>(context).getCount.toString()),
            onPressed: () {
              context.read<CounterProvider>().increase();
            },
          ),
        ],
      ),
    );
  }
}
