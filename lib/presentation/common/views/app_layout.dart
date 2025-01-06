import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final List<PageRouteInfo> routes;
  final PageRouteInfo homeRoute;
  final Widget Function(BuildContext, Widget)? layoutBuilder;

  const AppLayout({
    super.key,
    required this.routes,
    required this.homeRoute,
    this.layoutBuilder,
  });

  @override
  Widget build(BuildContext context) {
    bool hasPopped = false;
    final int homeIndex = routes.indexOf(homeRoute);

    return AutoTabsRouter.pageView(
      routes: routes,
      builder: (context, child, pageController) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);
        return PopScope(
          canPop: tabsRouter.activeIndex == homeIndex,
          onPopInvokedWithResult: (didPop, result) {
            if (hasPopped) {
              tabsRouter.setActiveIndex(homeIndex);
              hasPopped = false;
              return;
            }

            tabsRouter.back();
            hasPopped = true;
          },
          child: layoutBuilder != null ? layoutBuilder!(context, child) : child,
        );
      },
    );
  }
}
