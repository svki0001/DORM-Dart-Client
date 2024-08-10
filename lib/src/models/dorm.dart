import 'package:dio/dio.dart';
import 'package:dorm_client/src/exceptions/exceptions.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_request.dart';
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
            'contentType': 'application/json',
            if (authorization != null) "authorization": authorization,
          },
        ),
      );

      return response;
      // } catch (error) {
      //   throw DROMServerException(
      //       message:
      //           "Couldn't connect with DORM server. Please check if the server is running or your configuration is correct. \n Error was: ${error.toString()}");
      // }
    } catch (error) {
      int statusCode = 400;
      if (error is DioException) {
        statusCode = error.response?.statusCode ?? 500;
      }
      throw DORMClientException(
          statusCode: statusCode,
          message:
              "Couln't not _postRaw_ to DORM server due to ${DORMStatusCodes.getDescription(statusCode)}.\n Error was: ${error.toString()}");
    }
  }

  Future<DORMResponse> post(DORMRequest request,
      {String? overriddenUrl, String? authorization}) async {
    Response rawData = await postRaw(request,
        overriddenUrl: overriddenUrl, authorization: authorization);

    try {
      if (rawData.data["errors"].isNotEmpty) {
        print('\x31[94m'
            "The DORM server responded with: ${rawData.data["errors"].toString()}"
            '\x31[0m');
      }

      DORMResponse response = DORMResponse.fromJson(rawData.data);

      return response;
    } catch (error) {
      throw DORMException(
          statusCode: null,
          message:
              "Couldn't cast DORM response to DORMResponse object.\n Error was: ${error.toString()}");
    }
  }
}
