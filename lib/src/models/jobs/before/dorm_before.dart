import 'package:dorm_client/src/models/jobs/before/dorm_before_job.dart';
import 'package:equatable/equatable.dart';

class DORMBefore extends Equatable {
  final List<DORMBeforeJob> jobs;

  DORMBefore({
    required this.jobs,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    for (var job in jobs) {
      json.addAll(job.toJson());
    }

    return json;
  }

  @override
  List<Object?> get props => [jobs];
}
