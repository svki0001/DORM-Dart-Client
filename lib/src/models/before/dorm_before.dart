import 'package:dorm_client/src/models/before/dorm_before_job.dart';

class DORMBefore {
  final List<DORMBeforeJob> jobs;

  DORMBefore({
    required this.jobs,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonJobs = {};

    for (var job in jobs) {
      jsonJobs.addAll(job.toJson());
    }

    return {
      "before": jsonJobs,
    };
  }
}
