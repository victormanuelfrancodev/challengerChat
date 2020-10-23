import 'dart:io';
import 'package:chat/global/enviroment.dart';
import 'package:chat/models/users_list_response.dart';
import 'package:chat/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:chat/models/user.dart';
import 'package:flutter/material.dart';

class UsersServices{
   Future<List<User>> getUsers() async{
      try{
         final resp = await http.get('${Enviroment.apiUrl}/users',
         headers: {
            'Content-Type':'application/json',
            'x-token': await AuthService.getToken()
         }
         );

         final usersResponse = usersListResponseFromJson(resp.body);
         return usersResponse.users;
      }catch(e){
         return [];
      }
   }
}