import 'package:dorm_client/src/models/jobs/before/dorm_before_job.dart';

class DORMLastInsertId extends DORMBeforeJob {
  final String fromTable;
  final String setColumn;

  DORMLastInsertId({
    required this.fromTable,
    required this.setColumn,
  });

  @override
  Map<String, dynamic> toJson() => {
        "lastInsertId": {
          "fromTable": fromTable,
          "setColumn": setColumn,
        },
      };

  // TODO: Test this
  factory DORMLastInsertId.fromJson(Map<String, dynamic> json) {
    return DORMLastInsertId(
      fromTable: json['fromTable'],
      setColumn: json['setColumn'],
    );
  }

  @override
  List<Object?> get props => [fromTable, setColumn];
}
