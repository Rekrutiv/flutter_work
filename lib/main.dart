import 'package:flutter/material.dart';
import 'package:flutterwork/modals/userauth.dart';
import 'package:flutterwork/screen/Login.dart';
import 'package:flutterwork/service/auth.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return   StreamProvider<UserAuth>.value(
      value: AuthService().currentUser,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginScreen(),

      ),
    );
  }
}


