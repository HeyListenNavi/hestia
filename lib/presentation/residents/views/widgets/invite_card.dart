import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hestia/core/routing/router.gr.dart';
import 'package:hestia/core/styles.dart';
import 'package:intl/intl.dart';

class InvitationCard extends StatelessWidget {
  final String title;
  final int numberOfUses;
  final DateTime creationDate;
  final String label;
  final bool isActive;

  const InvitationCard.active({
    super.key,
    required this.title,
    required this.numberOfUses,
    required this.creationDate,
  })  : isActive = true,
        label = 'Activo';

  const InvitationCard.cancelled({
    super.key,
    required this.title,
    required this.numberOfUses,
    required this.creationDate,
  })  : isActive = false,
        label = 'Cancelado';

  const InvitationCard.expired({
    super.key,
    required this.title,
    required this.numberOfUses,
    required this.creationDate,
  })  : isActive = false,
        label = 'Vencido';

  @override
  Widget build(BuildContext context) {
    final String date = DateFormat('dd-MM-yyyy hh:mm a').format(creationDate);

    return InkWell(
      onTap: () {
        context.router.push(ResidentsCommunityCodes());
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Usos: $numberOfUses',
                    style: TypographyStyles.textTheme.labelSmall,
                  ),
                  Text(
                    title,
                    style: TypographyStyles.textTheme.labelLarge,
                  ),
                  Text(
                    'Creado: $date',
                    style: TypographyStyles.textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            Container(
              width: 74.0,
              height: 28.0,
              decoration: BoxDecoration(
                color: isActive
                    ? ColorPalette.highlight
                    : ColorPalette.backgroundSecondary,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  label,
                  style: TypographyStyles.textTheme.labelSmall!.copyWith(
                    color: isActive
                        ? ColorPalette.foregroundLight
                        : ColorPalette.foregroundTertiary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
