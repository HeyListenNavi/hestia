import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hestia/core/api_endpoints.dart';
import 'package:hestia/core/service_locator.dart';
import 'package:hestia/features/invitation_management/data/models.dart';

class InvitationManagementApiDataSource {
  Future<Either> createInvitation(InvitationModel invitation) async {
    String? token = await services<FlutterSecureStorage>()
        .read(key: 'authentication_token');

    if (token == null) {
      return left('Ha ocurrido un error de autenticacion');
    }

    services<Dio>().options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final Response response = await services<Dio>().post(
      ApiEndpoints.code,
      data: invitation.toJson(),
    );

    if (response.statusCode != 201) {
      return left(response.data['message']);
    }

    return right(response.data);
  }
}
