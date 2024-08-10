class DORMJoin {
  final Map<String, String> jobsColumns;

  DORMJoin({required this.jobsColumns});

  Map<String, dynamic> toJson() => jobsColumns;
}
