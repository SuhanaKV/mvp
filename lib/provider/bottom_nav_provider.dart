import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  int index=0;
  bool calendarPressed=false;
  

  getIndex()=> index;
  getcalendarPressed()=> calendarPressed;
  
  void changeindex(int value) {
    index = value;
    notifyListeners();
  }
  void setCalendarPressed(bool value) {
    calendarPressed = value;
    notifyListeners();
  }
}