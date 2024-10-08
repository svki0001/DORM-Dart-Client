import 'package:dorm_client/src/models/jobs/before/dorm_before_job.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_from_base64.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_last_insert_id.dart';
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

  // TODO: Test this
  factory DORMBefore.fromJson(Map<String, dynamic> json) {
    List<DORMBeforeJob> jobs = [];

    json.forEach((key, value) {
      if (key == 'fromBase64') {
        jobs.add(DORMFromBase64.fromJson(value));
      } else if (key == 'lastInsertId') {
        jobs.add(DORMLastInsertId.fromJson(value));
      } else {
        throw Exception('Unknown job type: $key');
      }
    });

    return DORMBefore(jobs: jobs);
  }

  @override
  List<Object?> get props => [jobs];
}
