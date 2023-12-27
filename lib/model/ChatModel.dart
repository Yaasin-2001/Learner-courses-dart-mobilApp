import 'dart:convert';

class ChatModel {
  var id;
  var message;

  ChatModel({
    required this.id,
    required this.message,
  });

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'],
      message: map['message'],
    );
  }

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
    };
  }

  String toJson() => json.encode(toMap());
}
