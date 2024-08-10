import 'package:dorm_client/src/models/dorm_before.dart';
import 'package:dorm_client/src/models/dorm_column.dart';
import 'package:dorm_client/src/models/dorm_insert.dart';
import 'package:dorm_client/src/models/dorm_job.dart';
import 'package:dorm_client/src/models/dorm_read.dart';
import 'package:dorm_client/src/models/dorm_replace.dart';
import 'package:dorm_client/src/models/dorm_update.dart';
import 'package:dorm_client/src/models/dorm_value.dart';
import 'package:dorm_client/src/models/dorm_where.dart';

class DORMRequest {
  List<DORMJob> jobs = [];

  DORMRequest add(DORMJob job) {
    jobs.add(job);

    return this;
  }

  DORMRequest addRead<T>({
    String? from,
    List<DORMColumn>? columns,
    List<DORMWhere<T>>? where,
    DORMJob? join,
  }) {
    final DORMRead job = DORMRead(
      from: from,
      columns: columns,
      where: where,
      join: join,
    );

    return add(job);
  }

  DORMRequest addInsert({
    required String from,
    required final List<DORMValue> values,
    DORMBefore? before,
  }) {
    final DORMInsert job = DORMInsert(
      from: from,
      values: values,
      before: before,
    );

    return add(job);
  }

  DORMRequest addUpdate({
    required final String from,
    required final List<DORMValue> values,
    required final List<DORMWhere>? where,
  }) {
    final DORMUpdate job = DORMUpdate(
      from: from,
      values: values,
      where: where,
    );

    return add(job);
  }

  DORMRequest addReplace({
    required String from,
    required final List<DORMValue> values,
    required final List<DORMWhere>? where,
  }) {
    final DORMReplace job = DORMReplace(
      from: from,
      values: values,
      where: where,
    );

    return add(job);
  }

  List<Map<String, dynamic>> toJson() =>
      jobs.map((job) => job.toJson()).toList();
}
