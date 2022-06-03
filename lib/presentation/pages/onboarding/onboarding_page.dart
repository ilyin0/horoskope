import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horoskope/di/locator.dart';
import 'package:horoskope/presentation/pages/onboarding/oboarding_state.dart';
import 'package:horoskope/presentation/pages/onboarding/onboarding_cubit.dart';
import 'package:horoskope/presentation/resources/app_images_asset.dart';
import 'package:horoskope/presentation/resources/app_vector_asset.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/utils/extensions/build_context_ext.dart';
import 'package:horoskope/presentation/utils/extensions/date_time_ext.dart';
import 'package:horoskope/presentation/utils/extensions/time_of_day_ext.dart';
import 'package:horoskope/presentation/utils/validators.dart';
import 'package:horoskope/presentation/widgets/date_picker.dart';
import 'package:horoskope/presentation/widgets/horoskope_button.dart';
import 'package:horoskope/presentation/widgets/horoskope_named_text_form_field.dart';
import 'package:horoskope/presentation/widgets/horoskope_page.dart';
import 'package:horoskope/presentation/widgets/horoskope_text_form_field.dart';

abstract class OnboardingPageColorThemeData
    implements
        HoroskopeTextFormFieldColorThemeData,
        HoroskopeBaseColorThemeData,
        CupertinoDatePickerColorThemeData {}

abstract class OnboardingPageTextThemeData
    implements
        HoroskopeNamedTextFormFieldTextThemeData,
        HoroskopeBaseTextThemeData {}

typedef OnboardingPageThemeData = HoroskopeThemeData<
    OnboardingPageTextThemeData,
    OnboardingPageColorThemeData,
    HoroskopeBaseButtonThemeData>;

class OnboardingPage extends StatefulWidget {
  final OnboardingPageThemeData theme;

  const OnboardingPage({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _page = 0;

  final _cubit = locator.get<OnboardingCubit>();

  void previous() {
    if (_page > 0) setState(() => _page--);
  }

  @override
  void initState() {
    super.initState();
    _cubit.init();
  }

  @override
  void dispose() {
    _cubit.dispose();
    super.dispose();
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
            child: BlocBuilder<OnboardingCubit, OnboardingState>(
                bloc: _cubit,
                builder: (context, state) {
                  return Column(
                    children: [
                      const SizedBox(height: 64),
                      SvgPicture.asset(
                        AppVectorAsset.horoskopeLogo,
                        height: 160,
                      ),
                      const SizedBox(height: 48),
                      _getOnboardingViews(
                        formKeys: _cubit.formKeys,
                      )[state.page],
                      const SizedBox(height: 40),
                      HoroskopeButton.expanded(
                        child: SizedBox(
                          child: Text(context.localizations.next),
                        ),
                        style: widget.theme.buttonTheme.secondary1,
                        onTap: _cubit.nextPage,
                      ),
                      const SizedBox(height: 20),
                      if (state.page > 0)
                        HoroskopeButton.expanded(
                          child: Text(context.localizations.back),
                          style: widget.theme.buttonTheme.secondary1,
                          onTap: _cubit.previousPage,
                        ),
                      const SizedBox(height: 100),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

  List<Widget> _getOnboardingViews({
    required List<GlobalKey<FormState>> formKeys,
  }) {
    return [
      _getNameAndBirthDateForm(formKey: formKeys[0]),
      _getBirthPlaceAndTimeForm(formKey: formKeys[1]),
    ];
  }

  Widget _getNameAndBirthDateForm({
    required GlobalKey<FormState> formKey,
  }) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          HoroskopeNamedTextFormField(
            name: context.localizations.whatIsYourNameQuestion,
            textFormField: HoroskopeTextFormField(
              controller: _cubit.nameController,
              colorThemeData: widget.theme.colorTheme,
              labelText: context.localizations.name,
              validator: Validators.name,
            ),
            textTheme: widget.theme.textTheme,
          ),
          const SizedBox(height: 16),
          HoroskopeNamedTextFormField(
            textFormField: HoroskopeTextFormField(
              controller: _cubit.birthDateController,
              colorThemeData: widget.theme.colorTheme,
              hintText: '15/10/2003',
              validator: Validators.date,
              onTap: () async {
                final dateTime = await showHoroskopeDatePicker(
                  context,
                  initialDate: DateTime(2003, 10, 15),
                  theme: HoroskopeTheme.of(context),
                  mode: PickerMode.date,
                );

                if (dateTime != null) {
                  _cubit.birthDateController.text = dateTime.horoskopeFormat;
                }
              },
            ),
            name: context.localizations.whenWereYouBornQuestion,
            textTheme: widget.theme.textTheme,
          ),
        ],
      ),
    );
  }

  Widget _getBirthPlaceAndTimeForm({
    required GlobalKey<FormState> formKey,
  }) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          HoroskopeNamedTextFormField(
            name: context.localizations.whereWereYouBornQuestion,
            textTheme: widget.theme.textTheme,
            textFormField: HoroskopeTextFormField(
              controller: _cubit.birthPlaceController,
              colorThemeData: widget.theme.colorTheme,
              labelText: context.localizations.city,
              validator: Validators.city,
            ),
          ),
          const SizedBox(height: 16),
          HoroskopeNamedTextFormField(
            name: context.localizations.theTimeYouWereBorn,
            textFormField: HoroskopeTextFormField(
              controller: _cubit.birthTimeController,
              colorThemeData: widget.theme.colorTheme,
              validator: Validators.time,
              hintText: '12:00',
              onTap: () async {
                final dateTime = await showHoroskopeDatePicker(
                  context,
                  initialDate: DateTime(1, 1, 1, 12, 00),
                  theme: HoroskopeTheme.of(context),
                  mode: PickerMode.time,
                );

                if (dateTime != null) {
                  _cubit.birthTimeController.text =
                      TimeOfDay.fromDateTime(dateTime).horoskopeFormat;
                }
              },
            ),
            textTheme: widget.theme.textTheme,
          ),
        ],
      ),
    );
  }
}
