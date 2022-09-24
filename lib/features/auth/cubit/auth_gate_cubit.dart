import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cantwait28/models/user_model.dart';
import 'package:cantwait28/repositories/Firebase_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_gate_state.dart';

class AuthGateCubit extends Cubit<AuthGateState> {
  AuthGateCubit(this._firebaseAuthRespository)
      : super(const AuthGateState(user: null));

  StreamSubscription? _streamSubscription;

  final FirebaseAuthRespository _firebaseAuthRespository;

  Future<void> start() async {
    emit(
      const AuthGateState(
        user: null,
      ),
    );
    _streamSubscription = _firebaseAuthRespository.userModelStream().listen(
      (user) {
        if (user != null) {
          emit(
            AuthGateState(
              user: user,
            ),
          );
        } else {
          emit(
            const AuthGateState(
              user: null,
            ),
          );
        }
      },
    )..onError((error) {
        emit(
          const AuthGateState(
            user: null,
          ),
        );
      });
  }
}
