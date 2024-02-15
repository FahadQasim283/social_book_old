import 'user.dart';

class UserModel {
	List<User>? users;
	int? total;
	int? skip;
	int? limit;

	UserModel({this.users, this.total, this.skip, this.limit});

	factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
				users: (json['users'] as List<dynamic>?)
						?.map((e) => User.fromJson(e as Map<String, dynamic>))
						.toList(),
				total: json['total'] as int?,
				skip: json['skip'] as int?,
				limit: json['limit'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'users': users?.map((e) => e.toJson()).toList(),
				'total': total,
				'skip': skip,
				'limit': limit,
			};
}
