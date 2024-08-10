import 'package:dorm_client/src/models/jobs/after/dorm_after_job.dart';

class DORMAfter {
  final List<DORMAfterJob> jobs;

  DORMAfter({
    required this.jobs,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    for (var job in jobs) {
      json.addAll(job.toJson());
    }

    return json;
  }
}
