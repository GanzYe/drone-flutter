import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberFormField extends StatefulWidget {
  const NumberFormField({
    super.key,
    this.errorText,
    required this.labelText,
    this.initialValue,
    this.textInputAction,
    required this.onChanged,
    required this.stringAsFixed,
    this.decimal = false,
    this.validator,
  });

  final String? errorText;
  final String labelText;
  final double? initialValue;
  final int stringAsFixed;
  final TextInputAction? textInputAction;
  final void Function(double) onChanged;
  final String? Function(String?)? validator;
  final bool decimal;

  @override
  NumberFormFieldState createState() => NumberFormFieldState();
}

class NumberFormFieldState extends State<NumberFormField> {
  late TextEditingController _textController = TextEditingController();

  late double? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
    if (_value != null) {
      _textController = TextEditingController(text: '$_value');
    }
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        key: const Key('numberInputKey'),
        controller: _textController,
        readOnly: false,
        inputFormatters: widget.decimal
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(
                    r'^\d+\.?\d{0,' + widget.stringAsFixed.toString() + '}')),
              ]
            : <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
          decimal: widget.decimal,
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
          errorText: widget.errorText,
        ),
        textInputAction: widget.textInputAction,
        onChanged: (value) {
          final double parsedValue = double.tryParse(value) ?? 0.0;
          setState(() {
            _value = parsedValue;
            widget.onChanged(_value!);
          });
        },
        validator: widget.validator,
      );
}
