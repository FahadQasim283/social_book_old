import 'dart:convert';
import 'package:http/http.dart';

import '../Model/ProductModel/product_model.dart';

class ProductModelLatestData 
{

  Future<ProductModel> getProduct() async {
    try 
    { 
      Response response =
          await get(Uri.parse('https://dummyjson.com/products'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        return ProductModel.fromJson(data);
      } else 
      {
        return ProductModel.fromJson(
            jsonDecode(response.body.toString()));
      }
    } catch (e) 
    {
      return ProductModel();
    }
  }

  
}
