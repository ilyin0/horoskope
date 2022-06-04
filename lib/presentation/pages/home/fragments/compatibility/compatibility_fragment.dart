import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/di/locator.dart';
import 'package:horoskope/domain/entities/friend_data.dart';
import 'package:horoskope/presentation/pages/compatibility_details/compatibility_details_page.dart';
import 'package:horoskope/presentation/pages/home/fragments/compatibility/compatibility_cubit.dart';
import 'package:horoskope/presentation/pages/home/fragments/compatibility/compatibility_state.dart';
import 'package:horoskope/presentation/routes.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/utils/extensions/build_context_ext.dart';
import 'package:horoskope/presentation/utils/extensions/date_time_ext.dart';
import 'package:horoskope/presentation/widgets/compatibility_short_card.dart';
import 'package:horoskope/presentation/widgets/elevated_card.dart';
import 'package:horoskope/presentation/widgets/horoskope_button.dart';
import 'package:horoskope/presentation/widgets/info_card.dart';
import 'package:horoskope/presentation/widgets/shimmer.dart';
import 'package:horoskope/presentation/widgets/shimmer_loading.dart';
import 'package:recase/recase.dart';

abstract class CompatibilityFragmentColorThemeData
    implements CompatibilityShortCardColorThemeData {
  Color get welcomeCompatibilityCard;
  Color get welcomeCompatibilityCardShadow;
  Color get compatibilityLoadingChartCardShadow;
  Color get compatibilityLoadingChartCardBackground;
  LinearGradient get compatibilityFragmentShimmerGradient;
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
    _cubit.init();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _cubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      linearGradient:
          widget.theme.colorTheme.compatibilityFragmentShimmerGradient,
      child: BlocBuilder<CompatibilityCubit, CompatibilityState>(
        bloc: _cubit,
        builder: (context, state) {
          return FadingEdgeScrollView.fromSingleChildScrollView(
            gradientFractionOnEnd: 0,
            child: SingleChildScrollView(
              controller: _scrollController,
              reverse: true,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _Cards(
                      theme: widget.theme,
                      friends: state.friends,
                    ),
                    const SizedBox(height: 40),
                    _AddFriendButton(buttonTheme: widget.theme.buttonTheme),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AddFriendButton extends StatelessWidget {
  final HoroskopeBaseButtonThemeData buttonTheme;

  const _AddFriendButton({
    Key? key,
    required this.buttonTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoroskopeButton.expanded(
      onTap: () => Navigator.of(context).pushNamed(Routes.addFriend),
      child: Text(context.localizations.addFriend),
      style: buttonTheme.secondary2,
    );
  }
}

class _Cards extends StatelessWidget {
  final CompatibilityFragmentThemeData theme;
  final List<FriendData>? friends;

  const _Cards({
    Key? key,
    required this.theme,
    required this.friends,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final friends = this.friends;

    if (friends == null) {
      return _LoadingCards(
        colorTheme: theme.colorTheme,
      );
    }
    if (friends.isEmpty) {
      return _WelcomeCard(theme: theme);
    } else {
      return _FriendsCards(
        friends: friends,
        theme: theme,
      );
    }
  }
}

class _FriendsCards extends StatelessWidget {
  final CompatibilityFragmentThemeData theme;
  final List<FriendData> friends;

  const _FriendsCards({
    Key? key,
    required this.theme,
    required this.friends,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: friends
          .map(
            (friend) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: CompatibilityShortCard(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    Routes.compatibilityDetails,
                    arguments: CompatibilityDetailsPageArguments(
                      friendData: friend,
                    ),
                  );
                },
                title: friend.name,
                subtitle: friend.birthDateTime.toZodiacSign.name.sentenceCase,
                theme: theme,
              ),
            ),
          )
          .toList(),
    );
  }
}

class _LoadingCards extends StatelessWidget {
  final CompatibilityFragmentColorThemeData colorTheme;

  const _LoadingCards({
    Key? key,
    required this.colorTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _LoadingCard(colorTheme: colorTheme),
        _LoadingCard(colorTheme: colorTheme),
        _LoadingCard(colorTheme: colorTheme),
        _LoadingCard(colorTheme: colorTheme),
      ],
    );
  }
}

class _LoadingCard extends StatelessWidget {
  final CompatibilityFragmentColorThemeData colorTheme;

  const _LoadingCard({
    Key? key,
    required this.colorTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: ShimmerLoading(
        isLoading: true,
        child: ElevatedCard(
          color: colorTheme.compatibilityLoadingChartCardBackground,
          shadowColor: colorTheme.compatibilityLoadingChartCardShadow,
          child: const SizedBox(height: 40),
        ),
      ),
    );
  }
}

class _WelcomeCard extends StatelessWidget {
  final CompatibilityFragmentThemeData theme;

  const _WelcomeCard({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      title: context.localizations.checkOutTheCompatibility,
      body: context.localizations.checkOutTheCompatibilityDescription,
      style: InfoCardStyle(
        color: theme.colorTheme.welcomeCompatibilityCard,
        shadowColor: theme.colorTheme.welcomeCompatibilityCardShadow,
        title: theme.textTheme.welcomeCompatibilityCardTitle,
        body: theme.textTheme.welcomeCompatibilityCardBody,
      ),
    );
  }
}
