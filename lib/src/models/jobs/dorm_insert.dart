import 'package:dorm_client/src/models/jobs/after/dorm_after.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_before.dart';
import 'package:dorm_client/src/models/jobs/dorm_job.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_value.dart';

class DORMInsert extends DORMJob {
  final List<DORMValue> values;

  DORMInsert({
    required from,
    required this.values,
    super.before,
    super.after,
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

    return json;
  }

  factory DORMInsert.fromJson(Map<String, dynamic> json) {
    return DORMInsert(
      from: json['from'],
      values: (json['values'] as Map<String, dynamic>)
          .entries
          .map((e) => DORMValue(
                columnName: e.key,
                value: e.value,
              ))
          .toList(),
      after: json['after'] != null ? DORMAfter.fromJson(json['after']) : null,
      before:
          json['before'] != null ? DORMBefore.fromJson(json['before']) : null,
    );
  }

  @override
  List<Object?> get props => [from, values, before, after];
}
