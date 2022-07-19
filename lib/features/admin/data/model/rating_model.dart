import 'dart:convert';

import '../../domain/entity/rating_entity.dart';

class RatingModel extends RatingEntity {
  const RatingModel({
    required super.userId,
    required super.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'rating': rating,
    };
  }

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      userId: map['userId'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingModel.fromJson(String source) =>
      RatingModel.fromMap(json.decode(source));
}
