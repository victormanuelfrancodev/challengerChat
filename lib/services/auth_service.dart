import 'dart:convert';
import 'package:chat/global/enviroment.dart';
import 'package:chat/models/login_response.dart';
import 'package:chat/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService with ChangeNotifier{

  User user;

  bool _authentication = false;

  bool get authentication => this._authentication;
  // Create storage
  final _storage = new FlutterSecureStorage();

  set authentication(bool val){
    this._authentication = val;
    notifyListeners();
  }

  //Get static token
  static Future<String> getToken() async{
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async{
    final _storage = new FlutterSecureStorage();
   await _storage.delete(key: 'token');
  }

  //User
  Future<bool> login(String email,String password) async{

    _authentication = true;

    final data = {
      'email': email,
      'password': password
    };
    
    final resp = await http.post('${ Enviroment.apiUrl}/login',
      body: jsonEncode(data),
      headers: {
       'Content-Type': 'application/json'
      }
    );
     print(resp.body);
    this._authentication = false;
    if(resp.statusCode == 200){
      final loginResponse = loginResponseFromJson(resp.body);
      this.user = loginResponse.user;
      await this._saveToken(loginResponse.token);
      return true;
    }else {
      return false;
    }
  }

  Future register(String name, String email,String password) async{
    _authentication = true;

    final data = {
      'name': name,
      'email': email,
      'password': password
    };

    final resp = await http.post('${ Enviroment.apiUrl}/login/new',
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json'
        }
    );
    print(resp.body);
    this._authentication = false;
    if(resp.statusCode == 200){
      final loginResponse = loginResponseFromJson(resp.body);
      this.user = loginResponse.user;
      await this._saveToken(loginResponse.token);
      return true;
    }else {
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }
  }

  Future<bool> isLoggedIn()async{

  }

  Future _saveToken(String token) async{
    await _storage.write(key: 'token', value: token);
  }

  Future _logOut() async{
    await _storage.delete(key: 'token');
  }
}