import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/di/locator.dart';
import 'package:horoskope/presentation/pages/home/home_cubit.dart';
import 'package:horoskope/presentation/pages/home/home_state.dart';
import 'package:horoskope/presentation/resources/app_images_asset.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/utils/build_context_ext.dart';
import 'package:horoskope/presentation/widgets/app_bars/horoskope_title_app_bar.dart';
import 'package:horoskope/presentation/widgets/horoskope_page.dart';
import 'package:horoskope/presentation/widgets/info_card.dart';
import 'package:horoskope/presentation/widgets/tab_names.dart';

abstract class HomePageColorThemeData implements HoroskopeBaseColorThemeData {
  Color get homePageMainColor;
}

abstract class HomePageTextThemeData implements InfoCardTextThemeData {
  TextStyle get homePageTitle;
}

typedef HomePageThemeData = HoroskopeThemeData<HomePageTextThemeData,
    HomePageColorThemeData, HoroskopeButtonThemeData>;

class HomePage extends StatelessWidget {
  final HomePageThemeData theme;

  const HomePage({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: locator.get<HomeCubit>(),
      builder: (context, state) {
        return HoroskopePage(
          appBar: HoroskopeTitleAppBar(
            title: context.localizations.horoskope,
            iconColor: theme.colorTheme.homePageMainColor,
            titleStyle: theme.textTheme.homePageTitle,
          ),
          backgroundImage: const AssetImage(
            AppImagesAsset.horoskopeBackground,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                TabNames.fromNames(
                  names: const ['Today', 'Tomorrow', 'Week', 'Month'],
                  style: HoroskopeTheme.button(context).getPrimaryTab,
                ),
                const SizedBox(height: 8, width: double.infinity),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InfoCard(
                    body: state.todayForecast,
                    theme: theme,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
