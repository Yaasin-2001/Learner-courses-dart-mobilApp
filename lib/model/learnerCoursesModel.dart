import 'dart:convert';

class LearnerCoursesModel {
  var name;
  var img;

  LearnerCoursesModel({
    required this.name,
    required this.img,
  });

  factory LearnerCoursesModel.fromMap(Map<String, dynamic> map) {
    return LearnerCoursesModel(
      name: map['name'],
      img: map['img'],
    );
  }

  factory LearnerCoursesModel.fromJson(String source) =>
      LearnerCoursesModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'img': img,
    };
  }

  String toJson() => json.encode(toMap());
}
