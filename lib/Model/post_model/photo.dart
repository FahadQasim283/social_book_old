class Photo {
	String? title;
	int? user;
	int? id;
	String? description;
	String? url;

	Photo({this.title, this.user, this.id, this.description, this.url});

	factory Photo.fromJson(Map<String, dynamic> json) => Photo(
				title: json['title'] as String?,
				user: json['user'] as int?,
				id: json['id'] as int?,
				description: json['description'] as String?,
				url: json['url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'title': title,
				'user': user,
				'id': id,
				'description': description,
				'url': url,
			};
}
