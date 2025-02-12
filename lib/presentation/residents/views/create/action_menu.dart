import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:hestia/core/styles.dart';
import 'package:hestia/presentation/residents/views/create/actions/create_invite/create_invite.dart';
import 'package:hestia/presentation/common/views/widgets/big_icon_button.dart';

class ActionsMenu extends StatelessWidget {
  const ActionsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 12.0,
      ),
      child: Column(
        spacing: 22.0,
        children: [
          Text(
            '¿Qué necesitas?',
            style: TypographyStyles.textTheme.headlineLarge,
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  BigIconButton(
                    onPressed: () {
                      _createInvite(context);
                    },
                    icon: Boxicons.bx_plus,
                    text: 'Crear Invitación',
                  ),
                  BigIconButton(
                    onPressed: () {},
                    text: 'Registrar Incidencia',
                    icon: Boxicons.bx_edit,
                  ),
                ],
              ),
              TableRow(
                children: [
                  BigIconButton(
                    onPressed: () {},
                    text: 'Reservar Área',
                    icon: Boxicons.bx_calendar,
                  ),
                  BigIconButton(
                    onPressed: () {},
                    text: 'Solicitar Servicio',
                    icon: Boxicons.bx_wrench,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  _createInvite(BuildContext context) {
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return CreateInvite();
      },
    );
  }
}
