import 'quote.dart';

class QuotesModel {
	List<Quote>? quotes;
	int? total;
	int? skip;
	int? limit;

	QuotesModel({this.quotes, this.total, this.skip, this.limit});

	factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(
				quotes: (json['quotes'] as List<dynamic>?)
						?.map((e) => Quote.fromJson(e as Map<String, dynamic>))
						.toList(),
				total: json['total'] as int?,
				skip: json['skip'] as int?,
				limit: json['limit'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'quotes': quotes?.map((e) => e.toJson()).toList(),
				'total': total,
				'skip': skip,
				'limit': limit,
			};
}
