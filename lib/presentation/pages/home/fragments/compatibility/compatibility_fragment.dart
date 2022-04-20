import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/di/locator.dart';
import 'package:horoskope/presentation/pages/home/fragments/compatibility/compatibility_cubit.dart';
import 'package:horoskope/presentation/pages/home/fragments/compatibility/compatibility_state.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/widgets/horoskope_button.dart';
import 'package:horoskope/presentation/widgets/info_card.dart';

class CompatibilityFragment extends StatelessWidget {
  final _cubit = locator.get<CompatibilityCubit>();

  CompatibilityFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<CompatibilityCubit, CompatibilityState>(
          bloc: _cubit,
          builder: (context, state) {
            final compatibilityItems = state.compatibilityItems;

            return Column(
              children: [
                //TODO: add shimmer loading
                if (compatibilityItems == null) const SizedBox(),
                if (compatibilityItems != null && compatibilityItems.isEmpty)
                  _welcomeCard(context),
                const SizedBox(
                  height: 52,
                ),
                HoroskopeButton.expanded(
                  child: const Text('Add Friend'),
                  style: HoroskopeTheme.button(context).secondary2,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _welcomeCard(BuildContext context) {
    return InfoCard(
      title: 'Check out the compatibility!',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam porta porttitor tortor, eget efficitur nibh pharetra eget. Maecenas ultrices sagittis risus, vitae venenatis elit volutpat quis. In id feugiat nisl',
      theme: HoroskopeTheme.of(context),
    );
  }
}
