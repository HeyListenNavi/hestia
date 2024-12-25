part of 'router_cubit.dart';

enum UserType {
  resident,
  guard,
  unauthenticated,
}

class RouterState {
  final GoRouter router;
  final UserType userType;

  RouterState({
    required this.router,
    required this.userType,
  });
}