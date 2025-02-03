import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:hestia/core/styles.dart';
import 'package:hestia/presentation/common/views/widgets/navigation_bottom_bar_page.dart';
import 'package:hestia/presentation/residents/views/create/action_menu.dart';

class NavigationBottomBar extends StatelessWidget {
  final List<PageRouteInfo> routes;

  const NavigationBottomBar({
    super.key,
    required this.routes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPalette.background,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavigationBottomBarPage(
                actionIndex: routes.indexOf(routes[0]),
                icon: Boxicons.bx_home,
              ),
              NavigationBottomBarPage(
                actionIndex: routes.indexOf(routes[1]),
                icon: Boxicons.bx_group,
              ),
              SizedBox(
                width: 48.0,
                height: 48.0,
                child: IconButton.filled(
                  onPressed: () {
                    showModalBottomSheet(context: context, builder: (BuildContext context) {
                      return ActionsMenu();
                    }
                    );
                  },
                  icon: Icon(Boxicons.bx_plus),
                ),
              ),
              NavigationBottomBarPage(
                actionIndex: routes.indexOf(routes[2]),
                icon: Boxicons.bx_wrench,
              ),
              NavigationBottomBarPage(
                actionIndex: routes.indexOf(routes[3]),
                icon: Boxicons.bx_credit_card,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
