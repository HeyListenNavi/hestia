import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hestia/core/service_locator.dart';
import 'package:hestia/features/invitation_management/data/models.dart';
import 'package:hestia/features/invitation_management/domain/use_cases.dart';

part 'create_invitation_event.dart';
part 'create_invitation_state.dart';

class CreateInvitationBloc extends Bloc<CreateInvitationEvent, CreateInvitationState> {
  CreateInvitationBloc() : super(CreateInvitationInitial()) {
    on<CreateInvitationSubmit>(
      (event, emit) async {
        emit(CreateInvitationLoading());

        final Either response = await services<CreateInvitationUseCase>().call(event.invitation);
        response.fold(
          (error) {
            emit(CreateInvitationFailure(error));
          },
          (data) {
            emit(CreateInvitationSuccess(data.code));
          }
        );
      }
    );
  }
}