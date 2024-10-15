import 'package:dorm_client/src/models/jobs/after/dorm_after.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_before.dart';
import 'package:equatable/equatable.dart';

abstract class DORMJob extends Equatable {
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
        if (before != null) 'before': before!.toJson(),
        if (after != null) 'after': after!.toJson(),
      };
}
