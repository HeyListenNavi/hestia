import 'package:flutter_bloc/flutter_bloc.dart';

class HidePasswordCubit extends Cubit<bool> {
  HidePasswordCubit() : super(true);

  void toggle() {
    return emit(!state);
  }
}