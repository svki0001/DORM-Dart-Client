import 'package:dorm_client/src/models/after/dorm_after_job.dart';

class DORMAfter {
  final List<DORMAfterJob> jobs;

  DORMAfter({
    required this.jobs,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> jsonJobs = {};

    for (var job in jobs) {
      jsonJobs.addAll(job.toJson());
    }

    return {
      "after": jsonJobs,
    };
  }
}
