import 'rating.dart';

class StoreModel {
  static List<StoreModel> favoriteList = [];

	int? id;
	String? title;
	double? price;
	String? description;
	String? category;
	String? image;
	Rating? rating;

	StoreModel({
		this.id, 
		this.title, 
		this.price,
		this.description, 
		this.category, 
		this.image, 
		this.rating,
	});

	factory StoreModel.fromJson(Map<dynamic, dynamic> json) => StoreModel(
				id: json['id'] as int?,
				title: json['title'] as String?,
				price: (json['price'] as num?)?.toDouble(),
				description: json['description'] as String?,
				category: json['category'] as String?,
				image: json['image'] as String?,
				rating: json['rating'] == null
						? null
						: Rating.fromJson(json['rating'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => 
  {
				'id': id,
				'title': title,
				'price': price,
				'description': description,
				'category': category,
				'image': image,
				'rating': rating?.toJson(),
			};
}
