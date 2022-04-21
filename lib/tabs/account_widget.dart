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
  String _token = "";

  @override
  void initState() {
    super.initState();
    _token = context.read<AuthProvider>().getToken;
    debugPrint(_token);
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
              Text(
                context.read<AuthProvider>().getToken,
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
        ],
      ),
    );
  }
}
