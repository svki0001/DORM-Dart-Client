import 'package:dorm_client/src/models/jobs/after/dorm_after.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_before.dart';
import 'package:dorm_client/src/models/jobs/dorm_job.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_value.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_where.dart';

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

  // TODO: Test this
  factory DORMReplace.fromJson(Map<String, dynamic> json) {
    return DORMReplace(
      from: json['from'],
      values: (json['values'] as Map<String, dynamic>)
          .entries
          .map(
            (e) => DORMValue.fromJson(
              {e.key: e.value},
            ),
          )
          .toList(),
      where: (json['where'] as List<dynamic>?)
          ?.map((whereElement) => DORMWhere.fromJson(whereElement))
          .toList(),
      after: json['after'] != null ? DORMAfter.fromJson(json['after']) : null,
      before:
          json['before'] != null ? DORMBefore.fromJson(json['before']) : null,
    );
  }

  @override
  List<Object?> get props => [from, values, where, before, after];
}
