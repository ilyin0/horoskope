import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/di/locator.dart';
import 'package:horoskope/presentation/app/app_cubit.dart';
import 'package:horoskope/presentation/app/app_state.dart';
import 'package:horoskope/presentation/routes.dart';

class AuthNavigationController extends StatelessWidget {
  final _cubit = locator.get<AppCubit>();

  final Widget child;

  AuthNavigationController({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      bloc: _cubit,
      listenWhen: (previousState, currentState) =>
          previousState.authState != currentState.authState,
      listener: (context, state) {
        if (state.authState == AuthState.authenticated) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.home,
            (route) => false,
          );
        } else if (state.authState == AuthState.unauthenticated) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.signIn,
            (route) => false,
          );
        } else if (state.authState == AuthState.registered) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.onboarding,
            (route) => false,
          );
        }
      },
      child: child,
    );
  }
}
