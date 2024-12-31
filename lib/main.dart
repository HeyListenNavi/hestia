import 'package:flutter/material.dart';
import 'package:hestia/apps/app.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return App();
  }
}
