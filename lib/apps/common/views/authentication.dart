import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hestia/config/routing/router.gr.dart';
import 'package:hestia/config/styles.dart';

// TODO: Add Authentication
// NOTE: For now the Log In button allows you to see the Residents App and Sign Up button the Guards App 

@RoutePage()
class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

  Container _appAuthHeader(BuildContext context) {
    double authenticationHeaderHeight =
        MediaQuery.of(context).size.height * 0.30 -
            MediaQuery.of(context).padding.vertical;

    return Container(
      height: authenticationHeaderHeight,
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
    double containerHeight = MediaQuery.of(context).size.height * 0.70;

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

  Column _loginForm(BuildContext context) {
    return Column(
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
        TextField(
          style: TypographyStyles.textTheme.bodyMedium,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Boxicons.bx_envelope,
            ),
            hintText: 'Dirección de correo electrónico',
          ),
        ),
        SizedBox(
          height: 12,
        ),
        TextField(
          style: TypographyStyles.textTheme.bodyMedium,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Boxicons.bx_lock_alt,
            ),
            hintText: 'Contraseña',
          ),
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
          child: FilledButton(
            onPressed: () {
              context.router.replace(ResidentsLayout());
            },
            child: Text('Inciar Sesión'),
          ),
        ),
      ],
    );
  }

  Column _signupForm(BuildContext context) {
    return Column(
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
        TextField(
          style: TypographyStyles.textTheme.bodyMedium,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Boxicons.bx_user,
            ),
            hintText: 'Ingresa tu tu nombre',
          ),
        ),
        SizedBox(
          height: 12,
        ),
        TextField(
          style: TypographyStyles.textTheme.bodyMedium,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Boxicons.bx_envelope,
            ),
            hintText: 'Dirección de correo electrónico',
          ),
        ),
        SizedBox(
          height: 12,
        ),
        TextField(
          style: TypographyStyles.textTheme.bodyMedium,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Boxicons.bx_lock_alt,
            ),
            hintText: 'Crea una contraseña',
          ),
        ),
        SizedBox(
          height: 12,
        ),
        TextField(
          style: TypographyStyles.textTheme.bodyMedium,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Boxicons.bx_lock_alt,
            ),
            hintText: 'Confirma tu contraseña',
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Spacer(),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: FilledButton(
            onPressed: () {
              context.router.replace(GuardsLayout());
            },
            child: Text(
              'Crear Cuenta',
            ),
          ),
        ),
      ],
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
