part of 'router_cubit.dart';

final GoRouter _unathenticatedRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return AuthenticationPage();
      },
    )
  ],
);

final GoRouter _residentsRouter = GoRouter(
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

final GoRouter _guardsRouter = GoRouter(
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
