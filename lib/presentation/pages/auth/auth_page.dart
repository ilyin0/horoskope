import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horoskope/di/locator.dart';
import 'package:horoskope/presentation/pages/auth/auth_page_cubit.dart';
import 'package:horoskope/presentation/resources/app_images_asset.dart';
import 'package:horoskope/presentation/resources/app_vector_asset.dart';
import 'package:horoskope/presentation/routes.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/themes/styles/horoskope_button_style.dart';
import 'package:horoskope/presentation/utils/extensions/build_context_ext.dart';
import 'package:horoskope/presentation/utils/validators.dart';
import 'package:horoskope/presentation/widgets/horoskope_button.dart';
import 'package:horoskope/presentation/widgets/horoskope_page.dart';
import 'package:horoskope/presentation/widgets/horoskope_text_form_field.dart';
import 'package:horoskope/presentation/widgets/text_and_action.dart';

part 'auth.dart';

abstract class AuthPageTextThemeData
    implements HoroskopeBaseTextThemeData, TextAndActionTextThemeData {
  TextStyle get logoTitle;
}

abstract class AuthPageButtonThemeData implements HoroskopeBaseButtonThemeData {
  HoroskopeButtonStyle get signIn;
  HoroskopeButtonStyle get socialSignIn;
}

abstract class AuthPageColorThemeData
    implements
        HoroskopeBaseColorThemeData,
        HoroskopeTextFormFieldColorThemeData {
  Color get dividerColor;
}

typedef AuthPageThemeData = HoroskopeThemeData<AuthPageTextThemeData,
    AuthPageColorThemeData, AuthPageButtonThemeData>;

class AuthPage extends StatefulWidget {
  final AuthPageThemeData theme;
  final _Auth _auth;

  const AuthPage._({
    Key? key,
    required this.theme,
    required _Auth auth,
  })  : _auth = auth,
        super(key: key);

  const AuthPage.signIn({
    Key? key,
    required AuthPageThemeData theme,
  }) : this._(
          key: key,
          theme: theme,
          auth: _Auth.signIn,
        );

  const AuthPage.signUp({
    Key? key,
    required AuthPageThemeData theme,
  }) : this._(
          key: key,
          theme: theme,
          auth: _Auth.signUp,
        );

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();

  final _cubit = locator.get<AuthPageCubit>();

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HoroskopePage(
      backgroundImage: const AssetImage(
        AppImagesAsset.horoskopeBackground,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80),
                SvgPicture.asset(
                  AppVectorAsset.horoskopeLogo,
                  height: 160,
                ),
                const SizedBox(height: 12),
                Text(
                  context.localizations.horoskope,
                  style: widget.theme.textTheme.logoTitle,
                ),
                const SizedBox(height: 60),
                HoroskopeTextFormField(
                  controller: emailController,
                  labelText: context.localizations.email,
                  colorThemeData: widget.theme.colorTheme,
                  validator: Validators.email,
                ),
                const SizedBox(height: 12),
                HoroskopeTextFormField(
                  controller: passwordController,
                  labelText: context.localizations.password,
                  colorThemeData: widget.theme.colorTheme,
                  validator: Validators.password,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                if (widget._auth == _Auth.signUp) ...[
                  HoroskopeTextFormField(
                    controller: confirmPasswordController,
                    labelText: context.localizations.confirmPassword,
                    colorThemeData: widget.theme.colorTheme,
                    obscureText: true,
                    validator: (value) => Validators.confirmPassword(
                      value,
                      passwordController.value.text,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                HoroskopeButton(
                  child: Text(widget._auth.getAuthText(context)),
                  style: widget.theme.buttonTheme.signIn,
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      widget._auth.authWithEmailAndPassword(
                        email: emailController.value.text,
                        password: passwordController.value.text,
                        cubit: _cubit,
                      );
                    }
                  },
                ),
                const SizedBox(height: 16),
                Text(context.localizations.or.toLowerCase()),
                const SizedBox(height: 16),
                Divider(color: widget.theme.colorTheme.dividerColor),
                const SizedBox(height: 16),
                _signInButtons(),
                const SizedBox(height: 24),
                TextAndAction(
                  text: widget._auth.actionAndTextQuestionText(context),
                  actionText: widget._auth.actionAndTextActionText(context),
                  onActionTap: () => widget._auth.onActionTap(context).call(),
                  theme: widget.theme.textTheme,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HoroskopeButton(
          child: SvgPicture.asset(
            AppVectorAsset.apple,
            height: 32,
          ),
          style: widget.theme.buttonTheme.socialSignIn,
          onTap: _cubit.signInAnonymously,
        ),
        HoroskopeButton(
          child: SvgPicture.asset(
            AppVectorAsset.google,
            height: 32,
          ),
          style: widget.theme.buttonTheme.socialSignIn,
          onTap: _cubit.signInAnonymously,
        ),
      ],
    );
  }
}
