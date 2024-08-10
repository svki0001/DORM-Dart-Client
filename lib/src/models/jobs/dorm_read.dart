import 'package:dorm_client/src/models/dorm_column.dart';
import 'package:dorm_client/src/models/dorm_join.dart';
import 'package:dorm_client/src/models/dorm_order.dart';
import 'package:dorm_client/src/models/jobs/dorm_job.dart';
import 'package:dorm_client/src/models/dorm_where.dart';

class DORMRead extends DORMJob {
  final List<DORMColumn>? columns;
  late final List<DORMWhere>? where;
  DORMJoin? join;
  DORMOrder? order;
  int? limit;
  // TODO: add embed property
  // TODO: add embed property

  DORMRead({
    required from,
    this.columns,
    this.where,
    this.join,
    this.order,
    this.limit,
    super.before,
    super.after,
  }) : super(
          job: 'read',
          from: from,
        );

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();

    if (columns != null) {
      json['columns'] = columns!.map((column) => column.toJson()).toList();
    }

    if (where != null) {
      json['where'] =
          where!.map((whereElement) => whereElement.toJson()).toList();
    }

    if (join != null) {
      json['join'] = join!.toJson();
    }

    if (order != null) {
      json.addAll(order!.toJson());
    }

    if (limit != null) {
      json['limit'] = limit;
    }

    return json;
  }
}
