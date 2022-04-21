import 'package:flutter/material.dart';
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

  String _token = "";

  Future<void> setToken(String value) async {
    bool flag = await _prefs.then((SharedPreferences prefs) {
      return prefs.setString(accessToken, value);
    });
    if (flag) {
      Provider.of<AuthProvider>(context, listen: false).setToken(value);
      // context.read<AuthProvider>().setToken(value);
      setState(() {
        _token = value;
      });
    }
  }

  Future<void> getToken() async {
    String token = await _prefs.then((SharedPreferences prefs) {
      return prefs.getString(accessToken) ?? "";
    });
    if (token.isNotEmpty) {
      context.read<AuthProvider>().setToken(token);
    }
    setState(() {
      _token = token;
    });
  }

  @override
  void initState() {
    super.initState();
    getToken();
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
            _token,
            style: const TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            child: const Text('写入数据'),
            onPressed: () => setToken(DateTime.now().toString()),
          ),
          ElevatedButton(
            child: const Text('读取数据'),
            onPressed: getToken,
          ),
          //测试多环境配置
          ElevatedButton(
            child: Text(Env.envConfig.appDomain),
            onPressed: getToken,
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
