import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hestia/core/routing/router.dart';
import 'package:hestia/core/routing/router.gr.dart';
import 'package:hestia/core/service_locator.dart';
import 'package:hestia/core/styles.dart';
import 'package:hestia/presentation/common/blocs/blocs.dart';
import 'package:hestia/presentation/common/views/widgets/log_in_form.dart';

@RoutePage()
class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  static const _headerHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    final double containerHeight = MediaQuery.of(context).size.height -
        MediaQuery.paddingOf(context).vertical -
        _headerHeight;

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (BuildContext context, AuthenticationState state) {
        if (state is AuthenticationSuccess) {
          services<AppRouter>()
              .replace(ResidentsLayoutRoute(userName: state.name));
        }
        if (state is AuthenticationFailure) {
          SnackBar errorSnackBar = SnackBar(
            content: Text(state.errorMessage),
          );

          ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _appAuthHeader(context),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 48.0,
                    vertical: 32.0,
                  ),
                  child: LogInForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _appAuthHeader(BuildContext context) {
    return Container(
      height: _headerHeight,
      color: ColorPalette.background,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hestia',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  'Inicia sesión y toma el control',
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
