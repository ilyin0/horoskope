import 'package:flutter/material.dart';
import 'package:horoskope/presentation/widgets/horoskope_text_form_field.dart';

abstract class HoroskopeNamedTextFormFieldTextThemeData {
  TextStyle get formFieldName;
}

class HoroskopeNamedTextFormField extends HoroskopeTextFormField {
  final String name;
  final HoroskopeNamedTextFormFieldTextThemeData? textTheme;

  const HoroskopeNamedTextFormField({
    Key? key,
    required this.name,
    required HoroskopeTextFormFieldColorThemeData colorTheme,
    this.textTheme,
    FormFieldValidator? validator,
    TextInputType? keyboardType,
    String? labelText,
  }) : super(
          key: key,
          colorThemeData: colorTheme,
          validator: validator,
          keyboardType: keyboardType,
          labelText: labelText,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            name,
            style: textTheme?.formFieldName,
          ),
        ),
        const SizedBox(height: 12),
        super.build(context),
      ],
    );
  }
}
