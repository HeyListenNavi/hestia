part of 'create_invitation_bloc.dart';

sealed class CreateInvitationEvent {}

final class CreateInvitationSubmit extends CreateInvitationEvent {
  final InvitationModel invitation;

  CreateInvitationSubmit(this.invitation);
}