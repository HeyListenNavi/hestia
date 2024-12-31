import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:hestia/apps/common/views/app_layout.dart';
import 'package:hestia/apps/common/views/main_container.dart';
import 'package:hestia/config/routing/router.gr.dart';
import 'package:hestia/config/styles.dart';

@RoutePage()
class GuardsLayout extends StatelessWidget {
  const GuardsLayout({
    super.key,
  });

  static const List<PageRouteInfo> routes = [
    GuardsHomeRoute(),
    GuardsCodesLogRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      routes: routes,
      homeRoute: routes[0],
      layout: (context, child) {
        return Scaffold(
          appBar: _headerAppBar(),
          body: SafeArea(
            child: child,
          ),
          bottomNavigationBar: _bottomNavigationBar(context),
        );
      },
    );
  }

PreferredSize _headerAppBar() {
    double toolbarHeight = 72.0;

    return PreferredSize(
      preferredSize: Size.fromHeight(toolbarHeight),
      child: Container(
        color: ColorPalette.background,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: AppBar(
          toolbarHeight: toolbarHeight,
          title: Text(
            'Hestia',
          ),
          actions: [
            IconButton(
              icon: Icon(Boxicons.bx_bell),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  SafeArea _bottomNavigationBar(BuildContext context) {
    TabsRouter tabsRouter = context.tabsRouter;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _bottomNavigationBarPage(
              router: tabsRouter,
              actionIndex: routes.indexOf(GuardsHomeRoute()),
              icon: Boxicons.bx_home,
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return MainContainer(
                      child: Text('Maybe i wasn\'t there'),
                    );
                  },
                );
              },
              icon: Icon(Boxicons.bx_plus),
            ),
            _bottomNavigationBarPage(
              router: tabsRouter,
              actionIndex: routes.indexOf(GuardsCodesLogRoute()),
              icon: Boxicons.bx_calendar,
            ),
          ],
        ),
      ),
    );
  }

  IconButton _bottomNavigationBarPage({
    required TabsRouter router,
    required int actionIndex,
    required IconData icon,
  }) {
    return IconButton(
      onPressed: () {
        router.setActiveIndex(actionIndex);
      },
      icon: Icon(
        icon,
        color: router.activeIndex == actionIndex
            ? ColorPalette.highlight
            : ColorPalette.foregroundTertiary,
      ),
    );
  }
}
