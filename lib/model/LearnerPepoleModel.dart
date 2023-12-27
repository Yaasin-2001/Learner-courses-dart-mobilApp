import 'dart:convert';

class LearnerPeopleModel {
  var img;
  var name;
  var points;
  var isOnline;
  var subtitle;
  var email;
  var frd;

  LearnerPeopleModel({
    required this.img,
    required this.name,
    required this.points,
    required this.isOnline,
    required this.subtitle,
    required this.email,
    required this.frd,
  });

  factory LearnerPeopleModel.fromMap(Map<String, dynamic> map) {
    return LearnerPeopleModel(
      img: map['img'],
      name: map['name'],
      points: map['points'],
      isOnline: map['isOnline'],
      subtitle: map['subtitle'],
      email: map['email'],
      frd: map['frd'],
    );
  }

  factory LearnerPeopleModel.fromJson(String source) =>
      LearnerPeopleModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'img': img,
      'name': name,
      'points': points,
      'isOnline': isOnline,
      'subtitle': subtitle,
      'email': email,
      'frd': frd,
    };
  }

  String toJson() => json.encode(toMap());
}
