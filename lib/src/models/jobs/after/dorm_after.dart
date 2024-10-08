import 'package:dorm_client/src/models/jobs/after/dorm_after_job.dart';
import 'package:equatable/equatable.dart';
import 'package:dorm_client/src/models/jobs/after/dorm_to_base64.dart';

class DORMAfter extends Equatable {
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

  // TODO: Test this
  factory DORMAfter.fromJson(Map<String, dynamic> json) {
    List<DORMAfterJob> jobs = [];

    for (var key in json.keys) {
      switch (key) {
        case 'toBase64':
          jobs.add(DORMtoBase64.fromJson(json));
          break;
        default:
          throw Exception('Unknown DORMAfterJob: $key');
      }
    }

    return DORMAfter(jobs: jobs);
  }

  @override
  List<Object?> get props => [jobs];
}
