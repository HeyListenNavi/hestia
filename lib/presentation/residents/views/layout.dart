import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:hestia/presentation/common/views/app_layout.dart';
import 'package:hestia/presentation/common/views/widgets/main_container.dart';
import 'package:hestia/core/routing/router.gr.dart';
import 'package:hestia/core/styles.dart';

@RoutePage()
class ResidentsLayoutPage extends StatelessWidget {
  const ResidentsLayoutPage({
    super.key,
  });

  static const List<PageRouteInfo> routes = [
    ResidentsHomeRoute(),
    ResidentsCommunityRoute(),
    ResidentsServicesRoute(),
    ResidentsAccountRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      routes: routes,
      homeRoute: routes[0],
      layoutBuilder: (context, child) {
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
              actionIndex: routes.indexOf(ResidentsHomeRoute()),
              icon: Boxicons.bx_home,
            ),
            _bottomNavigationBarPage(
              router: tabsRouter,
              actionIndex: routes.indexOf(ResidentsCommunityRoute()),
              icon: Boxicons.bx_group,
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
              actionIndex: routes.indexOf(ResidentsServicesRoute()),
              icon: Boxicons.bx_wrench,
            ),
            _bottomNavigationBarPage(
              router: tabsRouter,
              actionIndex: routes.indexOf(ResidentsAccountRoute()),
              icon: Boxicons.bx_credit_card,
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
