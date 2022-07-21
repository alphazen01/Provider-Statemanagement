

import 'package:demo/check/model/req_model.dart';
import 'package:demo/demo/api_services/products_services.dart';
import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier {
 ReqModel? post;
 bool loading = false;
 getPostData ()async{

loading=true;
post= await getPostData();
loading = false;
notifyListeners();



 }






}