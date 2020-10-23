import 'package:chat/global/enviroment.dart';
import 'package:chat/models/messages_list_response.dart';
import 'package:chat/models/user.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ChatService with ChangeNotifier{
  User userFor;

  Future<List<Message>> getChat(String userId) async{
    final resp = await http.get('${ Enviroment.apiUrl}/messages/$userId',
    headers: {
      'Content-Type':'application/json',
      'x-token': await AuthService.getToken()
    });

    final messagesResp = messageListResponseFromJson(resp.body);
    return messagesResp.messages;
  }
}