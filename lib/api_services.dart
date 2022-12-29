import 'package:dio/dio.dart';

class ApiServices {
  late Dio dioClient;
  void init() {
    dioClient = Dio();
  }
}
