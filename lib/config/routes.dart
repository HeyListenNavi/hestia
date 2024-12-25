import 'package:go_router/go_router.dart';
import 'package:hestia/apps/guards/views/pages.dart';
import 'package:hestia/apps/residents/views/pages.dart';
import 'package:hestia/apps/common/views/authentication.dart';

final GoRouter unathenticatedRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return AuthenticationPage();
      },
    )
  ],
);

final GoRouter residentsRouter = GoRouter(
  initialLocation: '/residents/home',
  routes: [
    GoRoute(
      path: '/residents/home',
      builder: (context, state) {
        return ResidentsHome();
      },
    ),
    GoRoute(
      path: '/residents/community',
      builder: (context, state) {
        return ResidentsCommunityPage();
      },
    ),
    GoRoute(
      path: '/residents/services',
      builder: (context, state) {
        return ResidentsServicesPage();
      },
    ),
    GoRoute(
      path: '/residents/account',
      builder: (context, state) {
        return ResidentsAccountPage();
      },
    ),
  ],
);

final GoRouter guardsRouter = GoRouter(
  initialLocation: '/guards/home',
  routes: [
    GoRoute(
      path: '/guards/home',
      builder: (context, state) {
        return GuardsHome();
      },
    ),
  ],
);
