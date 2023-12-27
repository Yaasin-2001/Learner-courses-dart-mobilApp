import 'dart:convert';

class LearnerBadgeModel {
  var img;
  var name;
  var comment;
  var isLocked;

  LearnerBadgeModel({
    required this.img,
    required this.name,
    required this.comment,
    required this.isLocked,
  });

  factory LearnerBadgeModel.fromMap(Map<String, dynamic> map) {
    return LearnerBadgeModel(
      img: map['img'],
      name: map['name'],
      comment: map['comment'],
      isLocked: map['isLocked'],
    );
  }

  factory LearnerBadgeModel.fromJson(String source) =>
      LearnerBadgeModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'img': img,
      'name': name,
      'comment': comment,
      'isLocked': isLocked,
    };
  }

  String toJson() => json.encode(toMap());
}
