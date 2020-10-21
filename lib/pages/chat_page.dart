import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Column(
            children: [
              CircleAvatar(
                child: Text('Te',style: TextStyle(fontSize:12 ),),
                backgroundColor: Colors.blueAccent,
                maxRadius: 14,
              ),
              SizedBox(height: 2),
              Text('Enoc bahena', style: TextStyle(color: Colors.black26,fontSize: 19),)
            ],
          ),
          centerTitle: true,
          elevation: 1,
        ),

        body: Container(
          child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (_,i) => Text('$i'),
                  reverse: true,),
              ),
              Divider(height: 1,),
              //Box of texto
              Container(
                color: Colors.white,
                height: 100,
                child: _inputChat(),
              )
            ],
          ),
        )
      ),
    );
  }

  Widget _inputChat(){
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
                child: TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmit,
                  onChanged: (String text){},
                  decoration: InputDecoration.collapsed(
                      hintText: "Send message"
                  ),
                  focusNode: _focusNode,
                )
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS ? CupertinoButton(
                child: Text("send"),
                onPressed: (){},
              ):
           Container(
             margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              icon: Icon(Icons.send,color: Colors.blue,),
              onPressed: (){},
            ),
           ),
            )
          ],
        )
      ),
    );
  }

  _handleSubmit(String text){
    print(text);
    _textController.clear();
    _focusNode.requestFocus();
  }
}