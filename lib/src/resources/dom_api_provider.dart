import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dorm_client/src/configs/dorm_config.dart';
import 'package:dorm_client/src/exceptions/exceptions.dart';
import 'package:dorm_client/src/models/dorm_request.dart';

class DORMApiProvider {
  final Dio _dio = Dio();

  Future<Response> post(DORMRequest request) async {
    try {
      Map<String, dynamic> json = request.toJson();

      return await _dio.post(
        DORMConfig.url,
        data: json,
      );
    } catch (error) {
      throw DROMServerException(message: "Couldn't connect with DORM server. Please check if the server is running or your configuration is correct");
    }
  }
}
