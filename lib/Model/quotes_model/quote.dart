class Quote {
	int? id;
	String? quote;
	String? author;

	Quote({this.id, this.quote, this.author});

	factory Quote.fromJson(Map<String, dynamic> json) => Quote(
				id: json['id'] as int?,
				quote: json['quote'] as String?,
				author: json['author'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'quote': quote,
				'author': author,
			};
}
