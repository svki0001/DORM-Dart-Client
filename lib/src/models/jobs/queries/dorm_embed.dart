class DORMEmbed {
  final String table;

  DORMEmbed({
    required this.table,
  });

  Map<String, dynamic> toJson() => {
        'table': table,
      };
}
