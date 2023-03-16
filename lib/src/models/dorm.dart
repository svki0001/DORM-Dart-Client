import 'package:dio/dio.dart';
import 'package:dorm_client/src/exceptions/exceptions.dart';
import 'package:dorm_client/src/models/dorm_request.dart';
import 'package:dorm_client/src/models/dorm_response.dart';

class DORM {
  final Dio _dio = Dio();

  final String schema; // e.g. DORM 0.0.6
  final String url; // your DORM api location
  final String token;

  DORM({
    required this.schema,
    required this.url,
    required this.token,
  }); // your DORM token

  Future<Response> postRaw(DORMRequest request) async {
    try {
      Map<String, dynamic> json = {
        'schema': schema,
        'token': token,
        'jobs': request.toJson(),
      };

      return await _dio.post(
        url,
        data: json,
      );
    } catch (error) {
      throw DROMServerException(message: "Couldn't connect with DORM server. Please check if the server is running or your configuration is correct");
    }
  }

  Future<DORMResponse> post(DORMRequest request) async {
    try {
      Response rawData = await postRaw(request);

      if (rawData.data["errors"].isNotEmpty) {
        print('\x31[94m' "The DORM server responded with: ${rawData.data["errors"].toString()}" '\x31[0m');
      }

      DORMResponse response = DORMResponse.fromJson(rawData.data);

      return response;
    } catch (error) {
      throw DROMClientException(message: "Couldn't cast DORM response to DORMResponse object. \n ${error.toString()}");
    }
  }
}
