import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:hestia/apps/common/widgets/main_container.dart';

class ResidentsHome extends StatelessWidget {
  const ResidentsHome({super.key});

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
                  child: Text('Resident\'s Home'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Boxicons.bx_home_alt),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Boxicons.bx_group),
            label: 'Comunidad',
          ),
          BottomNavigationBarItem(
            icon: Icon(Boxicons.bx_plus),
            label: 'Crear',
          ),
          BottomNavigationBarItem(
            icon: Icon(Boxicons.bx_wrench),
            label: 'Servicios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Boxicons.bx_credit_card),
            label: 'Cuenta',
          ),
        ],
      ),
    );
  }
}
