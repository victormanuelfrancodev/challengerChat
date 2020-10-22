import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/users_page.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/services/socket_service.dart';
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
    final socketService = Provider.of<SocketService>(context,listen: false);
    final authenticate = await authService.isLoggedIn();
    if(authenticate){
      socketService.connect();
      Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (_,__,___) => UsersPage(),transitionDuration: Duration(milliseconds: 100)));
    }else{
      Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (_,__,___) => LoginPage(),transitionDuration: Duration(milliseconds: 100)));

    }
  }
}