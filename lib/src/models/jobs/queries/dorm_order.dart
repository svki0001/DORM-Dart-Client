class DORMOrder {
  final String column;
  final String sort;

  DORMOrder({
    required this.column,
    required this.sort,
  });

  Map<String, dynamic> toJson() => {
        'column': column,
        'sort': sort,
      };
}
