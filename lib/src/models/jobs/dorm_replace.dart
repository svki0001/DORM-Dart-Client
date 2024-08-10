import 'package:dorm_client/src/models/jobs/dorm_job.dart';
import 'package:dorm_client/src/models/dorm_value.dart';
import 'package:dorm_client/src/models/dorm_where.dart';

class DORMReplace extends DORMJob {
  final List<DORMValue> values;
  final List<DORMWhere>? where;

  DORMReplace({
    required from,
    required this.values,
    this.where,
    super.before,
    super.after,
  }) : super(
          job: 'replace',
          from: from,
        );

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();

    Map<String, dynamic> replaceValues = {};

    for (final value in values) {
      replaceValues[value.columnName] = value.value.toString();
    }

    json["values"] = replaceValues;

    if (where != null) {
      json['where'] =
          where!.map((whereElement) => whereElement.toJson()).toList();
    }

    return json;
  }
}
