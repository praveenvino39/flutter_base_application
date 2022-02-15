import 'package:bloc_practice/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RemoteRepository extends ApiService with ChangeNotifier {
  late Dio dioClient;
  RemoteRepository() {
    var options = BaseOptions(
      baseUrl: 'BASE_URL',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dioClient = Dio(options);
    dioClient.interceptors.add(PrettyDioLogger());
    dioClient.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }
}
