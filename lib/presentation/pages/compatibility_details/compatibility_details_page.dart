import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/di/locator.dart';
import 'package:horoskope/domain/entities/compatibility_person.dart';
import 'package:horoskope/domain/entities/zodiac_signs.dart';
import 'package:horoskope/presentation/pages/compatibility_details/compatibility_details_cubit.dart';
import 'package:horoskope/presentation/pages/compatibility_details/compatibility_details_state.dart';
import 'package:horoskope/presentation/resources/app_images_asset.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/themes/styles/horoskope_button_style.dart';
import 'package:horoskope/presentation/utils/extensions/build_context_ext.dart';
import 'package:horoskope/presentation/utils/extensions/zodiac_sign_ext.dart';
import 'package:horoskope/presentation/widgets/bouncing_scroll_view.dart';
import 'package:horoskope/presentation/widgets/elevated_card.dart';
import 'package:horoskope/presentation/widgets/horoskope_button.dart';
import 'package:horoskope/presentation/widgets/horoskope_page.dart';
import 'package:horoskope/presentation/widgets/info_card.dart';
import 'package:horoskope/presentation/widgets/shimmer.dart';
import 'package:horoskope/presentation/widgets/shimmer_loading.dart';
import 'package:horoskope/presentation/widgets/tab_names.dart';
import 'package:recase/recase.dart';

abstract class CompatibilityDetailsPageTextThemeData
    implements HoroskopeBaseTextThemeData {
  TextStyle get compatibilityDetailsPersonName;
  TextStyle get compatibilityDetailsRate;
  TextStyle get compatibilityDetailsCardTitle;
  TextStyle get compatibilityDetailsCardBody;
}

abstract class CompatibilityDetailsPageColorThemeData
    implements HoroskopeBaseColorThemeData {
  Color get romanticCompatibility;
  Color get friendshipCompatibility;
  Color get background;
  Color get romanticCard;
  Color get romanticCardShadow;
  Color get friendshipCard;
  Color get friendshipCardShadow;
  LinearGradient get compatibilityDetailsShimmerGradient;
}

abstract class CompatibilityDetailsPageButtonThemeData
    implements HoroskopeBaseButtonThemeData {
  HoroskopeButtonStyle get romanticCompatibilityBackButton;
  HoroskopeButtonStyle get friendshipCompatibilityBackButton;
  HoroskopeButtonStyle getRomanticCompatibilityTab(bool isSelected);
  HoroskopeButtonStyle getFriendshipCompatibilityTab(bool isSelected);
}

typedef CompatibilityDetailsPageThemeData = HoroskopeThemeData<
    CompatibilityDetailsPageTextThemeData,
    CompatibilityDetailsPageColorThemeData,
    CompatibilityDetailsPageButtonThemeData>;

class CompatibilityDetailsPageArguments {
  final int compatibilityId;

  CompatibilityDetailsPageArguments({
    required this.compatibilityId,
  });
}

class CompatibilityDetailsPage extends StatefulWidget {
  final CompatibilityDetailsPageThemeData theme;
  final int compatibilityId;

  const CompatibilityDetailsPage({
    Key? key,
    required this.theme,
    required this.compatibilityId,
  }) : super(key: key);

  @override
  State<CompatibilityDetailsPage> createState() =>
      _CompatibilityDetailsPageState();
}

class _CompatibilityDetailsPageState extends State<CompatibilityDetailsPage> {
  final _cubit = locator.get<CompatibilityDetailsCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.init(widget.compatibilityId);
  }

  @override
  Widget build(BuildContext context) {
    return HoroskopePage(
      backgroundImage: const AssetImage(
        AppImagesAsset.compatibilityDetailsBackground,
      ),
      body: BouncingScrollView(
        child:
            BlocBuilder<CompatibilityDetailsCubit, CompatibilityDetailsState>(
          bloc: _cubit,
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer(
                linearGradient:
                    widget.theme.colorTheme.compatibilityDetailsShimmerGradient,
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    _buildBackButtonBlock(state),
                    const SizedBox(height: 40),
                    _buildVisualBlock(state),
                    const SizedBox(height: 30),
                    _buildDescriptionBlock(state),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              _buildTabNames(state),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButtonBlock(CompatibilityDetailsState state) {
    return SizedBox(
      width: double.infinity,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: HoroskopeButton(
            child: Text(context.localizations.back),
            onTap: Navigator.of(context).pop,
            style: _getBackButtonStyle(state.tab),
          ),
        ),
      ),
    );
  }

  HoroskopeButtonStyle _getBackButtonStyle(CompatibilityDetailsTab tab) {
    return tab == CompatibilityDetailsTab.romantic
        ? widget.theme.buttonTheme.romanticCompatibilityBackButton
        : widget.theme.buttonTheme.friendshipCompatibilityBackButton;
  }

  Widget _buildVisualBlock(CompatibilityDetailsState state) {
    final compatibility = state.compatibility;

    return _VisualBlock(
      loading: compatibility == null,
      first: CompatibilityPerson(
        name: compatibility?.userName ?? '',
        zodiacSign: compatibility?.userZodiacSign ?? ZodiacSign.aquarius,
      ),
      second: CompatibilityPerson(
        name: compatibility?.partnerName ?? '',
        zodiacSign: compatibility?.partnerZodiacSign ?? ZodiacSign.aquarius,
      ),
      compatibilityRate: compatibility?.romanticCompatibilityRate ?? 0,
      style: _VisualBlockStyle(
        rateStyle: widget.theme.textTheme.compatibilityDetailsRate,
        nameStyle: widget.theme.textTheme.compatibilityDetailsPersonName,
        mainColor: _getMainColor(state.tab),
        backgroundColor: widget.theme.colorTheme.background,
      ),
    );
  }

  Color _getMainColor(CompatibilityDetailsTab tab) {
    return tab == CompatibilityDetailsTab.romantic
        ? widget.theme.colorTheme.romanticCompatibility
        : widget.theme.colorTheme.friendshipCompatibility;
  }

  Widget _buildDescriptionBlock(CompatibilityDetailsState state) {
    final compatibility = state.compatibility;

    return _DescriptionBlock(
      loading: compatibility == null,
      cards: compatibility?.romanticCompatibilityItems ?? {},
      style: InfoCardStyle(
        color: _getCardColor(state.tab),
        shadowColor: _getCardShadowColor(state.tab),
        body: widget.theme.textTheme.compatibilityDetailsCardBody,
        title: widget.theme.textTheme.compatibilityDetailsCardTitle,
      ),
    );
  }

  Color _getCardColor(CompatibilityDetailsTab tab) {
    return tab == CompatibilityDetailsTab.romantic
        ? widget.theme.colorTheme.romanticCard
        : widget.theme.colorTheme.friendshipCard;
  }

  Color _getCardShadowColor(CompatibilityDetailsTab tab) {
    return tab == CompatibilityDetailsTab.romantic
        ? widget.theme.colorTheme.romanticCardShadow
        : widget.theme.colorTheme.friendshipCardShadow;
  }

  Widget _buildTabNames(CompatibilityDetailsState state) {
    return TabNames(
      tabNames: CompatibilityDetailsTab.values
          .map(
            (value) => TabName(
              name: value.name.sentenceCase,
              isSelected: state.tab == value,
              style: _getTabStyle(value),
              onTap: () => _cubit.changeTab(value.index),
            ),
          )
          .toList(),
    );
  }

  HoroskopeButtonStyle Function(bool) _getTabStyle(
    CompatibilityDetailsTab tab,
  ) {
    return tab == CompatibilityDetailsTab.romantic
        ? widget.theme.buttonTheme.getRomanticCompatibilityTab
        : widget.theme.buttonTheme.getFriendshipCompatibilityTab;
  }
}

class _VisualBlockStyle {
  final TextStyle rateStyle;
  final TextStyle nameStyle;
  final Color mainColor;
  final Color backgroundColor;

  _VisualBlockStyle({
    required this.rateStyle,
    required this.nameStyle,
    required this.mainColor,
    required this.backgroundColor,
  });
}

class _VisualBlock extends StatelessWidget {
  final CompatibilityPerson first;
  final CompatibilityPerson second;
  final int compatibilityRate;
  final bool loading;
  final _VisualBlockStyle style;

  const _VisualBlock({
    Key? key,
    required this.first,
    required this.second,
    required this.style,
    this.loading = false,
    this.compatibilityRate = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SignWithName(
          loading: loading,
          name: first.name,
          sign: first.zodiacSign,
          signColor: style.mainColor,
          nameStyle: style.nameStyle,
        ),
        const SizedBox(width: 32),
        _CompatibilityRate(
          loading: loading,
          rate: compatibilityRate,
          color: style.backgroundColor,
          borderColor: style.mainColor,
          rateStyle: style.rateStyle,
        ),
        const SizedBox(width: 32),
        _SignWithName(
          loading: loading,
          name: second.name,
          sign: second.zodiacSign,
          signColor: style.mainColor,
          nameStyle: style.nameStyle,
        ),
      ],
    );
  }
}

class _SignWithName extends StatelessWidget {
  final String name;
  final ZodiacSign sign;
  final bool loading;
  final Color? signColor;
  final TextStyle? nameStyle;

  const _SignWithName({
    Key? key,
    required this.name,
    required this.sign,
    this.loading = false,
    this.signColor,
    this.nameStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return ShimmerLoading(
        isLoading: true,
        child: Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            color: signColor,
            shape: BoxShape.circle,
          ),
        ),
      );
    }

    return Column(
      children: [
        Image.asset(
          sign.imagePath,
          height: 56,
          width: 56,
          fit: BoxFit.fill,
          color: signColor,
        ),
        const SizedBox(height: 8),
        Text(name, style: nameStyle),
      ],
    );
  }
}

class _CompatibilityRate extends StatelessWidget {
  final int rate;
  final Color color;
  final Color borderColor;
  final bool loading;
  final TextStyle? rateStyle;

  const _CompatibilityRate({
    Key? key,
    this.rate = 0,
    this.color = Colors.white,
    this.borderColor = Colors.black,
    this.loading = false,
    this.rateStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: loading,
      child: Container(
        height: 72,
        width: 72,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: borderColor),
        ),
        child: Text(
          rate.toString(),
          style: rateStyle,
        ),
      ),
    );
  }
}

class _DescriptionBlock extends StatelessWidget {
  final Map<String, String> cards;
  final InfoCardStyle style;
  final bool loading;

  const _DescriptionBlock({
    Key? key,
    required this.style,
    this.cards = const {},
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading) return _loadingCards();

    return Column(
      children: cards.entries
          .map(
            (card) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: InfoCard(
                title: card.key,
                body: card.value,
                style: style,
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _loadingCards() {
    return Column(
      children: const [
        _LoadingCard(),
        _LoadingCard(),
      ],
    );
  }
}

class _LoadingCard extends StatelessWidget {
  const _LoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: ShimmerLoading(
        isLoading: true,
        child: ElevatedCard(
          child: SizedBox(height: 140),
        ),
      ),
    );
  }
}
