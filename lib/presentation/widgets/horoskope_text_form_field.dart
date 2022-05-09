import 'package:flutter/material.dart';

abstract class HoroskopeTextFormFieldColorThemeData {
  Color get cursorColor;
}

class HoroskopeTextFormField extends TextFormField {
  final HoroskopeTextFormFieldColorThemeData colorThemeData;
  final String? labelText;

  HoroskopeTextFormField({
    Key? key,
    required this.colorThemeData,
    this.labelText,
    TextEditingController? controller,
    FormFieldValidator? validator,
    TextInputType? keyboardType,
    String? hintText,
    bool? enabled,
    VoidCallback? onTap,
    FocusNode? focusNode,
  }) : super(
          key: key,
          onTap: onTap,
          focusNode: focusNode,
          enabled: enabled,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: labelText,
            contentPadding: const EdgeInsets.all(16),
            hintText: hintText,
          ),
          validator: validator,
          controller: controller,
          cursorColor: colorThemeData.cursorColor,
        );
}
