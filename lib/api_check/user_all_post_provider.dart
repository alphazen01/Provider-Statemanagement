import 'dart:convert';

import 'package:demo/api_check/user_all_post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;



class UserAllPostProvider with ChangeNotifier {
  var userallpost;
  Future<void> userAllPost() async {
    // final url =
    //     Uri.parse('http://sgservice.realtimesolutionbd.com/api/user/post');
    final url =
        Uri.parse('https://dev.dd.limited/api/v1/vendors');
    final response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    //  developer.log(response.body);
    // print(responsebody['success']);
    // if (responsebody['success'] == true) {
    //   userallpost = UserAllPostModel.fromJson(jsonDecode(response.body));
    //   print("allpostuser");
    //   notifyListeners();
    // }

    //     final response = await http.post(
    //   url,
    //   body: json.encode(
    //     {
    //       'name': name,
    //       'email': email,
    //       'sponsor_id': sponsorId,
    //       'password': password,
    //     },
    //   ),
    //   headers: {
    //     'Content-Type': 'application/json',
    //     'Accept': 'application/json',
    //   },
    // );
  }
}
