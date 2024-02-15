import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_book/Model/quotes_model/quotes_model.dart';

class QuotesModelData {
  QuotesModel? modelData;
  Future<QuotesModel> getData() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/quotes'));
    dynamic data;
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      modelData = QuotesModel.fromJson(data);
      return modelData!;
    }
    modelData = QuotesModel.fromJson(data);
    return modelData!;
  }
}
