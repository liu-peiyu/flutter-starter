import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: const SizedBox(
        width: 100,
        height: 100,
        child: Text('Hello World'),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routes = {
    '/': (context) => const MyHomePage(
          title: 'fsfdsdfsdf',
        ),
    '/test': (context) => const TestPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        //注册路由表
        routes: routes,
        initialRoute: "/");
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey),
              label: '首页',
              activeIcon: Icon(Icons.home, color: Colors.blue)),
          BottomNavigationBarItem(
              icon: Icon(Icons.balance, color: Colors.grey),
              label: '我的',
              activeIcon: Icon(Icons.balance, color: Colors.blue))
        ],
        onTap: (flag) {
          setState(() {
            _index = flag;
          });
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(title: title);
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String title;

  // 生成构造函数
  _MyHomePageState({required this.title});

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null,
            ),
            title: Text(title)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              // 创建一个按钮
              ElevatedButton(
                child: const Text('点击事件'),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => TestPage()));
                  _incrementCounter();
                },
              ),
              ElevatedButton(
                child: const Text('路由跳转'),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => TestPage()));
                  Navigator.pushNamed(context, "/test");
                },
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        endDrawer: Container(
          width: 200,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              SizedBox(
                height: 100,
              ),
              IconButton(
                icon: Icon(Icons.menu),
                tooltip: 'Navigation menu',
                onPressed: null,
              ),
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: null,
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNav());
  }
}
