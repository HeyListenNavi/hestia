import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hestia/core/api_endpoints.dart';
import 'package:hestia/core/service_locator.dart';
import 'package:hestia/features/authentication/data/models.dart';

class ApiDataSource {
  Future<Either> signUp(ApiParameters parameters) async {
    final Response response = await services<Dio>().post(
      ApiEndpoints.singUp,
      data: parameters.toJson(),
    );

    if (response.statusCode != 201) {
      return left(response.data);
    }

    return right(response.data);
  }

  Future<Either> logIn(ApiParameters parameters) async {
    final Response response = await services<Dio>().post(
      ApiEndpoints.logIn,
      data: parameters.toJson(),
    );

    if (response.statusCode != 201) {
      return left(response.data);
    }

    return right(response.data);
  }
}
