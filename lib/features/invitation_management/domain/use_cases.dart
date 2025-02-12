import 'package:dartz/dartz.dart';
import 'package:hestia/features/invitation_management/data/models.dart';
import 'package:hestia/features/invitation_management/domain/repository.dart';

class CreateInvitationUseCase {
  final InvitationManagementRepository repository;

  CreateInvitationUseCase({required this.repository});

  Future<Either> call(InvitationModel parameters) async {
    return repository.createInvitation(parameters);
  }
}