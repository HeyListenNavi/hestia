import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

abstract class TextValidators {
  static final FormFieldValidator<String> required =
      FormBuilderValidators.required(
    errorText: 'Este campo es obligatorio',
  );

  static final FormFieldValidator<String> firstName =
      FormBuilderValidators.firstName(
    errorText: 'Usa solo letras y comienza con mayúscula',
  );

  static final FormFieldValidator<String> lastName =
      FormBuilderValidators.lastName(
    errorText: 'Usa solo letras y comienza con mayúscula',
  );

  static final FormFieldValidator<String> email =
      FormBuilderValidators.email(
    errorText: 'Ingresa un correo válido (como ejemplo@dominio.com)',
  );

  static final FormFieldValidator<String> phone =
      FormBuilderValidators.phoneNumber(
    errorText: 'El número debe tener 10 dígitos',
  );

  static final FormFieldValidator<String> password =
      FormBuilderValidators.password(
    errorText:
        'Usa al menos 8 caracteres\nUna mayúscula\nUna minúscula\nUn número',
    minLength: 8,
    minLowercaseCount: 1,
    minNumberCount: 1,
    minUppercaseCount: 1,
    minSpecialCharCount: 0,
  );

  static FormFieldValidator<String> confirmPassword(String? password) {
    return (value) {
      if (value != password) {
        return 'Las contraseñas no coinciden';
      }
      return null;
    };
  }
}
