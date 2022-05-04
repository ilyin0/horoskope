import 'package:flutter/material.dart';

abstract class HoroskopeTextFormFieldColorThemeData {
  Color get cursorColor;
}

class HoroskopeTextFormField extends StatelessWidget {
  final FormFieldValidator? validator;
  final TextInputType? keyboardType;
  final String? labelText;
  final HoroskopeTextFormFieldColorThemeData colorThemeData;

  const HoroskopeTextFormField({
    Key? key,
    required this.colorThemeData,
    this.validator,
    this.keyboardType,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: colorThemeData.cursorColor,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
