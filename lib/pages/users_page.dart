import 'package:chat/models/user.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}


class _UsersPageState extends State<UsersPage> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  final users = [
    User(uid: '1',name: 'Maria',email: 'test@gmail.com',online: true),
    User(uid: '2',name: 'Victor',email: 'test1@gmail.com',online: false),
    User(uid: '3',name: 'Baron',email: 'test2@gmail.com',online: true),
  ];

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);
    final user = authService.user;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat',
      home: Scaffold(
        appBar: AppBar(
          title: Text(user.name, style: TextStyle(color: Colors.black54),),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.black54,),
            onPressed: (){
              socketService.disconnect();
              Navigator.pushReplacementNamed(context, 'login');
              AuthService.deleteToken();

            },
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(Icons.check_circle, color: Colors.blue),
            )
          ],
        ),
        body: SmartRefresher(
            controller: _refreshController,
          enablePullDown: true,
          onRefresh: _loadUsers,
          header: WaterDropHeader(
            complete: Icon(Icons.check_circle,color: Colors.blue,),
            waterDropColor: Colors.blue,
          ),
          child: _listViewUsers(),
        )),
    );
  }

  ListTile _userListTile(User user){
    return ListTile(
      title: Text(user.name),
      leading: CircleAvatar(
        child: Text(user.name.substring(0,2)),
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: user.online ? Colors.green: Colors.red,
            borderRadius: BorderRadius.circular(100)
        ),
      ),
    );
  }

  ListView _listViewUsers(){
    return ListView.separated(
        itemBuilder: (_, i) => _userListTile(users[i]),
        separatorBuilder: (_,i) => Divider(),
        itemCount: users.length);
  }

  //Load users refresh
  _loadUsers() async{
    await Future.delayed(Duration(milliseconds: 1000));
        _refreshController.refreshCompleted();
  }
}

