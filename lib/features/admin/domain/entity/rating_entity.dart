import 'package:equatable/equatable.dart';

class RatingEntity extends Equatable{
  final String? userId;
  final double? rating;

  const RatingEntity({required this.userId, required this.rating});

  @override
  List<Object?> get props => [userId,rating];

}