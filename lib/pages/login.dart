import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_starter/provider/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void login() {
    context.read<AuthProvider>().setToken("123456");
    Fluttertoast.showToast(msg: "登录成功", gravity: ToastGravity.CENTER);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('登录'),
          onPressed: login,
        ),
      ),
    );
  }
}
