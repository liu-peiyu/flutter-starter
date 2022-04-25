import 'package:flutter/material.dart';
import 'package:flutter_starter/provider/counter_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_starter/provider/auth_provider.dart';

import 'route/routes.dart';

import './config.dart';

import 'http/api.dart';



void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthProvider()),
    ChangeNotifierProvider(create: (context) => CounterProvider()),
  ], child: const StartApp()));
}

class StartApp extends StatefulWidget {
  const StartApp({Key? key}) : super(key: key);

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Env.envConfig.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: routes,
      // home: const HomePage()
    );
  }
}
