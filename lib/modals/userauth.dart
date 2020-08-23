import 'package:firebase_auth/firebase_auth.dart';

class UserAuth {
  String id;

  UserAuth.fromFirebase(FirebaseUser user){
    id = user.uid;
  }
}