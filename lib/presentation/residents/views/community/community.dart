import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:hestia/core/styles.dart';
import 'package:hestia/presentation/common/views/widgets/main_container.dart';
import 'package:hestia/presentation/residents/views/widgets/invite_card.dart';

@RoutePage()
class ResidentsCommunityPage extends StatelessWidget {
  const ResidentsCommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<InvitationCard> invitations = [
      InvitationCard.expired(
        title: 'Titulo de la invitación',
        creationDate: DateTime(1980, 2, 3, 4, 5),
        numberOfUses: 3,
      ),
      InvitationCard.active(
        title: 'Titulo de la invitación',
        creationDate: DateTime(1980, 2, 3, 4, 5),
        numberOfUses: 3,
      ),
      InvitationCard.cancelled(
        title: 'Titulo de la invitación',
        creationDate: DateTime(1980, 2, 3, 4, 5),
        numberOfUses: 3,
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 22.0,
      ),
      child: Column(
        spacing: 22.0,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Comunidad',
            style: TypographyStyles.textTheme.headlineLarge,
          ),
          _invitationsHistory(invitations),
        ],
      ),
    );
  }

  MainContainer _invitationsHistory(List<InvitationCard> invitations) {
    return MainContainer(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Historial de Invitaciones',
                style: TypographyStyles.textTheme.headlineMedium,
              ),
              Icon(
                Boxicons.bx_chevron_right,
              )
            ],
          ),
          Column(
            spacing: 6.0,
            children: invitations.isEmpty
                ? [
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      height: 80.0,
                      child: Center(
                        child: Text(
                          'No cuentas con ninguna invitacion activa',
                          style: TypographyStyles.textTheme.headlineSmall,
                        ),
                      ),
                    ),
                  ]
                : invitations,
          )
        ],
      ),
    );
  }
}
