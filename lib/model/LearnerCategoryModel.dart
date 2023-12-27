import 'dart:convert';

class LearnerCategoryModel {
  var image;
  var name;

  LearnerCategoryModel({
    required this.image,
    required this.name,
  });

  factory LearnerCategoryModel.fromMap(Map<String, dynamic> map) {
    return LearnerCategoryModel(
      image: map['image'],
      name: map['name'],
    );
  }

  factory LearnerCategoryModel.fromJson(String source) =>
      LearnerCategoryModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());
}
