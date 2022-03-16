import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/di/locator.dart';
import 'package:horoskope/presentation/pages/home/home_cubit.dart';
import 'package:horoskope/presentation/pages/home/home_state.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/utils/build_context_ext.dart';

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
          body: Center(
            child: Text(
              state.todayForecast,
              style: TextStyle(
                color: HoroskopeTheme.color(context).primaryBlue,
              ),
            ),
          ),
        );
      },
    );
  }
}
