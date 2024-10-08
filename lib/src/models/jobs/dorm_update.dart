import 'package:dorm_client/src/models/jobs/dorm_job.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_value.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_where.dart';

class DORMUpdate extends DORMJob {
  final List<DORMValue> values;
  final List<DORMWhere>? where;

  DORMUpdate({
    required from,
    required this.values,
    this.where,
    super.before,
    super.after,
  }) : super(
          job: 'update',
          from: from,
        );

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();

    Map<String, dynamic> updateValues = {};

    for (final value in values) {
      updateValues[value.columnName] = value.value.toString();
    }

    json["values"] = updateValues;

    if (where != null) {
      json['where'] =
          where!.map((whereElement) => whereElement.toJson()).toList();
    }

    return json;
  }

  @override
  List<Object?> get props => [from, values, where, before, after];
}
