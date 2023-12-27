import 'dart:convert';

class LearnerChatModel {
  var name;
  var msg;
  var img;
  var isOnline;

  LearnerChatModel({
    required this.name,
    required this.msg,
    required this.img,
    required this.isOnline,
  });

  factory LearnerChatModel.fromMap(Map<String, dynamic> map) {
    return LearnerChatModel(
      name: map['name'],
      msg: map['msg'],
      img: map['img'],
      isOnline: map['isOnline'],
    );
  }

  factory LearnerChatModel.fromJson(String source) =>
      LearnerChatModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'msg': msg,
      'img': img,
      'isOnline': isOnline,
    };
  }

  String toJson() => json.encode(toMap());
}
