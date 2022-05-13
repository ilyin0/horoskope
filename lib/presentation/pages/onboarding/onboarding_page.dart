import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horoskope/presentation/resources/app_images_asset.dart';
import 'package:horoskope/presentation/resources/app_vector_asset.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/utils/extensions/build_context_ext.dart';
import 'package:horoskope/presentation/utils/validators.dart';
import 'package:horoskope/presentation/widgets/date_picker.dart';
import 'package:horoskope/presentation/widgets/horoskope_button.dart';
import 'package:horoskope/presentation/widgets/horoskope_named_text_form_field.dart';
import 'package:horoskope/presentation/widgets/horoskope_page.dart';
import 'package:horoskope/presentation/widgets/horoskope_text_form_field.dart';

part 'onboarding_fields.dart';

abstract class OnboardingPageColorThemeData
    implements
        HoroskopeTextFormFieldColorThemeData,
        HoroskopeBaseColorThemeData,
        CupertinoDatePickerColorThemeData {}

abstract class OnboardingPageTextThemeData
    implements
        HoroskopeNamedTextFormFieldTextThemeData,
        HoroskopeBaseTextThemeData {}

abstract class OnboardingPageButtonThemeData
    implements
        HoroskopeBaseButtonThemeData,
        CupertinoDatePickerButtonThemeData {}

typedef OnboardingPageThemeData = HoroskopeThemeData<
    OnboardingPageTextThemeData,
    OnboardingPageColorThemeData,
    OnboardingPageButtonThemeData>;

class OnboardingPage extends StatefulWidget {
  final OnboardingPageThemeData theme;
  final List<List<Widget> Function(BuildContext)> _onboardingViews;

  OnboardingPage({
    Key? key,
    required this.theme,
  })  : _onboardingViews = _getOnboardingViews(theme: theme),
        super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int page = 0;

  void previous() {
    if (page > 0) setState(() => page--);
  }

  void next() {
    if (page < widget._onboardingViews.length - 1) setState(() => page++);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        previous();
        return false;
      },
      child: HoroskopePage(
        backgroundImage: const AssetImage(AppImagesAsset.horoskopeBackground),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 64),
                SvgPicture.asset(
                  AppVectorAsset.horoskopeLogo,
                  height: 160,
                ),
                const SizedBox(height: 48),
                ...widget._onboardingViews[page].call(context),
                const SizedBox(height: 40),
                HoroskopeButton.expanded(
                  child: SizedBox(
                    child: Text(context.localizations.next),
                  ),
                  style: widget.theme.buttonTheme.secondary1,
                  onTap: next,
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
