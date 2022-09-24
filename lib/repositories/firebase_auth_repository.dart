import 'package:cantwait28/data/remote_data_sources/user_remote_data_source.dart';
import 'package:cantwait28/models/user_model.dart';

class FirebaseAuthRespository {
  FirebaseAuthRespository(this._userRemoteDataSource);
  final UserRemoteDataSource _userRemoteDataSource;

  Future<UserModel?> currentUser() async {
    final user = _userRemoteDataSource.currentUser();
    if (user != null) {
      return UserModel.fromFirebase(user);
    } else {
      return null;
    }
  }

  Stream<UserModel?> userModelStream() => _userRemoteDataSource
      .getInstance()
      .authStateChanges()
      .map((user) => (user != null) ? UserModel.fromFirebase(user) : null);
}
