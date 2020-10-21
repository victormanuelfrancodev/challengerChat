import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {

  final String text;
  final Function onPressed;

  const ButtonBlue({
    Key key,
    @required this.text,
    @required this.onPressed
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  RaisedButton(
        elevation: 2,
        highlightElevation: 5,
        color: Colors.blue,
        shape: StadiumBorder(),
        onPressed: onPressed,
        child: Container(
          width: double.infinity,
          height: 55,
          child: Center(
            child: Text("Login", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w200),),
          ),
        )
    );
  }
}
