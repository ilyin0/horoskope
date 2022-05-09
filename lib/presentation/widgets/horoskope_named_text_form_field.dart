import 'package:flutter/material.dart';
import 'package:horoskope/presentation/widgets/horoskope_text_form_field.dart';

abstract class HoroskopeNamedTextFormFieldTextThemeData {
  TextStyle get formFieldName;
}

class HoroskopeNamedTextFormField extends StatelessWidget {
  final String name;
  final HoroskopeNamedTextFormFieldTextThemeData? textTheme;
  final HoroskopeTextFormField textFormField;

  const HoroskopeNamedTextFormField({
    Key? key,
    required this.name,
    required this.textFormField,
    this.textTheme,
  }) : super(key: key);

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
        textFormField,
      ],
    );
  }
}
