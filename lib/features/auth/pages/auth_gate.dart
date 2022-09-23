import 'package:cantwait28/data/remote_data_sources/user_remote_data_source.dart';
import 'package:cantwait28/features/auth/cubit/auth_gate_cubit.dart';
import 'package:cantwait28/features/home/pages/home_page.dart';
import 'package:cantwait28/repositories/Firebase_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthGateCubit(FirebaseAuthRespository(UserRemoteDataSource()))
            ..start(),
      child: BlocBuilder<AuthGateCubit, AuthGateState>(
        builder: (context, state) {
          final user = state.user;
          if (user == null) {
            return const SignInScreen(providerConfigs: [
              EmailProviderConfiguration(),
            ]);
          }
          return const HomePage();
        },
      ),
    );
  }
}
