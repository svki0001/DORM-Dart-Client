import 'package:dorm_client/src/models/jobs/after/dorm_after_job.dart';

class DORMtoBase64 extends DORMAfterJob {
  final List<String> columns;

  DORMtoBase64(this.columns);

  @override
  Map<String, dynamic> toJson() => {
        "toBase64": columns,
      };

  factory DORMtoBase64.fromJson(Map<String, dynamic> json) {
    return DORMtoBase64(json['toBase64']);
  }

  @override
  List<Object?> get props => [columns];
}
