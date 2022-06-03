import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/themes/styles/horoskope_button_style.dart';
import 'package:horoskope/presentation/utils/extensions/build_context_ext.dart';
import 'package:horoskope/presentation/widgets/horoskope_button.dart';

abstract class CupertinoDatePickerColorThemeData
    implements HoroskopeBaseColorThemeData {
  Color get cupertinoDatePickerBackground;
}

typedef CupertinoDatePickerThemeData = HoroskopeThemeData<
    HoroskopeBaseTextThemeData,
    CupertinoDatePickerColorThemeData,
    HoroskopeBaseButtonThemeData>;

Future<DateTime?> showHoroskopeDatePicker(
  BuildContext context, {
  required DateTime initialDate,
  required CupertinoDatePickerThemeData theme,
  required PickerMode mode,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (_) => HoroskopeCupertinoDateTimePicker(
      initialDate: initialDate,
      theme: theme,
      mode: mode,
    ),
  );
}

class HoroskopeCupertinoDateTimePicker extends StatefulWidget {
  final DateTime initialDate;
  final CupertinoDatePickerThemeData theme;
  final PickerMode mode;

  const HoroskopeCupertinoDateTimePicker({
    Key? key,
    required this.initialDate,
    required this.theme,
    required this.mode,
  }) : super(key: key);

  @override
  State<HoroskopeCupertinoDateTimePicker> createState() =>
      _HoroskopeCupertinoDateTimePickerState();
}

class _HoroskopeCupertinoDateTimePickerState
    extends State<HoroskopeCupertinoDateTimePicker> {
  late DateTime _date;

  @override
  void initState() {
    super.initState();
    _date = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.theme.colorTheme.cupertinoDatePickerBackground,
      child: SafeArea(
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  _Picker(
                    mode: widget.mode.cupertinoDatePickerMode,
                    initialDateTime: _date,
                    onDateTimeChanged: (date) => _date = date,
                  ),
                  const SizedBox(height: 12),
                  _SelectButton(
                    style: widget.theme.buttonTheme.flat,
                    onTap: () => Navigator.of(context).pop(_date),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum PickerMode { date, time }

extension on PickerMode {
  CupertinoDatePickerMode get cupertinoDatePickerMode {
    switch (this) {
      case PickerMode.date:
        return CupertinoDatePickerMode.date;
      case PickerMode.time:
        return CupertinoDatePickerMode.time;
    }
  }
}

class _Picker extends StatelessWidget {
  final CupertinoDatePickerMode mode;
  final DateTime initialDateTime;
  final void Function(DateTime)? onDateTimeChanged;

  const _Picker({
    Key? key,
    required this.mode,
    required this.initialDateTime,
    this.onDateTimeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CupertinoDatePicker(
        initialDateTime: initialDateTime,
        mode: mode,
        onDateTimeChanged: onDateTimeChanged ?? (_) {},
        use24hFormat: true,
      ),
    );
  }
}

class _SelectButton extends StatelessWidget {
  final HoroskopeButtonStyle style;
  final VoidCallback? onTap;

  const _SelectButton({
    Key? key,
    required this.style,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: HoroskopeButton(
        child: Text(context.localizations.select),
        style: style,
        onTap: onTap,
      ),
    );
  }
}
