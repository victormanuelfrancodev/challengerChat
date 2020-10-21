import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat',
      home: Scaffold(
        appBar: AppBar(
          title: Text("hola"),
        ),
        body: Center(
          child: Container(
            child: Text("hello world"),
          ),
        ),
      ),
    );
  }
}