import 'dart:convert';
import 'package:http/http.dart';
import 'package:social_book/Model/user_model/user_model.dart';

class UserModelData {
  Future<UserModel> getUserData() async {
    Response response = await get(Uri.parse('https://dummyjson.com/users'));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return UserModel.fromJson(data);
    } else {
      return UserModel.fromJson(data);
    }
  }
}
