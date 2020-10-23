import 'dart:io';

import 'package:chat/models/messages_list_response.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/services/chat_service.dart';
import 'package:chat/services/socket_service.dart';
import 'package:chat/widgets/customs/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin{
  ChatService chatService;
  SocketService socketService;
  AuthService authService;
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  List<ChatMessage> _messages = [];
  //when curstomer write in textbox
  bool _imWriting = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.chatService =  Provider.of<ChatService>(context,listen: false);
    this.socketService = Provider.of<SocketService>(context,listen: false);
    this.authService = Provider.of<AuthService>(context,listen: false);
    this.socketService.socket.on('message-personal', _listenMessageController);
    _loadHistory(this.chatService.userFor.uid);
  }

  void _loadHistory(String userID) async{
    List<Message> chat = await this.chatService.getChat(userID);
    final history = chat.map((m) => new ChatMessage(text: m.message, uid: m.from, animationController: AnimationController(
        vsync: this, duration: Duration(milliseconds: 0))..forward()));
    setState(() {
      _messages.insertAll(0, history);
    });

  }

  void _listenMessageController(dynamic payload){
    ChatMessage message = new ChatMessage(text: payload['message'], uid: payload['from'], animationController: AnimationController(
      vsync: this, duration: Duration(milliseconds: 300)
    ));

    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {

    final userFor = chatService.userFor;

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
              Text(userFor.name, style: TextStyle(color: Colors.black26,fontSize: 19),)
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
                    itemCount: _messages.length,
                    itemBuilder: (_,i) => _messages[i],
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
                  onChanged: (textInBox){
                    setState(() {
                      if(textInBox.trim().length > 0){
                        _imWriting = true;
                      }else{
                        _imWriting = false;
                      }
                    });
                  },
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
                onPressed: _imWriting ? () => _handleSubmit(_textController.text.trim()):null,
              ):
           Container(
             margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: IconTheme(
              data: IconThemeData(color: Colors.blue),
              child: IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: Icon(Icons.send,color: Colors.blue,),
                onPressed: _imWriting ? () => _handleSubmit(_textController.text.trim()):null,
              ),
            )
           ),
            )
          ],
        )
      ),
    );
  }

  _handleSubmit(String text){
    //No accept empty message
    if (text.length == 0) return;

    _textController.clear();
    _focusNode.requestFocus();

    //Animation message
    final newMessage = new ChatMessage(uid: authService.user.uid,text: text,animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 300)));
    _messages.insert(0, newMessage);
    //start animation
    newMessage.animationController.forward();
    //active button send message
    setState(() {
      _imWriting = false;
    });

    this.socketService.emit('message-personal',{
      'from':this.authService.user.uid,
      'to':this.chatService.userFor.uid,
      'message': text
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //Clean animations controllers
    for (ChatMessage message in _messages){
      message.animationController.dispose();
    }
    this.socketService.socket.off('message-personal');
    super.dispose();
  }
}