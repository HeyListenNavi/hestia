import 'package:auto_route/auto_route.dart';
import 'package:hestia/core/routing/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType {
    return RouteType.material();
  }

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        page: AuthenticationRoute.page,
        initial: true,
      ),
      AutoRoute(
        page: ResidentsLayoutRoute.page,
        children: [
          AutoRoute(page: ResidentsHomeRoute.page),
          AutoRoute(page: ResidentsCommunityRoute.page),
          AutoRoute(page: ResidentsServicesRoute.page),
          AutoRoute(page: ResidentsAccountRoute.page),
        ],
      ),
      AutoRoute(
        page: GuardsLayoutRoute.page,
        children: [
          AutoRoute(page: GuardsHomeRoute.page),
          AutoRoute(page: GuardsCodesLogRoute.page)
        ],
      ),
    ];
  }
}