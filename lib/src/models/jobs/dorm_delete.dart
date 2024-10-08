import 'package:dorm_client/src/models/jobs/dorm_job.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_where.dart';

class DORMDelete extends DORMJob {
  final List<DORMWhere>? where;

  DORMDelete({
    required from,
    this.where,
    super.before,
    super.after,
  }) : super(
          job: 'delete',
          from: from,
        );

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();

    if (where != null) {
      json['where'] =
          where!.map((whereElement) => whereElement.toJson()).toList();
    }

    return json;
  }

  @override
  List<Object?> get props => [from, where, before, after];
}
