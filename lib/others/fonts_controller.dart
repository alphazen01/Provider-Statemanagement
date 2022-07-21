import 'package:flutter/cupertino.dart';

class FontsController extends ChangeNotifier{


bool isTap=false;

void setLob(){
  isTap=true;
  notifyListeners();
}


void setEdu(){
  isTap=false;
  notifyListeners();
}



}