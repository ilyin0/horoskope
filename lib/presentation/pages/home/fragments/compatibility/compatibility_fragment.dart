import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/di/locator.dart';
import 'package:horoskope/presentation/pages/home/fragments/compatibility/compatibility_cubit.dart';
import 'package:horoskope/presentation/pages/home/fragments/compatibility/compatibility_state.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/utils/build_context_ext.dart';
import 'package:horoskope/presentation/widgets/compatibility_short_card.dart';
import 'package:horoskope/presentation/widgets/horoskope_button.dart';
import 'package:horoskope/presentation/widgets/info_card.dart';

abstract class CompatibilityFragmentColorThemeData
    implements CompatibilityShortCardColorThemeData {}

abstract class CompatibilityFragmentTextThemeData
    implements CompatibilityShortCardTextThemeData {}

typedef CompatibilityFragmentThemeData = HoroskopeThemeData<
    CompatibilityFragmentTextThemeData,
    CompatibilityFragmentColorThemeData,
    HoroskopeBaseButtonThemeData>;

class CompatibilityFragment extends StatefulWidget {
  final CompatibilityFragmentThemeData theme;

  const CompatibilityFragment({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  State<CompatibilityFragment> createState() => _CompatibilityFragmentState();
}

class _CompatibilityFragmentState extends State<CompatibilityFragment> {
  final _cubit = locator.get<CompatibilityCubit>();

  // For FadingEdgeScrollView to work
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompatibilityCubit, CompatibilityState>(
      bloc: _cubit,
      builder: (context, state) {
        final compatibilityItems = state.compatibilityItems;

        return FadingEdgeScrollView.fromSingleChildScrollView(
          gradientFractionOnEnd: 0,
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //TODO: add shimmer loading
                if (compatibilityItems == null) const SizedBox(),
                if (compatibilityItems != null && compatibilityItems.isEmpty)
                  _welcomeCard(context),
                if (compatibilityItems != null && compatibilityItems.isNotEmpty)
                  ...compatibilityItems.map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 20,
                      ),
                      child: CompatibilityShortCard(
                        title: item.name,
                        subtitle: item.shortDescription,
                        rate: item.romanticCompatibility,
                        theme: widget.theme,
                      ),
                    ),
                  ),
                const SizedBox(height: 40),
                _addFriendButton(context),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _addFriendButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: HoroskopeButton.expanded(
        child: Text(context.localizations.addFriend),
        style: HoroskopeTheme.button(context).secondary2,
      ),
    );
  }

  Widget _welcomeCard(BuildContext context) {
    return InfoCard(
      title: context.localizations.checkOutTheCompatibility,
      body: context.localizations.checkOutTheCompatibilityDescription,
      theme: HoroskopeTheme.of(context),
    );
  }
}
