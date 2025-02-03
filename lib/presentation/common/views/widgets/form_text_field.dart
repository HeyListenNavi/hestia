import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hestia/core/styles.dart';
import 'package:hestia/core/text_validators.dart';
import 'package:hestia/presentation/common/blocs/hide_password/hide_password_cubit.dart';

class FormTextField extends StatelessWidget {
  final String name;
  final IconData? icon;
  final String? hintText;
  final bool obscureText;
  final bool isRequired;
  final List<FormFieldValidator<String>>? customValidators;
  final int lines;
  final bool isInContainer;

  const FormTextField({
    super.key,
    required this.name,
    this.icon,
    this.hintText,
    this.obscureText = false,
    this.isRequired = true,
    this.customValidators,
    this.lines = 1,
  }) : isInContainer = true;

  const FormTextField.white({
    super.key,
    required this.name,
    this.icon,
    this.hintText,
    this.obscureText = false,
    this.isRequired = true,
    this.customValidators,
    this.lines = 1,
  }) : isInContainer = false;

  @override
  Widget build(BuildContext context) {
    final List<FormFieldValidator<String>> validatorsList =
        isRequired ? [InputFieldValidators.required] : [];

    if (customValidators != null) {
      validatorsList.addAll(customValidators!);
    }

    if (obscureText) {
      return BlocProvider(
        create: (BuildContext context) {
          return HidePasswordCubit();
        },
        child: BlocBuilder<HidePasswordCubit, bool>(
          builder: (BuildContext context, bool state) {
            return _textField(context, state, validatorsList);
          },
        ),
      );
    }
    return _textField(context, false, validatorsList);
  }

  FormBuilderTextField _textField(BuildContext context, bool state,
      List<FormFieldValidator<String>> validatorsList) {
    return FormBuilderTextField(
      name: name,
      style: TypographyStyles.textTheme.bodyMedium,
      obscureText: obscureText ? state : false,
      maxLines: lines,
      minLines: lines,
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon) : null,
        hintText: hintText,
        fillColor: isInContainer ? ColorPalette.backgroundSecondary : ColorPalette.background,
        suffixIcon: obscureText
            ? IconButton(
                onPressed: () {
                  context.read<HidePasswordCubit>().toggle();
                },
                icon: state ? Icon(Boxicons.bx_hide) : Icon(Boxicons.bx_show),
              )
            : null,
      ),
      validator: FormBuilderValidators.compose(validatorsList),
    );
  }
}
