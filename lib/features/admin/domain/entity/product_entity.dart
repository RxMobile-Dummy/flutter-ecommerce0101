import 'package:amazon_clone/features/admin/domain/entity/rating_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? name;
  final String? description;
  final double? quantity;
  final List<String>? images;
  final String? category;
  final double? price;
  final String? id;
  final List<RatingEntity>? rating;

  const ProductEntity(
      {this.name,
      this.description,
      this.quantity,
      this.images,
      this.category,
      this.price,
      this.id,
      this.rating});

  @override
  List<Object?> get props => [name,description,quantity,images,category,price,id,rating];
}
