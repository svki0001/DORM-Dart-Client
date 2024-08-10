class DORMColumn {
  final String column;

  DORMColumn({
    required this.column,
  });

  Map<String, dynamic> toJson() => {
        'column': column,
      };
}
