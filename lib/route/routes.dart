import 'package:flutter/cupertino.dart';
import 'package:flutter_starter/pages/home.dart';
import 'package:flutter_starter/pages/login.dart';

Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(),
  "/login": (context) => const LoginPage(),
};
