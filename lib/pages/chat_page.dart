import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
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
              )
            ],
          ),
        )
      ),
    );
  }
}