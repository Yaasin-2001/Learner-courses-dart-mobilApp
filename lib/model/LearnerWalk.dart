import 'dart:convert';

class LearnerWalk {
  var img;

  LearnerWalk({
    required this.img,
  });

  factory LearnerWalk.fromMap(Map<String, dynamic> map) {
    return LearnerWalk(
      img: map['img'],
    );
  }

  factory LearnerWalk.fromJson(String source) =>
      LearnerWalk.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'img': img,
    };
  }

  String toJson() => json.encode(toMap());
}
