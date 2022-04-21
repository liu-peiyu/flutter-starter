import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_starter/provider/counter_provider.dart';
import 'package:flutter_starter/provider/auth_provider.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  State<AccountWidget> createState() => AccountWidgetState();
}

class AccountWidgetState extends State<AccountWidget> {
  @override
  void initState() {
    super.initState();
    debugPrint("initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("didChangeDependencies");
  }

  @override
  void didUpdateWidget(AccountWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Token：',
                style: TextStyle(fontSize: 20),
              ),
              //
              Text(
                Provider.of<AuthProvider>(context).getToken,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text('add'),
            onPressed: () {
              context.read<CounterProvider>().increase();
            },
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.login),
            label: const Text('login'),
            onPressed: () {
              Navigator.of(context).pushNamed('/login');
            },
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.logout),
            label: const Text('logout'),
            onPressed: () {
              context.read<AuthProvider>().logout();
            },
          ),
        ],
      ),
    );
  }
}
