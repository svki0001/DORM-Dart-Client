import 'package:dorm_client/src/models/after/dorm_after.dart';
import 'package:dorm_client/src/models/before/dorm_before.dart';

abstract class DORMJob {
  final String job;
  final String from;
  final DORMBefore? before;
  final DORMAfter? after;

  DORMJob({
    required this.job,
    required this.from,
    this.before,
    this.after,
  });

  Map<String, dynamic> toJson() => {
        'job': job,
        'from': from,
        if (before != null) ...before!.toJson(),
        if (after != null) ...after!.toJson(),
      };
}
