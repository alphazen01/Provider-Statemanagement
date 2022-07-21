import 'dart:convert';

import 'package:demo/demo/api_services/products_services.dart';
import 'package:demo/demo_map/model/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum DataState{initital,loading,loaded,empty,error}

class ProductsController extends ChangeNotifier {
  DataState productDataState=DataState.initital;
  ApiServices apiServices = ApiServices();
  ProductsrModel productsrModel = ProductsrModel();

  Future<ProductsrModel> productsData(context) async {
    productDataState=DataState.loading;
    notifyListeners();
    try {
      final response = await http.get(Uri.parse(
          "https://mocki.io/v1/02e91d9f-4d8c-4eb4-a4f9-bb4a60ffdaf9"));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        productsrModel = ProductsrModel.fromJson(data);
        print(productsrModel.total);
        productDataState=DataState.loaded;
      } else {
        productDataState=DataState.error;
        print("Something went wrong");
      }
    } catch (e) {
      print(e.toString());
    }
 notifyListeners();
    return productsrModel;
  
  }
}
