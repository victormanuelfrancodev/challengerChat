import 'package:flutter/material.dart';

class LogoLoginPage extends StatelessWidget {
  final String title;

  LogoLoginPage({
    Key key, @required this.title
}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children:
            <Widget>[
              Image(image: AssetImage('assets/messageicon.png'),width: 170,height: 50,),
              SizedBox(height: 20),
              Text(this.title,style: TextStyle(fontSize: 28)),
            ],
        ),
      ),
    );
  }
}
