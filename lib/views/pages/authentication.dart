import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hestia/utils.dart';
import 'package:hestia/views/pages/guards/home.dart';
import 'package:hestia/views/pages/residents/home.dart';

// TODO: Replace debug router
abstract class DebugRouter {
  static void debugGuards(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GuardsHome()),
    );
  }

  static void debugResidents(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ResidentsHome())
    );
  }
}

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
              authenticationHeader(context),
              authenticationForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Container authenticationHeader(BuildContext context) {
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

  SizedBox authenticationForm(BuildContext context) {
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
                    child: loginForm(context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 48.0,
                      vertical: 32.0,
                    ),
                    child: signupForm(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column loginForm(BuildContext context) {
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
        divider(),
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
            onPressed: () => DebugRouter.debugGuards(context),
            child: Text('Inciar Sesión'),
          ),
        ),
      ],
    );
  }

  Column signupForm(BuildContext context) {
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
        divider(),
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
            onPressed: () => DebugRouter.debugResidents(context),
            child: Text(
              'Crear Cuenta',
            ),
          ),
        ),
      ],
    );
  }

  Row divider() {
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
