import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horoskope/di/locator.dart';
import 'package:horoskope/presentation/pages/home/fragments/compatibility/compatibility_fragment.dart';
import 'package:horoskope/presentation/pages/home/fragments/horoskope/horoskope_fragment.dart';
import 'package:horoskope/presentation/resources/app_images_asset.dart';
import 'package:horoskope/presentation/resources/app_vector_asset.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/utils/build_context_ext.dart';
import 'package:horoskope/presentation/widgets/app_bars/horoskope_title_app_bar.dart';
import 'package:horoskope/presentation/widgets/horoskope_page.dart';
import 'package:horoskope/presentation/widgets/info_card.dart';
import 'package:injectable/injectable.dart';

part 'home_cubit.dart';
part 'home_theme.dart';

class HomePage extends StatelessWidget {
  final HomePageThemeData theme;
  final _cubit = locator.get<HomeCubit>();

  HomePage({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      bloc: _cubit,
      builder: (context, tabIndex) {
        final fragmentModel = _fragmentModels(context)[tabIndex];

        return HoroskopePage(
          appBar: HoroskopeTitleAppBar(
            title: fragmentModel.title,
            iconColor: fragmentModel.mainColor,
            titleStyle: fragmentModel.titleStyle,
          ),
          backgroundImage: fragmentModel.backgroundImage,
          bottomNavigationBar: _bottomNavigationBar(
            context: context,
            activeTab: tabIndex,
            selectedItemColor: fragmentModel.mainColor,
          ),
          body: fragmentModel.fragment,
        );
      },
    );
  }

  Widget _bottomNavigationBar({
    required BuildContext context,
    required int activeTab,
    Color? selectedItemColor,
  }) {
    return SizedBox(
      height: 80,
      child: BottomNavigationBar(
        backgroundColor: theme.colorTheme.bottomNavigationBarBackgroundColor,
        elevation: 4,
        onTap: _cubit.switchTab,
        currentIndex: activeTab,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: const Color(0xFF546A7B),
        items: _fragmentModels(context)
            .map((model) => model.bottomNavigationBarItem)
            .toList(),
      ),
    );
  }

  List<_HomePageFragmentModel> _fragmentModels(BuildContext context) {
    return [
      _HomePageFragmentModel(
        title: context.localizations.horoskope,
        titleStyle: theme.textTheme.horoskopeFragmentTitle,
        mainColor: theme.colorTheme.horoskopeFragmentMainColor,
        backgroundImage: const AssetImage(
          AppImagesAsset.horoskopeBackground,
        ),
        fragment: HoroskopeFragment(theme: theme),
        bottomNavigationBarItem: BottomNavigationBarItem(
          label: context.localizations.horoskope,
          icon: SvgPicture.asset(
            AppVectorAsset.horoskopeMiniIcon,
            height: 24,
          ),
          activeIcon: SvgPicture.asset(
            AppVectorAsset.horoskopeMiniIcon,
            height: 24,
            color: theme.colorTheme.horoskopeFragmentMainColor,
          ),
        ),
      ),
      _HomePageFragmentModel(
        fragment: CompatibilityFragment(theme: theme),
        title: context.localizations.compatibility,
        titleStyle: theme.textTheme.compatibilityFragmentTitle,
        mainColor: theme.colorTheme.compatibilityFragmentMainColor,
        backgroundImage: const AssetImage(
          AppImagesAsset.compatibilityBackground,
        ),
        bottomNavigationBarItem: BottomNavigationBarItem(
          label: context.localizations.compatibility,
          icon: SvgPicture.asset(
            AppVectorAsset.heartIconBorder,
            height: 24,
          ),
          activeIcon: SvgPicture.asset(
            AppVectorAsset.heartIconFilled,
            height: 24,
            color: theme.colorTheme.compatibilityFragmentMainColor,
          ),
        ),
      ),
      _HomePageFragmentModel(
        title: context.localizations.aboutYou,
        titleStyle: theme.textTheme.aboutYouFragmentTitle,
        mainColor: theme.colorTheme.aboutYouFragmentMainColor,
        backgroundImage: const AssetImage(
          AppImagesAsset.aboutYouBackground,
        ),
        bottomNavigationBarItem: BottomNavigationBarItem(
          label: context.localizations.aboutYou,
          icon: SvgPicture.asset(
            AppVectorAsset.userIcon,
            height: 24,
          ),
          activeIcon: SvgPicture.asset(
            AppVectorAsset.userIcon,
            height: 24,
            color: theme.colorTheme.aboutYouFragmentMainColor,
          ),
        ),
      ),
    ];
  }
}

class _HomePageFragmentModel {
  final String title;
  final Color mainColor;
  final Widget fragment;
  final TextStyle titleStyle;
  final ImageProvider backgroundImage;
  final BottomNavigationBarItem bottomNavigationBarItem;

  const _HomePageFragmentModel({
    required this.backgroundImage,
    required this.bottomNavigationBarItem,
    this.title = 'Home',
    this.mainColor = Colors.black,
    this.fragment = const SizedBox(),
    this.titleStyle = const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
  });
}
