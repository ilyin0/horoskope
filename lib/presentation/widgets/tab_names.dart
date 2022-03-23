import 'package:flutter/material.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/themes/styles/horoskope_button_style.dart';
import 'package:horoskope/presentation/widgets/horoskope_button.dart';

typedef OnTabNameTap = void Function(int);
typedef TabNameStyle = HoroskopeButtonStyle Function(bool);

class TabName {
  final String name;
  final bool isSelected;
  final TabNameStyle style;
  final VoidCallback? onTap;

  const TabName({
    required this.name,
    required this.isSelected,
    required this.style,
    this.onTap,
  });

  TabName copyWith({
    String? name,
    bool? isSelected,
    TabNameStyle? style,
    VoidCallback? onTap,
  }) {
    return TabName(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      style: style ?? this.style,
      onTap: onTap ?? this.onTap,
    );
  }
}

const double _defaultVerticalPadding = 8;
const double _defaultHorizontalPadding = 20;
const double _defaultSpaceBetweenItems = 4;

class TabNames extends StatefulWidget {
  final List<TabName> tabNames;
  final double verticalPadding;
  final double horizontalPadding;
  final double spaceBetweenItems;

  const TabNames({
    Key? key,
    required this.tabNames,
    this.verticalPadding = _defaultVerticalPadding,
    this.horizontalPadding = _defaultHorizontalPadding,
    this.spaceBetweenItems = _defaultSpaceBetweenItems,
  }) : super(key: key);

  /// Creates TabNames widget from list of tab names (String)
  ///
  /// Note that containing one name several times
  /// can cause unpredictable behavior
  TabNames.fromNames({
    Key? key,
    required List<String> names,
    OnTabNameTap? onTabNameTap,
    int selectedIndex = 0,
    TabNameStyle? style,
    HoroskopeButtonThemeData? defaultTheme,
    this.verticalPadding = _defaultVerticalPadding,
    this.horizontalPadding = _defaultHorizontalPadding,
    this.spaceBetweenItems = _defaultSpaceBetweenItems,
  })  : assert(style != null || defaultTheme != null),
        assert(selectedIndex < names.length),
        tabNames = [
          for (final name in names)
            TabName(
              name: name,
              isSelected: selectedIndex == names.indexOf(name),
              style: style ?? defaultTheme!.getPrimaryTab,
              onTap: () => onTabNameTap?.call(names.indexOf(name)),
            ),
        ],
        super(key: key);

  @override
  State<TabNames> createState() => _TabNamesState();
}

class _TabNamesState extends State<TabNames> {
  late final List<TabName> _tabs;
  late int _selectedIndex;

  void _onTabTap(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _tabs[_selectedIndex] = _tabs[_selectedIndex].copyWith(isSelected: false);
      _tabs[index] = _tabs[index].copyWith(isSelected: true);
      _selectedIndex = index;

      _tabs[index].onTap?.call();
    });
  }

  @override
  void initState() {
    super.initState();
    _tabs = List.from(widget.tabNames);
    _selectedIndex = _tabs.indexWhere((tab) => tab.isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: widget.verticalPadding),
        child: Row(
          children: [
            SizedBox(width: widget.horizontalPadding),
            ..._tabNames(),
            SizedBox(width: widget.horizontalPadding),
          ],
        ),
      ),
    );
  }

  List<Widget> _tabNames() {
    return [
      for (int i = 0; i < _tabs.length - 1; i++) ...[
        HoroskopeButton(
          child: Text(_tabs[i].name),
          style: _tabs[i].style.call(_tabs[i].isSelected),
          onTap: () => _onTabTap(i),
        ),
        SizedBox(width: widget.spaceBetweenItems),
      ],
      HoroskopeButton(
        child: Text(_tabs.last.name),
        style: _tabs.last.style.call(_tabs.last.isSelected),
        onTap: () => _onTabTap(_tabs.length - 1),
      ),
    ];
  }
}
