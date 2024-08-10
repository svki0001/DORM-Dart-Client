class DORMOrder {
  final String column;
  final String sort;

  DORMOrder({
    required this.column,
    required this.sort,
  });

  Map<String, dynamic> toJson() => {
        'order': {
          'column': column,
          'sort': sort,
        },
      };
}
