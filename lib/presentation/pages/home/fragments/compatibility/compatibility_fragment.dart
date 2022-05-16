import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/di/locator.dart';
import 'package:horoskope/presentation/pages/compatibility_details/compatibility_details_page.dart';
import 'package:horoskope/presentation/pages/home/fragments/compatibility/compatibility_cubit.dart';
import 'package:horoskope/presentation/pages/home/fragments/compatibility/compatibility_state.dart';
import 'package:horoskope/presentation/routes.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/utils/extensions/build_context_ext.dart';
import 'package:horoskope/presentation/widgets/compatibility_short_card.dart';
import 'package:horoskope/presentation/widgets/horoskope_button.dart';
import 'package:horoskope/presentation/widgets/info_card.dart';

abstract class CompatibilityFragmentColorThemeData
    implements CompatibilityShortCardColorThemeData {
  Color get welcomeCompatibilityCard;
  Color get welcomeCompatibilityCardShadow;
}

abstract class CompatibilityFragmentTextThemeData
    implements CompatibilityShortCardTextThemeData {
  TextStyle get welcomeCompatibilityCardTitle;
  TextStyle get welcomeCompatibilityCardBody;
}

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
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            Routes.compatibilityDetails,
                            arguments: CompatibilityDetailsPageArguments(
                              compatibilityId: item.id,
                            ),
                          );
                        },
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
      style: InfoCardStyle(
        color: widget.theme.colorTheme.welcomeCompatibilityCard,
        shadowColor: widget.theme.colorTheme.welcomeCompatibilityCardShadow,
        title: widget.theme.textTheme.welcomeCompatibilityCardTitle,
        body: widget.theme.textTheme.welcomeCompatibilityCardBody,
      ),
    );
  }
}
