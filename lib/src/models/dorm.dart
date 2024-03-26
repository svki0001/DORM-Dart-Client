import 'package:dio/dio.dart';
import 'package:dorm_client/src/exceptions/exceptions.dart';
import 'package:dorm_client/src/models/dorm_request.dart';
import 'package:dorm_client/src/models/dorm_response.dart';

class DORM {
  final Dio _dio = Dio();

  final String schema; // e.g. DORM 0.0.6
  String? url; // your default DORM api location
  final String token;

  DORM({
    required this.schema,
    this.url,
    required this.token,
  }); // your DORM token

  Future<Response> postRaw(DORMRequest request,
      {String? overriddenUrl, String? authorization}) async {
    try {
      Map<String, dynamic> json = {
        'schema': schema,
        'token': token,
        'jobs': request.toJson(),
      };

      if (overriddenUrl == null && url == null) {
        throw DORMException(
            message: 'At leas a url or overriddenUrl needs to be set');
      }

      Response response = await _dio.post(
        overriddenUrl ?? url!,
        data: json,
        options: Options(
          headers: {
            'accept': 'application/json',
            'contentTType': 'application/json',
            if (authorization != null) "authorization": authorization,
          },
        ),
      );

      return response;
    } catch (error) {
      throw DROMServerException(
          message:
              "Couldn't connect with DORM server. Please check if the server is running or your configuration is correct. \n Error was: ${error.toString()}");
    }
  }

  Future<DORMResponse> post(DORMRequest request,
      {String? overriddenUrl, String? authorization}) async {
    try {
      Response rawData = await postRaw(request,
          overriddenUrl: overriddenUrl, authorization: authorization);

      if (rawData.data["errors"].isNotEmpty) {
        print('\x31[94m'
            "The DORM server responded with: ${rawData.data["errors"].toString()}"
            '\x31[0m');
      }

      DORMResponse response = DORMResponse.fromJson(rawData.data);

      return response;
    } catch (error) {
      throw DROMClientException(
          message:
              "Couldn't cast DORM response to DORMResponse object. \n Error was: ${error.toString()}");
    }
  }
}
