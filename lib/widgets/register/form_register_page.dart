import 'package:chat/helper/show_alert.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/widgets/customs/button_blue.dart';
import 'package:chat/widgets/customs/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormRegisterPage extends StatefulWidget {
  @override
  _FormRegisterPageState createState() => _FormRegisterPageState();
}

class _FormRegisterPageState extends State<FormRegisterPage> {

  final userCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.supervised_user_circle,
            placeholder: 'User',
            keyboardType: TextInputType.text,
            textController: userCtrl,
            isPassword: false,
          ),

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

          ButtonBlue(text: "Create account", onPressed: authService.authentication ? null: () async{
           final register = await authService.register(userCtrl.text.trim(), emailCtrl.text.trim(), passCtrl.text.trim());
           if (register == true){
             Navigator.pushReplacementNamed(context, 'users');
           }else{
             show_alert(context,'Register incorrect', register);
           }
          })
        ],
      ),
    );
  }
}
