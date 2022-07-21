import 'dart:convert';

import 'package:demo/demo_list/model/product_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum ListDataState{
  initial,loading,loaded,empty,error
}

class ProductListController extends ChangeNotifier{

ListDataState listDataState =ListDataState.initial;


List<ProductListModel> productListModel = <ProductListModel>[];

Future<List< ProductListModel>> productsListData(context) async {
    listDataState=ListDataState.loading;
    notifyListeners();
    try {
      final response = await http.get(Uri.parse(
          "https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        productListModel =  productListModelFromJson(response.body);
        
        listDataState=ListDataState.loaded;
      } else {
        listDataState=ListDataState.error;
        print("Something went wrong");
      }
    } catch (e) {
      print(e.toString());
    }
 notifyListeners();
    return productListModel;
  
  }
}





