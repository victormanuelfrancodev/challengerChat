import 'package:chat/widgets/login/logo_login_page.dart';
import 'package:chat/widgets/login/form_login_page.dart';
import 'package:chat/widgets/login/label_login_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  <Widget>[
                  LogoLoginPage(title: 'Messenger',),
                  FormLoginPage(),
                  LabelLoginPage(title: 'Do you have account?',subTitle: 'Create new Account',path: 'register'),
                  Text("Terms and conditions",style: TextStyle(fontWeight: FontWeight.w100),)
                ],
              ),
            )
          )
        )
    );
  }
}