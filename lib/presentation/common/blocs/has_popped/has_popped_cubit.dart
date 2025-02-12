import 'package:flutter_bloc/flutter_bloc.dart';

class HasPoppedCubit extends Cubit<bool> {
  HasPoppedCubit() : super(false);

  void toggle() {
    return emit(!state);
  }
}