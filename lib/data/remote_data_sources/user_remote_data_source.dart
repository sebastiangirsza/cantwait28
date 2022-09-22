import 'package:firebase_auth/firebase_auth.dart';

class UserRemoteDataSource {
  String? getUser({userID}) {
    return FirebaseAuth.instance.currentUser?.uid;
  }
}
