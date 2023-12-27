import 'dart:convert';

class StudentModel {
  var name;
  var school;
  var ogrNo;
  var rights;

  StudentModel({
    required this.name,
    required this.school,
    required this.ogrNo,
    required this.rights,
  });

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      name: map['name'],
      school: map['school'],
      ogrNo: map['OgrNo'],
      rights: map['rights'],
    );
  }

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'school': school,
      'OgrNo': ogrNo,
      'rights': rights,
    };
  }

  String toJson() => json.encode(toMap());
}
