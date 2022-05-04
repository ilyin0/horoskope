import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horoskope/presentation/resources/app_images_asset.dart';
import 'package:horoskope/presentation/resources/app_vector_asset.dart';
import 'package:horoskope/presentation/routes.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/themes/styles/horoskope_button_style.dart';
import 'package:horoskope/presentation/utils/build_context_ext.dart';
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

class AuthPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return HoroskopePage(
      backgroundImage: const AssetImage(
        AppImagesAsset.horoskopeBackground,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
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
                style: theme.textTheme.logoTitle,
              ),
              const SizedBox(height: 60),
              HoroskopeTextFormField(
                labelText: context.localizations.email,
                colorThemeData: theme.colorTheme,
              ),
              const SizedBox(height: 12),
              HoroskopeTextFormField(
                labelText: context.localizations.password,
                colorThemeData: theme.colorTheme,
              ),
              const SizedBox(height: 16),
              if (_auth == _Auth.signUp) ...[
                HoroskopeTextFormField(
                  labelText: context.localizations.confirmPassword,
                  colorThemeData: theme.colorTheme,
                ),
                const SizedBox(height: 16),
              ],
              HoroskopeButton(
                child: Text(_auth.getAuthText(context)),
                style: theme.buttonTheme.signIn,
                onTap: () => _auth.onButtonTap(context).call(),
              ),
              const SizedBox(height: 16),
              Text(context.localizations.or.toLowerCase()),
              const SizedBox(height: 16),
              Divider(color: theme.colorTheme.dividerColor),
              const SizedBox(height: 16),
              _signInButtons(),
              const SizedBox(height: 24),
              TextAndAction(
                text: _auth.actionAndTextQuestionText(context),
                actionText: _auth.actionAndTextActionText(context),
                onActionTap: () => _auth.onActionTap(context).call(),
                theme: theme.textTheme,
              ),
              const SizedBox(height: 24),
            ],
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
          style: theme.buttonTheme.socialSignIn,
        ),
        HoroskopeButton(
          child: SvgPicture.asset(
            AppVectorAsset.google,
            height: 32,
          ),
          style: theme.buttonTheme.socialSignIn,
        ),
      ],
    );
  }
}
