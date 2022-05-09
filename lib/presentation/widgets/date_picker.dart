import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/utils/build_context_ext.dart';
import 'package:horoskope/presentation/widgets/horoskope_button.dart';

abstract class CupertinoDatePickerColorThemeData
    implements HoroskopeBaseColorThemeData {
  Color get cupertinoDatePickerBackground;
}

abstract class CupertinoDatePickerButtonThemeData
    implements HoroskopeBaseButtonThemeData {}

typedef CupertinoDatePickerThemeData = HoroskopeThemeData<
    HoroskopeBaseTextThemeData,
    CupertinoDatePickerColorThemeData,
    CupertinoDatePickerButtonThemeData>;

Future<DateTime?> showHoroskopeDatePicker(
  BuildContext context, {
  required DateTime initialDate,
  required CupertinoDatePickerThemeData theme,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (_) => CupertinoTimePicker(
      initialDate: initialDate,
      theme: theme,
    ),
  );
}

class CupertinoTimePicker extends StatefulWidget {
  final DateTime initialDate;
  final CupertinoDatePickerThemeData theme;

  const CupertinoTimePicker({
    Key? key,
    required this.initialDate,
    required this.theme,
  }) : super(key: key);

  @override
  State<CupertinoTimePicker> createState() => _CupertinoTimePickerState();
}

class _CupertinoTimePickerState extends State<CupertinoTimePicker> {
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
                  _buildTimePicker(),
                  const SizedBox(height: 12),
                  _buildSelectButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimePicker() {
    return SizedBox(
      height: 200,
      child: CupertinoDatePicker(
        initialDateTime: _date,
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (date) => _date = date,
        use24hFormat: true,
      ),
    );
  }

  Widget _buildSelectButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: HoroskopeButton(
        child: Text(context.localizations.select),
        style: widget.theme.buttonTheme.flat,
        onTap: () => Navigator.of(context).pop(_date),
      ),
    );
  }
}
