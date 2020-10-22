import 'package:chat/helper/show_alert.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/services/socket_service.dart';
import 'package:chat/widgets/customs/button_blue.dart';
import 'package:chat/widgets/customs/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormLoginPage extends StatefulWidget {
  @override
  _FormLoginPageState createState() => _FormLoginPageState();
}

class _FormLoginPageState extends State<FormLoginPage> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);

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

          ButtonBlue(text: "Login", onPressed: authService.authentication ? null: () async {
            FocusScope.of(context).unfocus();
            final loginOk = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());

            if(loginOk){
              //connect to socket service
              socketService.connect();
              //Go to other screen
              Navigator.pushReplacementNamed(context, 'users');
            }else{
              //Alert
              show_alert(context, 'Incorrect Login', 'Maybe is your credentials');
            }

          })
        ],
      ),
    );
  }
}
