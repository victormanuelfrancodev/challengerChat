import 'package:chat/models/user.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}


class _UsersPageState extends State<UsersPage> {

  final users = [
    User(uid: '1',name: 'Maria',email: 'test@gmail.com',online: true),
    User(uid: '2',name: 'Victor',email: 'test1@gmail.com',online: false),
    User(uid: '3',name: 'Baron',email: 'test2@gmail.com',online: true),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mi nombre", style: TextStyle(color: Colors.black54),),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.black54,),
            onPressed: (){ print("hola"); },
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(Icons.check_circle, color: Colors.blue),
            )
          ],
        ),
        body: ListView.separated(
            itemBuilder: (_, i) => _userListTile(users[i]),
            separatorBuilder: (_,i) => Divider(),
            itemCount: users.length)
      ),
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
            color: users[i].online ? Colors.green: Colors.red,
            borderRadius: BorderRadius.circular(100)
        ),
      ),
    );
  }
}

