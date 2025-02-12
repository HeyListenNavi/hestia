import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:hestia/presentation/common/views/app_layout.dart';
import 'package:hestia/core/routing/router.gr.dart';
import 'package:hestia/core/styles.dart';
import 'package:hestia/presentation/residents/views/widgets/header_app_bar.dart';
import 'package:hestia/presentation/residents/views/widgets/navigation_bottom_bar.dart';

@RoutePage()
class ResidentsLayoutPage extends StatelessWidget {
  final String userName;

  const ResidentsLayoutPage({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    final List<PageRouteInfo> routes = [
      ResidentsHomeRoute(userName: userName),
      CommunityShell(),
      ResidentsServicesRoute(),
      ResidentsAccountRoute(),
    ];

    return AppLayout(
      routes: routes,
      homeRoute: routes[0],
      layoutBuilder: (context, child) {
        return Scaffold(
          appBar: HeaderAppBar(),
          body: SafeArea(
            child: child,
          ),
          bottomNavigationBar: NavigationBottomBar(routes: routes),
        );
      },
    );
  }
}
