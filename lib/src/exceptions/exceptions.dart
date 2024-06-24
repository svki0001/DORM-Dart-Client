class DORMException implements Exception {
  final String? message;
  final int? statusCode;

  DORMException({this.message, this.statusCode});

  // Add a getter for the description based on the status code
  String get description => DORMStatusCodes.getDescription(statusCode);

  @override
  String toString() {
    return 'DORMException: [$statusCode] $description, $message';
  }
}

class DORMServerException extends DORMException {
  DORMServerException({super.message, super.statusCode});
}

class DORMClientException extends DORMException {
  DORMClientException({super.message, super.statusCode});
}

class DORMStatusCodes {
  static const int invalidRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int internalServerError = 500;

  // Static method to get the description based on the status code
  static String getDescription(int? statusCode) {
    switch (statusCode) {
      case invalidRequest:
        return 'Invalid Request';
      case unauthorized:
        return 'Unauthorized Request';
      case forbidden:
        return 'Forbidden';
      case notFound:
        return 'Not Found';
      case internalServerError:
        return 'Internal Server Error';
      default:
        return 'Unknown Error';
    }
  }
}
