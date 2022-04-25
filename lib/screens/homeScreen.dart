import 'package:finalfirechatapp/methods/methods.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: TextButton(
          onPressed: () {
            logOut(context);
          },
          child: Text("LogOut")),
    );
  }
}