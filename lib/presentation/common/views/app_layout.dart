import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hestia/presentation/common/blocs/blocs.dart';

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
    final int homeIndex = routes.indexOf(homeRoute);

    return BlocBuilder<HasPoppedCubit, bool>(
      builder: (BuildContext context, bool state) {
        return AutoTabsRouter.pageView(
          routes: routes,
          builder: (context, child, pageController) {
            final TabsRouter tabsRouter = AutoTabsRouter.of(context);
            return PopScope(
              canPop: tabsRouter.activeIndex == homeIndex,
              onPopInvokedWithResult: (didPop, result) {
                if (state) {
                  tabsRouter.setActiveIndex(homeIndex);
                  context.read<HasPoppedCubit>().toggle();
                  return;
                }

                tabsRouter.back();
                context.read<HasPoppedCubit>().toggle();
              },
              child: layoutBuilder != null
                  ? layoutBuilder!(context, child)
                  : child,
            );
          },
        );
      },
    );
  }
}
