import 'package:flutter/material.dart';
import 'package:horoskope/di/locator.dart';
import 'package:horoskope/presentation/pages/add_friend/add_friend_cubit.dart';
import 'package:horoskope/presentation/resources/app_images_asset.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/utils/extensions/build_context_ext.dart';
import 'package:horoskope/presentation/utils/extensions/date_time_ext.dart';
import 'package:horoskope/presentation/utils/extensions/time_of_day_ext.dart';
import 'package:horoskope/presentation/utils/validators.dart';
import 'package:horoskope/presentation/widgets/bouncing_scroll_view.dart';
import 'package:horoskope/presentation/widgets/date_picker.dart';
import 'package:horoskope/presentation/widgets/horoskope_button.dart';
import 'package:horoskope/presentation/widgets/horoskope_named_text_form_field.dart';
import 'package:horoskope/presentation/widgets/horoskope_page.dart';
import 'package:horoskope/presentation/widgets/horoskope_text_form_field.dart';

abstract class AddFriendPageColorThemeData
    implements
        HoroskopeTextFormFieldColorThemeData,
        HoroskopeBaseColorThemeData {}

abstract class AddFriendPageTextThemeData
    implements
        HoroskopeNamedTextFormFieldTextThemeData,
        HoroskopeBaseTextThemeData {}

typedef AddFriendPageThemeData = HoroskopeThemeData<AddFriendPageTextThemeData,
    AddFriendPageColorThemeData, HoroskopeBaseButtonThemeData>;

class AddFriendPage extends StatefulWidget {
  final AddFriendPageThemeData theme;

  const AddFriendPage({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  State<AddFriendPage> createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage> {
  final _cubit = locator.get<AddFriendCubit>();

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
    return HoroskopePage(
      backgroundImage: const AssetImage(
        AppImagesAsset.compatibilityDetailsBackground,
      ),
      body: Center(
        child: BouncingScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _cubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  HoroskopeNamedTextFormField(
                    name: context.localizations.whatIsYourFriendNameQuestion,
                    textTheme: widget.theme.textTheme,
                    textFormField: HoroskopeTextFormField(
                      controller: _cubit.nameController,
                      colorThemeData: widget.theme.colorTheme,
                      labelText: context.localizations.name,
                      validator: Validators.name,
                    ),
                  ),
                  const SizedBox(height: 24),
                  HoroskopeNamedTextFormField(
                    name: context.localizations.whenWasYourFriendBornQuestion,
                    textTheme: widget.theme.textTheme,
                    textFormField: HoroskopeTextFormField(
                        colorThemeData: widget.theme.colorTheme,
                        controller: _cubit.birthDateController,
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
                            _cubit.birthDateController.text =
                                dateTime.horoskopeFormat;
                          }
                        }),
                  ),
                  const SizedBox(height: 24),
                  HoroskopeNamedTextFormField(
                    name: context.localizations.whereWasYourFriendBornQuestion,
                    textTheme: widget.theme.textTheme,
                    textFormField: HoroskopeTextFormField(
                      colorThemeData: widget.theme.colorTheme,
                      controller: _cubit.birthPlaceController,
                      labelText: context.localizations.city,
                      validator: Validators.city,
                    ),
                  ),
                  const SizedBox(height: 24),
                  HoroskopeNamedTextFormField(
                    name: context.localizations.theTimeYourFriendWasBorn,
                    textTheme: widget.theme.textTheme,
                    textFormField: HoroskopeTextFormField(
                      colorThemeData: widget.theme.colorTheme,
                      controller: _cubit.birthTimeController,
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
                  ),
                  const SizedBox(height: 24),
                  HoroskopeButton.expanded(
                    child: Text(context.localizations.addFriend),
                    style: widget.theme.buttonTheme.secondary2,
                    onTap: () async {
                      final isFriendAdded = await _cubit.addFriend();
                      if (isFriendAdded) Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
