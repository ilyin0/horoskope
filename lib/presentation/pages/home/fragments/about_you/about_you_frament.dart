import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/di/locator.dart';
import 'package:horoskope/domain/services/auth_service.dart';
import 'package:horoskope/presentation/pages/home/fragments/about_you/about_you_cubit.dart';
import 'package:horoskope/presentation/pages/home/fragments/about_you/about_you_state.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/widgets/bouncing_scroll_view.dart';
import 'package:horoskope/presentation/widgets/elevated_card.dart';
import 'package:horoskope/presentation/widgets/horoskope_button.dart';
import 'package:horoskope/presentation/widgets/info_card.dart';
import 'package:horoskope/presentation/widgets/shimmer.dart';
import 'package:horoskope/presentation/widgets/shimmer_loading.dart';

abstract class AboutYouFragmentColorThemeData
    implements HoroskopeBaseColorThemeData {
  Color get aboutYouChartCardShadow;
  Color get aboutYouChartCardBackground;
  Color get aboutYouEmptyChartCardShadow;
  Color get aboutYouEmptyChartCardBackground;
  Color get aboutYouLoadingChartCardShadow;
  Color get aboutYouLoadingChartCardBackground;
}

abstract class AboutYouFragmentTextThemeData
    implements HoroskopeBaseTextThemeData {
  TextStyle get chartsTitle;
  TextStyle get aboutYouCardTitle;
  TextStyle get aboutYouCardBody;
}

typedef AboutYouFragmentThemeData = HoroskopeThemeData<
    AboutYouFragmentTextThemeData,
    AboutYouFragmentColorThemeData,
    HoroskopeBaseButtonThemeData>;

class AboutYouFragment extends StatelessWidget {
  final _cubit = locator.get<AboutYouCubit>();

  final AboutYouFragmentThemeData theme;

  AboutYouFragment({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      linearGradient: theme.colorTheme.aboutYouFragmentShimmerGradient,
      child: BlocBuilder<AboutYouCubit, AboutYouState>(
        bloc: _cubit,
        builder: (context, state) {
          return BouncingScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Your Main Personality',
                    style: theme.textTheme.chartsTitle,
                  ),
                ),
                const SizedBox(height: 10),
                _Charts(
                  charts: state.personalityCharts,
                  theme: theme,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'More Info about You',
                    style: theme.textTheme.chartsTitle,
                  ),
                ),
                const SizedBox(height: 20),
                _Charts(
                  charts: state.additionalCharts,
                  theme: theme,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: HoroskopeButton.expanded(
                    //TODO localize
                    child: const Text('Sign Out'),
                    style: theme.buttonTheme.secondary2,
                    //TODO fix it by moving to cubit
                    onTap: locator.get<AuthService>().signOut,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Charts extends StatelessWidget {
  final Map<String, String>? charts;
  final AboutYouFragmentThemeData theme;

  const _Charts({
    Key? key,
    this.charts,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final charts = this.charts;

    if (charts == null) return _LoadingCharts(colorTheme: theme.colorTheme);
    if (charts.isEmpty) return _EmptyCharts(theme: theme);
    return _DataCharts(charts: charts, theme: theme);
  }
}

class _LoadingCharts extends StatelessWidget {
  final AboutYouFragmentColorThemeData colorTheme;

  const _LoadingCharts({
    Key? key,
    required this.colorTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingScrollView.horizontal(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            _LoadingChart(colorTheme: colorTheme),
            _LoadingChart(colorTheme: colorTheme),
            _LoadingChart(colorTheme: colorTheme),
          ],
        ),
      ),
    );
  }
}

class _LoadingChart extends StatelessWidget {
  final AboutYouFragmentColorThemeData colorTheme;

  const _LoadingChart({
    Key? key,
    required this.colorTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ShimmerLoading(
        isLoading: true,
        child: ElevatedCard(
          color: colorTheme.aboutYouLoadingChartCardBackground,
          shadowColor: colorTheme.aboutYouLoadingChartCardShadow,
          width: 160,
          child: const SizedBox(height: 180),
        ),
      ),
    );
  }
}

class _EmptyCharts extends StatelessWidget {
  final AboutYouFragmentThemeData theme;

  const _EmptyCharts({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InfoCard(
        title: 'Working on this!',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam porta porttitor tortor, eget efficitur nibh pharetra eget. Maecenas ultrices sagittis risus, vitae venenatis elit volutpat quis. In id feugiat nisl',
        style: InfoCardStyle(
          color: theme.colorTheme.aboutYouEmptyChartCardBackground,
          shadowColor: theme.colorTheme.aboutYouEmptyChartCardShadow,
          title: theme.textTheme.aboutYouCardTitle,
          body: theme.textTheme.aboutYouCardBody,
        ),
      ),
    );
  }
}

class _DataCharts extends StatelessWidget {
  final Map<String, String> charts;
  final AboutYouFragmentThemeData theme;

  const _DataCharts({
    Key? key,
    required this.charts,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingScrollView.horizontal(
      child: Row(
        children: [
          const SizedBox(width: 10),
          ...charts.entries
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: InfoCard(
                    title: e.key,
                    body: e.value,
                    width: 160,
                    style: InfoCardStyle(
                      color: theme.colorTheme.aboutYouChartCardBackground,
                      shadowColor: theme.colorTheme.aboutYouChartCardShadow,
                      title: theme.textTheme.aboutYouCardTitle,
                      body: theme.textTheme.aboutYouCardBody,
                    ),
                  ),
                ),
              )
              .toList(),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
