class DORMLastInsertId {
  final String fromTable;
  final String setColumn;

  DORMLastInsertId({
    required this.fromTable,
    required this.setColumn,
  });

  Map<String, dynamic> toJson() => {
        "fromTable": fromTable,
        "setColumn": setColumn,
      };
}
