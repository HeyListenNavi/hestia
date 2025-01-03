import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hestia/core/routing/router.gr.dart';
import 'package:hestia/core/styles.dart';
import 'package:hestia/features/authentication/data/models.dart';
import 'package:hestia/presentation/common/blocs/blocs.dart';

// TODO: Add Authentication
// NOTE: For now the Log In button allows you to see the Residents App and Sign Up button the Guards App
final _logInFormKey = GlobalKey<FormBuilderState>();
final _signUpFormKey = GlobalKey<FormBuilderState>();

@RoutePage()
class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (BuildContext context, AuthenticationState state) {
        if (state is AuthenticationSuccess) {
          context.router.replace(ResidentsLayout());
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _appAuthHeader(context),
                _appAuthForm(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _appAuthHeader(BuildContext context) {
    return Container(
      height: 180.0,
      color: ColorPalette.background,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 48.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hestia',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              'Inicia sesión o registrate y toma el control',
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _appAuthForm(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.vertical -
        180.0;

    return SizedBox(
      height: containerHeight,
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: [
            Container(
              color: ColorPalette.background,
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Text('Iniciar Sesión'),
                  ),
                  Tab(
                    child: Text('Registrarse'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 48.0,
                      vertical: 32.0,
                    ),
                    child: _loginForm(context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 48.0,
                      vertical: 32.0,
                    ),
                    child: _signupForm(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  FormBuilder _loginForm(BuildContext context) {
    return FormBuilder(
      key: _logInFormKey,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {},
              style: ButtonStyles.secondaryButton,
              icon: SvgPicture.asset(
                'assets/google_logo.svg',
                width: 20.0,
                height: 20.0,
              ),
              label: Text(
                'Iniciar Sesión con Google',
              ),
            ),
          ),
          _divider(),
          FormBuilderTextField(
            name: 'email',
            style: TypographyStyles.textTheme.bodyMedium,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Boxicons.bx_envelope,
              ),
              hintText: 'Dirección de correo electrónico',
            ),
            validator: FormBuilderValidators.required(),
          ),
          SizedBox(
            height: 12,
          ),
          FormBuilderTextField(
            name: 'password',
            style: TypographyStyles.textTheme.bodyMedium,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Boxicons.bx_lock_alt,
              ),
              hintText: 'Contraseña',
            ),
            validator: FormBuilderValidators.required(),
          ),
          SizedBox(
            height: 12,
          ),
          TextButton(
            onPressed: () {},
            child: Text('¿Olvidaste tu contraseña?'),
          ),
          Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: _logInButton(),
          )
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
                              email: formValues?['email'],
                              password: formValues?['password'],
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

  FormBuilder _signupForm(BuildContext context) {
    return FormBuilder(
      key: _signUpFormKey,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
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
          ),
          _divider(),
          FormBuilderTextField(
            name: 'name',
            style: TypographyStyles.textTheme.bodyMedium,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Boxicons.bx_user,
              ),
              hintText: 'Ingresa tu nombre',
            ),
            validator: FormBuilderValidators.required(),
          ),
          SizedBox(
            height: 12,
          ),
          FormBuilderTextField(
            name: 'secondName',
            style: TypographyStyles.textTheme.bodyMedium,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Boxicons.bx_user,
              ),
              hintText: 'Ingresa tu apellido',
            ),
            validator: FormBuilderValidators.required(),
          ),
          SizedBox(
            height: 12,
          ),
          FormBuilderTextField(
            name: 'email',
            style: TypographyStyles.textTheme.bodyMedium,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Boxicons.bx_envelope,
              ),
              hintText: 'Dirección de correo electrónico',
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          FormBuilderTextField(
            name: 'phoneNumber',
            style: TypographyStyles.textTheme.bodyMedium,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Boxicons.bx_phone,
              ),
              hintText: 'Ingresa tu número teléfonico',
            ),
            validator: FormBuilderValidators.required(),
          ),
          SizedBox(
            height: 12,
          ),
          FormBuilderTextField(
            name: 'password',
            style: TypographyStyles.textTheme.bodyMedium,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Boxicons.bx_lock_alt,
              ),
              hintText: 'Crea una contraseña',
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.password(
                minLength: 8,
                minLowercaseCount: 1,
                minNumberCount: 1,
                minUppercaseCount: 1,
              )
            ]),
          ),
          SizedBox(
            height: 12,
          ),
          FormBuilderTextField(
            name: 'confirmPassword',
            style: TypographyStyles.textTheme.bodyMedium,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Boxicons.bx_lock_alt,
              ),
              hintText: 'Confirma tu contraseña',
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              (value) {
                if (value !=
                    _signUpFormKey.currentState?.fields['password']?.value) {
                  return 'Passwords don\'t match';
                }
                return null;
              }
            ]),
          ),
          SizedBox(
            height: 12,
          ),
          Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: _signUpButton(),
          )
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

  Row _divider() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: ColorPalette.foregroundTertiary,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Text(
            "o",
            style: TextStyle(
              color: ColorPalette.foregroundTertiary,
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: ColorPalette.foregroundTertiary,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
