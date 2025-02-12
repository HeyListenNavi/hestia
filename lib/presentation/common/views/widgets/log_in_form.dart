import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hestia/core/styles.dart';
import 'package:hestia/features/authentication/data/models.dart';
import 'package:hestia/presentation/common/blocs/blocs.dart';
import 'package:hestia/presentation/common/views/widgets/form_text_field.dart';
import 'package:hestia/presentation/common/views/widgets/or_divider.dart';

final _logInFormKey = GlobalKey<FormBuilderState>();

class LogInForm extends StatelessWidget {
  const LogInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _logInFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12.0,
            children: [
              FilledButton.icon(
                onPressed: () {},
                style: ButtonStyles.secondaryButton,
                icon: CustomIcons.googleIcon,
                label: Text(
                  'Iniciar Sesión con Google',
                ),
              ),
              OrDivider(),
              FormTextField.white(
                name: 'email',
                hintText: 'Dirección de correo electrónico',
                icon: Boxicons.bx_envelope,
              ),
              FormTextField.white(
                name: 'password',
                hintText: 'Contraseña',
                icon: Boxicons.bx_lock,
                obscureText: true,
              ),
              TextButton(
                onPressed: () {},
                child: Text('¿Olvidaste tu contraseña?'),
              ),
            ],
          ),
          _logInButton(),
        ],
      ),
    );
  }

  BlocBuilder<AuthenticationBloc, AuthenticationState> _logInButton() {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        final isLoading = state is AuthenticationLoading;

        return FilledButton(
          onPressed: isLoading
              ? () {}
              : () {
                  if (_logInFormKey.currentState?.saveAndValidate() == true) {
                    final formValues = _logInFormKey.currentState?.value;

                    context.read<AuthenticationBloc>().add(
                          AuthenticationLogIn(
                            LogInParameters(
                              // email: formValues?['email'],
                              // password: formValues?['password'],
                              email: 'prince.kerluke@example.net',
                              password: 'contrasena',
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
              : Text('Iniciar Sesión'),
        );
      },
    );
  }
}
