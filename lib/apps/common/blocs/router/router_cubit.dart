import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hestia/config/routes.dart';

part 'router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit()
      : super(
          RouterState(
            router: unathenticatedRouter,
            userType: UserType.unauthenticated,
          ),
        );

  void setUser(UserType userType) {
    final GoRouter userRouter;

    switch (userType) {
      case UserType.resident:
        userRouter = residentsRouter;
        break;
      case UserType.guard:
        userRouter = guardsRouter;
        break;
      case UserType.unauthenticated:
        userRouter = unathenticatedRouter;
        break;
    }

    emit(
      RouterState(
        router: userRouter,
        userType: userType,
      ),
    );
  }

  void navigateBack() {
    state.router.pop();
  }

  void navigateTo(String path) {
    state.router.go(path);
  }
}
