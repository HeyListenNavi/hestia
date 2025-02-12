import 'package:dartz/dartz.dart';
import 'package:hestia/features/invitation_management/data/models.dart';

abstract class InvitationManagementRepository {
  Future<Either> createInvitation(InvitationModel parameters);
  Future<Either> readInvitation();
  Future<Either> invitationList();
  Future<Either> cancelInvitation();
}