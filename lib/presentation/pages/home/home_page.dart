import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/di/locator.dart';
import 'package:horoskope/presentation/pages/home/home_cubit.dart';
import 'package:horoskope/presentation/pages/home/home_state.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/utils/build_context_ext.dart';
import 'package:horoskope/presentation/widgets/info_card.dart';
import 'package:horoskope/presentation/widgets/tab_names.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: locator.get<HomeCubit>(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.localizations.horoskope),
          ),
          body: Stack(
            children: [
              const Placeholder(),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 8, width: double.infinity),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InfoCard(
                        body: state.todayForecast,
                        textTheme: HoroskopeTheme.text(context),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TabNames.fromNames(
                      names: const [
                        'Today',
                        'Tomorrow',
                        'Week',
                        'Month',
                      ],
                      style: HoroskopeTheme.button(context).getSecondaryBigTab,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
