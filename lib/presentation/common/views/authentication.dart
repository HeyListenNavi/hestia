import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hestia/core/routing/router.dart';
import 'package:hestia/core/routing/router.gr.dart';
import 'package:hestia/core/service_locator.dart';
import 'package:hestia/core/styles.dart';
import 'package:hestia/presentation/common/blocs/blocs.dart';
import 'package:hestia/presentation/common/views/widgets/log_in_form.dart';
import 'package:hestia/presentation/common/views/widgets/sign_up_form.dart';

@RoutePage()
class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  static const _headerHeight = 240.0;

  @override
  Widget build(BuildContext context) {
    final double containerHeight = MediaQuery.of(context).size.height -
        MediaQuery.paddingOf(context).vertical -
        _headerHeight;

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (BuildContext context, AuthenticationState state) {
        if (state is AuthenticationSuccess) {
          services<AppRouter>().replace(ResidentsLayoutRoute());
        }
      },
      child: Scaffold(
        body: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _appAuthHeader(context),
                _appAuthForm(context, containerHeight),
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
                  'Inicia sesión o registrate y toma el control',
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(child: Text('Iniciar Sesión')),
              Tab(child: Text('Registrarse')),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _appAuthForm(BuildContext context, double containerHeight) {
    return Expanded(
      child: TabBarView(
        children: [
          _tabVarViewContainer(
            height: containerHeight,
            child: LogInForm(),
          ),
          _tabVarViewContainer(
            height: containerHeight,
            child: SignUpForm(),
          )
        ],
      ),
    );
  }

  SingleChildScrollView _tabVarViewContainer(
      {required double height, required Widget child}) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: height,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 48.0,
            vertical: 32.0,
          ),
          child: child,
        ),
      ),
    );
  }
}
