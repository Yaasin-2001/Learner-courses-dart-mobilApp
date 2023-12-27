import 'dart:convert';

class LearnerFeaturedModel {
  var img;
  var name;
  var price;
  var strikePrice;
  var type;

  LearnerFeaturedModel({
    required this.img,
    required this.name,
    required this.price,
    required this.strikePrice,
    required this.type,
  });

  factory LearnerFeaturedModel.fromMap(Map<String, dynamic> map) {
    return LearnerFeaturedModel(
      img: map['img'],
      name: map['name'],
      price: map['price'],
      strikePrice: map['strikePrice'],
      type: map['type'],
    );
  }

  factory LearnerFeaturedModel.fromJson(String source) =>
      LearnerFeaturedModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'img': img,
      'name': name,
      'price': price,
      'strikePrice': strikePrice,
      'type': type,
    };
  }

  String toJson() => json.encode(toMap());
}
