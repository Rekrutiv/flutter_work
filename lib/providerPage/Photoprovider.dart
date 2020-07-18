import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:provider/provider.dart';

class Photoprovider with ChangeNotifier {
  String  photo ='https://homepages.cae.wisc.edu/~ece533/images/cat.png';

  String get getphoto => photo;

  setphoto(String value) {
    photo = value;
    notifyListeners();
  }
}