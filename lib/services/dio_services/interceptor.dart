import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tentwenty_task/services/dio_services/error_handlers.dart';

class ApiInterceptor extends Interceptor{
  ProviderReference? ref;
  ApiInterceptor({this.ref});
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    // SnackBarMessage(message: err.response!.data.toString());
    super.onError(err, handler);
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions,data: err.response?.data);
          case 401:
            throw UnauthorizedException(err.requestOptions,data: err.response?.data);
          case 404:
            throw NotFoundException(err.requestOptions,data: err.response?.data);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler)
  async{
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    print(response.data);
    // print()
    super.onResponse(response, handler);
  }

}