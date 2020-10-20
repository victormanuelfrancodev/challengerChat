import 'package:flutter/material.dart';

class LabelLoginPage extends StatelessWidget {

  final String path;
  final String title;
  final String subTitle;

  const LabelLoginPage({
    Key key, @required this.path, @required this.title,@required this.subTitle
}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(this.title, style: TextStyle(color: Colors.black54,fontSize: 15,fontWeight: FontWeight.w300),),
          SizedBox(height: 10,),
          GestureDetector(
            child: Text(this.subTitle , style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w100),),
            onTap: (){
              Navigator.pushReplacementNamed(context, this.path);
            },
          )
        ],
      ),
    );
  }
}
