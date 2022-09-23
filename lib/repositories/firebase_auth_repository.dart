import 'package:cantwait28/data/remote_data_sources/user_remote_data_source.dart';
import 'package:cantwait28/models/user_model.dart';
import 'package:cantwait28/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRespository implements AuthProvider {
  FirebaseAuth getInstance = FirebaseAuth.instance;
  FirebaseAuthRespository(this._userRemoteDataSource);
  final UserRemoteDataSource _userRemoteDataSource;

  @override
  UserModel? get currentUser {
    final user = _userRemoteDataSource.currentUser();
    if (user != null) {
      return UserModel.fromFirebase(user);
    } else {
      return null;
    }
  }
}
