import 'package:dorm_client/src/models/before/dorm_before.dart';
import 'package:dorm_client/src/models/dorm_job.dart';
import 'package:dorm_client/src/models/dorm_value.dart';

class DORMInsert extends DORMJob {
  final List<DORMValue> values;
  final DORMBefore? before;

  DORMInsert({
    required from,
    required this.values,
    this.before,
  }) : super(
          job: 'insert',
          from: from,
        );

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();

    Map<String, dynamic> insertValues = {};

    for (final value in values) {
      insertValues[value.columnName] = value.value.toString();
    }

    json["values"] = insertValues;

    if (before != null) {
      json.addAll(before!.toJson());
    }

    return json;
  }
}
