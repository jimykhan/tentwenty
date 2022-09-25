import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class BadRequestException extends DioError {
  dynamic data;
  BadRequestException(RequestOptions r, {this.data}) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request ';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return "unknownError";
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  dynamic? data;
  UnauthorizedException(RequestOptions r, {this.data}) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  dynamic? data;
  NotFoundException(RequestOptions r, {this.data}) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return "noConnection";
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}