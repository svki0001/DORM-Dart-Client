import 'package:dorm_client/src/models/before/dorm_before.dart';

abstract class DORMJob {
  final String job;
  final String from;
  final DORMBefore? before;

  DORMJob({
    required this.job,
    required this.from,
    this.before,
  });

  Map<String, dynamic> toJson() => {
        'job': job,
        'from': from,
        if (before != null) ...before!.toJson(),
      };
}
