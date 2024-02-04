import 'package:flutter/material.dart';

class NameTextFormField extends StatelessWidget {
  const NameTextFormField({
    Key? key,
    this.errorText,
    this.textInputAction,
    required this.labelText,
    required this.onChanged,
    this.validator,
    this.readOnly,
  }) : super(key: key);
  final String? errorText;
  final bool? readOnly;
  final String labelText;
  final TextInputAction? textInputAction;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) => TextFormField(
        key: const Key('nameInputKey'),
        readOnly: readOnly ?? false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: labelText,
          errorText: errorText,
        ),
        textInputAction: textInputAction,
        onChanged: onChanged,
      );
}
