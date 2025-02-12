import 'package:dartz/dartz.dart';
import 'package:hestia/core/service_locator.dart';
import 'package:hestia/features/invitation_management/data/data_sources.dart';
import 'package:hestia/features/invitation_management/data/models.dart';
import 'package:hestia/features/invitation_management/domain/repository.dart';

class InvitationManagementRepositoryImpl extends InvitationManagementRepository {
  
  @override
  Future<Either> createInvitation(InvitationModel parameters) async {
    Either result = await services<InvitationManagementApiDataSource>().createInvitation(parameters);

    return result.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final code = CodeModel.fromJson(data).toEntity();
        return Right(code);
      }
    );
  }

  @override
  Future<Either> cancelInvitation() {
    // TODO: implement cancelInvitation
    throw UnimplementedError();
  }

  @override
  Future<Either> invitationList() {
    // TODO: implement invitationList
    throw UnimplementedError();
  }

  @override
  Future<Either> readInvitation() {
    // TODO: implement readInvitation
    throw UnimplementedError();
  }
}