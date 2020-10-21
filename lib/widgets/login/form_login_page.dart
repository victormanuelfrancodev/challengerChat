import 'package:chat/widgets/customs/button_blue.dart';
import 'package:chat/widgets/customs/custom_input.dart';
import 'package:flutter/material.dart';

class FormLoginPage extends StatefulWidget {
  @override
  _FormLoginPageState createState() => _FormLoginPageState();
}

class _FormLoginPageState extends State<FormLoginPage> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.alternate_email_rounded,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
            isPassword: false,
          ),

          CustomInput(
            icon: Icons.vpn_key_outlined,
            placeholder: 'Password',
            keyboardType: TextInputType.visiblePassword,
            textController: passCtrl,
            isPassword: true,
          ),

          ButtonBlue(text: "Login", onPressed: (){
            print("hola");
          })
        ],
      ),
    );
  }
}
