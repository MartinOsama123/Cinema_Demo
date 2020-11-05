import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class PeopleData with ChangeNotifier {
  int _numberOfPeople = 0;
  int get numberOfPeople => _numberOfPeople;
  set numberOfPeople(int num) {
    _numberOfPeople = num;
    notifyListeners();
  }
}
