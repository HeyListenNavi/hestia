import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hestia/core/service_locator.dart';
import 'package:hestia/presentation/app.dart';
import 'package:hestia/presentation/common/blocs/blocs.dart';

void main() async {
  await initializeServices();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) {
            return AuthenticationBloc();
          },
        ),
      ],
      child: App(),
    );
  }
}
