part of 'auth_page.dart';

enum _Auth { signIn, signUp }

extension on _Auth {
  String getAuthText(BuildContext context) {
    switch (this) {
      case _Auth.signIn:
        return context.localizations.signIn;
      case _Auth.signUp:
        return context.localizations.signUp;
    }
  }

  String actionAndTextQuestionText(BuildContext context) {
    switch (this) {
      case _Auth.signIn:
        return context.localizations.stillDontHaveAnAccountQuestion;
      case _Auth.signUp:
        return context.localizations.alreadyHaveAnAccountQuestion;
    }
  }

  String actionAndTextActionText(BuildContext context) {
    switch (this) {
      case _Auth.signIn:
        return context.localizations.signUp;
      case _Auth.signUp:
        return context.localizations.signIn;
    }
  }

  VoidCallback onActionTap(BuildContext context) {
    switch (this) {
      case _Auth.signIn:
        return () => Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.signUp,
              (_) => false,
            );
      case _Auth.signUp:
        return () => Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.signIn,
              (_) => false,
            );
    }
  }

  void authWithEmailAndPassword({
    required String email,
    required String password,
    required AuthPageCubit cubit,
  }) {
    switch (this) {
      case _Auth.signIn:
        return cubit.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      case _Auth.signUp:
        return cubit.signUpWithEmailAndPassword(
          email: email,
          password: password,
        );
    }
  }
}
