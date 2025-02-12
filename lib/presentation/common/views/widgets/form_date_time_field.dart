import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hestia/core/styles.dart';
import 'package:hestia/core/text_validators.dart';
import 'package:intl/intl.dart';

class FormDateTimeField extends StatelessWidget {
  final String name;
  final IconData? icon;
  final String? hintText;
  final bool isRequired;
  final List<FormFieldValidator<DateTime>>? customValidators;
  final InputType inputType;

  const FormDateTimeField({
    super.key,
    required this.name,
    this.icon,
    this.hintText,
    this.isRequired = true,
    this.customValidators,
    this.inputType = InputType.date,
  });

  @override
  Widget build(BuildContext context) {
    final List<FormFieldValidator<DateTime>> validatorsList =
        isRequired ? [InputFieldValidators.required] : [];

    if (customValidators != null) {
      validatorsList.addAll(customValidators!);
    }

    IconData sufixIcon =
        inputType == InputType.time ? Boxicons.bx_time : Boxicons.bx_calendar;

    return FormBuilderDateTimePicker(
      name: name,
      style: TypographyStyles.textTheme.bodyMedium,
      inputType: inputType,
      format: DateFormat('yyyy-MM-dd hh:mm a'),
      locale: Locale('en', 'US'),
      confirmText: 'Seleccionar',
      helpText: 'Selecciona la fecha de entrada',
      
      validator: FormBuilderValidators.compose(validatorsList),
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon) : null,
        hintText: hintText,
        suffixIcon: Icon(sufixIcon),
      ),
    );
  }
}
