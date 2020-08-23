import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:provider/provider.dart';

class Userprovider with ChangeNotifier {
  String  user ='User1';

  String get getuser => user;

  setuser(String value) {
    user = value;
    notifyListeners();
  }
}