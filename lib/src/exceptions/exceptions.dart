class DORMException implements Exception {
  final String? message;

  DORMException({this.message});

  @override
  String toString() {
    return 'DORMException: $message';
  }
}

class DROMServerException extends DORMException {
  DROMServerException({super.message});
}

class DROMClientException extends DORMException {
  DROMClientException({super.message});
}
