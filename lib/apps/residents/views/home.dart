import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hestia/apps/common/views/main_container.dart';

@RoutePage()
class ResidentsHomePage extends StatelessWidget {
  const ResidentsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 22.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MainContainer(
            child: Text('Resident\'s Home'),
          ),
        ],
      ),
    );
  }
}
