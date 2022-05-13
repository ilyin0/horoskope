import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/di/locator.dart';
import 'package:horoskope/presentation/pages/home/fragments/horoskope/horoskope_cubit.dart';
import 'package:horoskope/presentation/pages/home/fragments/horoskope/horoskope_state.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/themes/styles/horoskope_button_style.dart';
import 'package:horoskope/presentation/widgets/elevated_card.dart';
import 'package:horoskope/presentation/widgets/info_card.dart';
import 'package:horoskope/presentation/widgets/tab_names.dart';

abstract class HoroskopeFragmentTextThemeData
    implements HoroskopeBaseTextThemeData {
  TextStyle get forecastBody;
}

abstract class HoroskopeFragmentColorThemeData
    implements HoroskopeBaseColorThemeData {
  Color get horoskopeFragmentMainColor;
  Color get horoskopeFragmentCardColor;
}

abstract class HoroskopeFragmentButtonThemeData
    implements HoroskopeBaseButtonThemeData {
  HoroskopeButtonStyle tabNameStyle(bool isSelected);
}

typedef HoroskopeFragmentThemeData = HoroskopeThemeData<
    HoroskopeFragmentTextThemeData,
    HoroskopeFragmentColorThemeData,
    HoroskopeFragmentButtonThemeData>;

class HoroskopeFragment extends StatelessWidget {
  final HoroskopeFragmentThemeData theme;

  const HoroskopeFragment({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          TabNames.fromNames(
            names: const ['Today', 'Tomorrow', 'Week', 'Month'],
            style: theme.buttonTheme.tabNameStyle,
          ),
          const SizedBox(height: 8, width: double.infinity),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<HoroskopeCubit, HoroskopeState>(
              bloc: locator.get<HoroskopeCubit>(),
              builder: (context, state) {
                final forecast = state.todayForecast;

                if (forecast == null) {
                  return ElevatedCard(
                    child: SizedBox(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: theme.colorTheme.horoskopeFragmentMainColor,
                        ),
                      ),
                    ),
                  );
                }
                return InfoCard(
                  body: forecast,
                  style: InfoCardStyle(
                    color: theme.colorTheme.horoskopeFragmentCardColor,
                    shadowColor: theme.colorTheme.horoskopeFragmentMainColor,
                    body: theme.textTheme.forecastBody,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
