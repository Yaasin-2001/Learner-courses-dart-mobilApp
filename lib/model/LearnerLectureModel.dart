import 'dart:convert';

class LearnerLectureModel {
  var no;
  var title;
  var subtitle;
  var type;

  LearnerLectureModel({
    required this.no,
    required this.title,
    required this.subtitle,
    required this.type,
  });

  factory LearnerLectureModel.fromMap(Map<String, dynamic> map) {
    return LearnerLectureModel(
      no: map['no'],
      title: map['title'],
      subtitle: map['subtitle'],
      type: map['type'],
    );
  }

  factory LearnerLectureModel.fromJson(String source) =>
      LearnerLectureModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'no': no,
      'title': title,
      'subtitle': subtitle,
      'type': type,
    };
  }

  String toJson() => json.encode(toMap());
}
