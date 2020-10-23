import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatMessage extends StatelessWidget {

  final String text;
  final String uid;
  final AnimationController animationController;

  const ChatMessage(
  {
    Key key,
  @required this.text,
    @required this.uid,
    @required this.animationController
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context,listen: false);

    return FadeTransition(opacity: animationController,
        child: SizeTransition(
          sizeFactor: CurvedAnimation(parent: animationController,curve: Curves.easeInSine),
          child: Container(
            child: this.uid == authService.user.uid?
            _myMessage() : _notMyMessage(),
          ),
        ),
    );
  }

  Widget _myMessage(){
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(bottom: 5,left: 55,right: 5),
        child: Text(this.text, style: TextStyle(color: Colors.white),),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }

  Widget _notMyMessage(){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(bottom: 5,left: 5,right: 55),
        child: Text(this.text, style: TextStyle(color: Colors.white),),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}
