import 'package:flutter/material.dart';

class SettingController extends ChangeNotifier {
int _sizeCount=0;

int get sizeCounter => _sizeCount;
void increment(){
  _sizeCount++;
 notifyListeners(); 
}
void decrement(){
  _sizeCount--;
 notifyListeners(); 
}






}