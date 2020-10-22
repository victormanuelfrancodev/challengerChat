import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        body: FutureBuilder(
          future: checkLoginState(context),
          builder: (context, snapshot){
            return Center(
              child: Container(
                child: Text("loading..."),
              ),
            );
          },
        ),
      ),
    );
  }

  Future checkLoginState(BuildContext context) async{
    final authService = Provider.of<AuthService>(context,listen:false);
    final authenticate = await authService.isLoggedIn();
  }
}