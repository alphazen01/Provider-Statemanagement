import 'dart:convert';


import 'package:demo/check/model/req_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<ReqModel?> getPostData()async{
    ReqModel ? result;
    try {
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/2"));
      if (response.statusCode==200) {
        final item = json.decode(response.body);
        result = ReqModel.fromJson(item);
        
      } else {
        print("object");
      }
    } catch (e) {
      print(e);
    }
    return result;
  }
}