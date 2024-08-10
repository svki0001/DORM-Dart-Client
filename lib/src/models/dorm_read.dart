import 'package:dorm_client/src/models/dorm_column.dart';
import 'package:dorm_client/src/models/dorm_job.dart';
import 'package:dorm_client/src/models/dorm_where.dart';

class DORMRead extends DORMJob {
  final List<DORMColumn>? columns;
  late final List<DORMWhere>? where;
  DORMJob? join;
  // TODO: add order property
  // TODO: add embed property
  // TODO: add limit property

  DORMRead({
    required from,
    this.columns,
    this.where,
    this.join,
    super.before,
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

    return json;
  }
}
