abstract class DORMJob {
  final String job;
  final String from;

  DORMJob({
    required this.job,
    required this.from,
  });

  Map<String, dynamic> toJson() => {
        'job': job,
        'from': from,
      };
}
