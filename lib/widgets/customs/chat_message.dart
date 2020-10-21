import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final String text;
  final String uid;

  const ChatMessage(
  {
    Key key,
    this.text,
    this.uid
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.uid == '123'?
      _myMessage() : _notMyMessage(),
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
