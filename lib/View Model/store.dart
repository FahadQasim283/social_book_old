import 'dart:convert';
import 'package:http/http.dart';
import 'package:social_book/Model/store_model/store_model.dart';

class StoreModelData 
{
  List<StoreModel> store = [];
  
  Future<List<StoreModel>> getData() async {
    Response response =
        await get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      for (Map m in data) {
        store.add(StoreModel.fromJson(m));
      }
      return store;
    } else 
    {
      return store;
    }
  }
}
