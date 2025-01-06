import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hestia/core/styles.dart';
import 'package:hestia/core/text_validators.dart';
import 'package:hestia/features/authentication/data/models.dart';
import 'package:hestia/presentation/common/blocs/blocs.dart';
import 'package:hestia/presentation/common/views/widgets/form_text_field.dart';
import 'package:hestia/presentation/common/views/widgets/or_divider.dart';

final _signUpFormKey = GlobalKey<FormBuilderState>();

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _signUpFormKey,
      child: Column(
        spacing: 22.0,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 12.0,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FilledButton.icon(
                onPressed: () {},
                style: ButtonStyles.secondaryButton,
                icon: SvgPicture.asset(
                  'assets/google_logo.svg',
                  width: 20.0,
                  height: 20.0,
                ),
                label: Text(
                  'Registrarse con Google',
                ),
              ),
              OrDivider(),
              FormTextField(
                name: 'name',
                hintText: 'Ingresa tu nombre',
                icon: Boxicons.bx_user,
                customValidators: [TextValidators.firstName],
              ),
              FormTextField(
                name: 'secondName',
                hintText: 'Ingresa tu apellido',
                icon: Boxicons.bx_user,
                customValidators: [TextValidators.lastName],
              ),
              FormTextField(
                name: 'email',
                hintText: 'Dirección de correo electrónico',
                icon: Boxicons.bx_envelope,
                customValidators: [TextValidators.email],
              ),
              FormTextField(
                name: 'phoneNumber',
                hintText: 'Ingresa tu número teléfonico',
                icon: Boxicons.bx_phone,
                customValidators: [TextValidators.phone],
              ),
              FormTextField(
                name: 'password',
                hintText: 'Crea un contraseña',
                icon: Boxicons.bx_lock_alt,
                obscureText: true,
                customValidators: [TextValidators.password],
              ),
              FormTextField(
                name: 'confirmPassword',
                hintText: 'Confirma tu contraseña',
                icon: Boxicons.bx_lock_alt,
                obscureText: true,
                customValidators: [
                  TextValidators.confirmPassword(
                    _signUpFormKey.currentState?.value['password'],
                  ),
                ],
              ),
            ],
          ),
          _signUpButton(),
        ],
      ),
    );
  }

  BlocBuilder<AuthenticationBloc, AuthenticationState> _signUpButton() {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        final isLoading = state is AuthenticationLoading;

        return FilledButton(
          onPressed: isLoading
              ? () {}
              : () {
                  if (_signUpFormKey.currentState?.saveAndValidate() == true) {
                    final formValues = _signUpFormKey.currentState?.value;

                    context.read<AuthenticationBloc>().add(
                          AuthenticationSignUp(
                            SignUpParameters(
                              email: formValues?['email'],
                              name: formValues?['name'],
                              secondName: formValues?['secondName'],
                              password: formValues?['password'],
                              phoneNumber: formValues?['phoneNumber'],
                            ),
                          ),
                        );
                  }
                },
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: ColorPalette.foregroundLight,
                    strokeWidth: 2,
                  ),
                )
              : Text('Crear Cuenta'),
        );
      },
    );
  }
}
