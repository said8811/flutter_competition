import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_competition/service/country_api_service/custom_exceptions.dart';

class ApiClient {
  ApiClient() {
    _init();
  }

  late Dio dio;

  _init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://third-exam.free.mockoapp.net",
        connectTimeout: 25000,
        receiveTimeout: 20000,
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
        //! error
        onError: (DioError error, ErrorInterceptorHandler handler) {
      print("error");
      switch (error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
          throw DeadlineExceededException(error.requestOptions);
        case DioErrorType.receiveTimeout:
          throw ReceiveTimeOutException(error.requestOptions);
        case DioErrorType.response:
          switch (error.response?.statusCode) {
            case 400:
              throw BadRequestException(error.response?.data['message']);
            case 401:
              throw UnauthorizedException(error.requestOptions);
            case 404:
              throw NotFoundException(error.requestOptions);
            case 409:
              throw ConflictException(error.requestOptions);
            case 500:
            case 501:
            case 503:
              throw InternalServerErrorException(error.requestOptions);
          }
          break;
        case DioErrorType.cancel:
          break;
        case DioErrorType.other:
          throw NoInternetConnectionException(error.requestOptions);
      }
      debugPrint('Error Status Code:${error.response?.statusCode}');
      return handler.next(error);
    },
        //! request
        onRequest:
            (RequestOptions requestOptions, RequestInterceptorHandler handler) {
      print("request");
      String currentLocale = "uz";
      requestOptions.headers["Accept"] = "application/json";
      requestOptions.headers["Accept-Language"] =
          currentLocale.isEmpty ? "ru" : currentLocale;
      return handler.next(requestOptions);
    },
        //! response
        onResponse: (Response response, ResponseInterceptorHandler handler) {
      print("request");

      return handler.next(response);
    }));
  }
}
