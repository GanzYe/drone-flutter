import 'package:formz/formz.dart';

enum UasIDValidationError { invalid }

class UasID extends FormzInput<String, UasIDValidationError> {
  const UasID.pure() : super.pure('');

  const UasID.dirty([String value = '']) : super.dirty(value);

  static final RegExp _uasIDRegExp = RegExp(
    r'^([0-9A-Fa-f]{4})([0-9A-Fa-f]{1})[0-9A-F]{1,15}$',
    caseSensitive: false,
  );

  @override
  UasIDValidationError? validator(String value) {
    if (_uasIDRegExp.hasMatch(value)) {
      final String serialNumberLength = value[4];
      final int length = int.parse(serialNumberLength, radix: 16);
      final String serialNumber = value.substring(5);
      if (serialNumber.length == length) {
        return null;
      }
      return UasIDValidationError.invalid;
    } else {
      return UasIDValidationError.invalid;
    }
  }

  static String getError(UasIDValidationError value) {
    switch (value) {
      case UasIDValidationError.invalid:
        return 'Uas ID is not valid';
    }
  }
}
