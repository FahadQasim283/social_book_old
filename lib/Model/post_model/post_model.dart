import 'photo.dart';

class PostModel {
	bool? success;
	String? message;
	int? offset;
	int? limit;
	List<Photo>? photos;

	PostModel({
		this.success, 
		this.message, 
		this.offset, 
		this.limit, 
		this.photos, 
	});

	factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
				success: json['success'] as bool?,
				message: json['message'] as String?,
				offset: json['offset'] as int?,
				limit: json['limit'] as int?,
				photos: (json['photos'] as List<dynamic>?)
						?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'success': success,
				'message': message,
				'offset': offset,
				'limit': limit,
				'photos': photos?.map((e) => e.toJson()).toList(),
			};
}
