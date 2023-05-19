import 'package:dio/dio.dart';
import 'package:safee/base/error/exceptions/api_exception.dart';
import 'package:safee/base/error/exceptions/app_exception.dart';

Future handleAPIError(dynamic error) {
  if (error is DioError) {
    DioError dioError = error;
    switch (dioError.type) {
      case DioErrorType.badResponse:
        throw ApiException(
            message:
                dioError.message ?? 'Something\'s wrong. Please try again.');

      case DioErrorType.connectionTimeout:
        throw ApiException(
            message:
                dioError.message ?? 'Connection timeout. Please try again. ');
      default:
        throw const ApiException(message: 'Something is wrong');
    }
  } else {
    throw const AppException(
        message: 'Not an API Error, but something\'s wrong. Please try again.');
  }
}
