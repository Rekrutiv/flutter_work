import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterwork/modals/userauth.dart';

class AuthService{
  final FirebaseAuth _fAuth = FirebaseAuth.instance;
  final CollectionReference _userDataCollection = Firestore.instance.collection("userData");

  Future<UserAuth> signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _fAuth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      var user =  UserAuth.fromFirebase(firebaseUser);
      return user;
    }catch(e){
      print(e);
      return null;

    }
  }

  Future<UserAuth> registerWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _fAuth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      var user = UserAuth.fromFirebase(firebaseUser);

      //var userData = UserData();
     // await _userDataCollection.document(user.id).setData(userData.toMap());

      return user;
    }catch(e){
      print(e);
      return null;
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
  }

  Stream<UserAuth> get currentUser {
    return _fAuth.onAuthStateChanged
        .map((FirebaseUser user) => user != null
        ? UserAuth.fromFirebase(user)
        : null);
  }
//  Stream<UserAuth> get email {
//    return _fAuth.onAuthStateChanged.map(_mapUserFromFirebase);
    Future<String> inputData() async {
      final FirebaseUser user = await FirebaseAuth.instance.currentUser();
      final String uid = user.uid.toString();
      return uid;
    }

  Stream<UserAuth> getCurrentUserWithData(UserAuth user){
    return _userDataCollection.document(user?.id).snapshots().map((snapshot)
    {
      if(snapshot?.data == null) return null;

      //var userData = UserData.fromJson(snapshot.documentID, snapshot.data);
     // user.setUserData(userData);
      return user;
    });
  }

}

