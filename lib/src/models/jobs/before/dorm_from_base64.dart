import 'package:dorm_client/src/models/jobs/before/dorm_before_job.dart';

class DORMFromBase64 extends DORMBeforeJob {
  final List<String> columns;

  DORMFromBase64(this.columns);

  @override
  Map<String, dynamic> toJson() => {
        "fromBase64": columns,
      };
}
