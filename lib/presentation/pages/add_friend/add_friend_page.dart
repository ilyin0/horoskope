import 'package:flutter/material.dart';
import 'package:horoskope/presentation/resources/app_images_asset.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/utils/extensions/build_context_ext.dart';
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

class AddFriendPage extends StatelessWidget {
  final AddFriendPageThemeData theme;

  const AddFriendPage({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoroskopePage(
      backgroundImage: const AssetImage(
        AppImagesAsset.compatibilityDetailsBackground,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HoroskopeNamedTextFormField(
              name: context.localizations.whatIsYourFriendNameQuestion,
              textTheme: theme.textTheme,
              textFormField: HoroskopeTextFormField(
                colorThemeData: theme.colorTheme,
              ),
            ),
            const SizedBox(height: 24),
            HoroskopeNamedTextFormField(
              name: context.localizations.whenWasYourFriendBornQuestion,
              textTheme: theme.textTheme,
              textFormField: HoroskopeTextFormField(
                colorThemeData: theme.colorTheme,
              ),
            ),
            const SizedBox(height: 24),
            HoroskopeNamedTextFormField(
              name: context.localizations.whereWasYourFriendBornQuestion,
              textTheme: theme.textTheme,
              textFormField: HoroskopeTextFormField(
                colorThemeData: theme.colorTheme,
              ),
            ),
            const SizedBox(height: 24),
            HoroskopeNamedTextFormField(
              name: context.localizations.theTimeYourFriendWasBorn,
              textTheme: theme.textTheme,
              textFormField: HoroskopeTextFormField(
                colorThemeData: theme.colorTheme,
              ),
            ),
            const SizedBox(height: 24),
            HoroskopeButton.expanded(
              child: Text(context.localizations.addFriend),
              style: theme.buttonTheme.secondary2,
              onTap: Navigator.of(context).pop,
            ),
          ],
        ),
      ),
    );
  }
}
