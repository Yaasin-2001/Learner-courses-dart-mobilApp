import 'dart:convert';

class LearnerContantModel {
  var name;
  var subtitle;
  var type;

  LearnerContantModel({
    required this.name,
    required this.subtitle,
    required this.type,
  });

  factory LearnerContantModel.fromMap(Map<String, dynamic> map) {
    return LearnerContantModel(
      name: map['name'],
      subtitle: map['subtitle'],
      type: map['type'],
    );
  }

  factory LearnerContantModel.fromJson(String source) =>
      LearnerContantModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'subtitle': subtitle,
      'type': type,
    };
  }

  String toJson() => json.encode(toMap());
}
