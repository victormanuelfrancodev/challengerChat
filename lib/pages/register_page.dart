import 'package:chat/widgets/login/logo_login_page.dart';
import 'package:chat/widgets/login/form_login_page.dart';
import 'package:chat/widgets/login/label_login_page.dart';
import 'package:chat/widgets/register/form_register_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
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
                      LogoLoginPage(title: 'Register',),
                      FormRegisterPage(),
                      LabelLoginPage(title:'have account?', subTitle: 'Use my new User',path: 'login'),
                      Text("Terms and conditions",style: TextStyle(fontWeight: FontWeight.w100),)
                    ],
                  ),
                )
            )
        )
    );
  }
}