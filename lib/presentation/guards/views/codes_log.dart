import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hestia/presentation/common/views/main_container.dart';

@RoutePage()
class GuardsCodesLogPage extends StatelessWidget {
  const GuardsCodesLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 22.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MainContainer(
                  child: Text('History'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
