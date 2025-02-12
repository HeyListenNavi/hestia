part of 'create_invitation_bloc.dart';

sealed class CreateInvitationState {}

class CreateInvitationInitial extends CreateInvitationState {}

class CreateInvitationLoading extends CreateInvitationState {}

class CreateInvitationSuccess extends CreateInvitationState {
  final String qrCode;
  CreateInvitationSuccess(this.qrCode);
}

class CreateInvitationFailure extends CreateInvitationState {
  final String errorMessage;
  CreateInvitationFailure(this.errorMessage);
}