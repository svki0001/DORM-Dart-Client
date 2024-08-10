class DORMValue<T> {
  final String columnName;
  final T value;

  DORMValue({
    required this.columnName,
    required this.value,
  });

  Map<String, dynamic> toJson() => {
        columnName: value.toString(),
      };
}
