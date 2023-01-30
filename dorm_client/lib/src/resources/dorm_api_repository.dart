import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dorm_client/src/exceptions/exceptions.dart';
import 'package:dorm_client/src/models/dorm_request.dart';
import 'package:dorm_client/src/models/dorm_response.dart';
import 'package:dorm_client/src/resources/dom_api_provider.dart';

class DORMApiRepository {
  static Future<DORMResponse> post(DORMRequest request) async {
    try {
      Response rawData = await DORMApiProvider().post(request);

      if (rawData.data["errors"].isNotEmpty) {
        throw DROMServerException(message: "The DORM server responded with: ${(rawData.data["errors"] as List<String>).join('\n')}");
      }

      DORMResponse response = DORMResponse.fromJson(rawData.data);

      return response;
    } catch (error) {
      throw DROMClientException(message: "Couldn't cast DORM response to DORMResponse object.");
    }
  }
}
