import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hestia/apps/app.dart';
import 'package:hestia/apps/common/blocs/router/router_cubit.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
        return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return RouterCubit();
          },
        )
      ],
      child: App(),
    );
  }
}