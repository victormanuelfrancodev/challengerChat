// To parse this JSON data, do
//
//     final messageListResponse = messageListResponseFromJson(jsonString);

import 'dart:convert';

MessageListResponse messageListResponseFromJson(String str) => MessageListResponse.fromJson(json.decode(str));

String messageListResponseToJson(MessageListResponse data) => json.encode(data.toJson());

class MessageListResponse {
  MessageListResponse({
    this.ok,
    this.messages,
  });

  bool ok;
  List<Message> messages;

  factory MessageListResponse.fromJson(Map<String, dynamic> json) => MessageListResponse(
    ok: json["ok"],
    messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
  };
}

class Message {
  Message({
    this.id,
    this.from,
    this.to,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String from;
  String to;
  String message;
  DateTime createdAt;
  DateTime updatedAt;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["_id"],
    from: json["from"],
    to: json["to"],
    message: json["message"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "from": from,
    "to": to,
    "message": message,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
