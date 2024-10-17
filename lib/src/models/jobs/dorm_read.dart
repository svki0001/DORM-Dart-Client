import 'package:dorm_client/src/models/jobs/after/dorm_after.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_before.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_column.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_embed.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_join.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_order.dart';
import 'package:dorm_client/src/models/jobs/dorm_job.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_where.dart';

class DORMRead extends DORMJob {
  final List<DORMColumn>? columns;
  late final List<DORMWhere>? where;
  final List<DORMJoin>? join;
  final DORMOrder? order;
  final int? limit;
  final List<DORMEmbed>? embed;

  DORMRead({
    required from,
    this.columns,
    this.where,
    this.join,
    this.order,
    this.limit,
    this.embed,
    super.before,
    super.after,
  }) : super(
          job: 'read',
          from: from,
        );

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();

    Map<String, dynamic> readJson = {
      if (columns != null)
        'columns': columns!.map((column) => column.toJson()).toList(),
      if (where != null)
        'where': where!.map((whereElement) => whereElement.toJson()).toList(),
      if (order != null) 'order': order!.toJson(),
      if (limit != null) 'limit': limit,
      if (embed != null)
        'embed': embed!.map((embedElement) => embedElement.toJson()).toList(),
    };

    if (join != null) {
      readJson['join'] =
          join!.map((joinElement) => joinElement.toJson()).toList();
    }

    json.addAll(readJson);

    return json;
  }

  // TODO: Test this
  factory DORMRead.fromJson(Map<String, dynamic> json) {
    return DORMRead(
      from: json['from'],
      columns: (json['columns'] as List<dynamic>?)
          ?.map((column) => DORMColumn.fromJson(column))
          .toList(),
      where: (json['where'] as List<dynamic>?)
          ?.map((whereElement) => DORMWhere.fromJson(whereElement))
          .toList(),
      join: (json['join'] as List<dynamic>?)
          ?.map((joinElement) => DORMJoin.fromJson(joinElement))
          .toList(),
      order: json['order'] != null ? DORMOrder.fromJson(json['order']) : null,
      limit: json['limit'],
      embed: (json['embed'] as List<dynamic>?)
          ?.map((embedElement) => DORMEmbed.fromJson(embedElement))
          .toList(),
      after: json['after'] != null ? DORMAfter.fromJson(json['after']) : null,
      before:
          json['before'] != null ? DORMBefore.fromJson(json['before']) : null,
    );
  }

  @override
  List<Object?> get props =>
      [from, columns, where, join, order, limit, embed, before, after];
}
