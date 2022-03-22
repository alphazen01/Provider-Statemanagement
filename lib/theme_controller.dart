import 'package:flutter/material.dart';
class ThemeController extends ChangeNotifier{

bool isDark= false;




void setDarkTheme(){
  isDark=true;
  notifyListeners();
}
void setLightTheme(){
  isDark=false;
  notifyListeners();
}







}