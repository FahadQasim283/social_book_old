import 'dart:convert';
import 'package:http/http.dart';
import 'package:social_book/Model/post_model/post_model.dart';

class PostModelData {
  PostModel? postModel;
  Future<PostModel> getPostData() async {
    Response response = await get(Uri.parse(
        'https://api.slingacademy.com/v1/sample-data/photos?offset=5&limit=30'));
    dynamic data;
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      postModel = PostModel.fromJson(data);
      return postModel!;
    }
    return postModel!;
  }
}
