import 'package:easy_localization/easy_localization.dart';
import 'package:formz/formz.dart';

enum EmailValidationError { empty, invalid }

class UasID extends FormzInput<String, EmailValidationError> {
  const UasID.pure() : super.pure('');

  const UasID.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    }

    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }

  static String getError(EmailValidationError value) {
    switch (value) {
      case EmailValidationError.empty:
        return 'cant be empty';
      case EmailValidationError.invalid:
        return 'Non valid Uas ID';
    }
  }
}
