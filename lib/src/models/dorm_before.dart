import 'package:dorm_client/src/models/dorm_last_insert_id.dart';

class DORMBefore {
  final DORMLastInsertId lastInsertId;

  DORMBefore({
    required this.lastInsertId,
  });

  Map<String, dynamic> toJson() => {
        "lastInsertId": lastInsertId.toJson(),
      };
}
