class DORMWhere<T> {
  final String? column;
  final T? value;
  final String condition;
  final String? op;
  final String? val1;
  final String? val2;
  final List<DORMWhere<T>>? where;

  DORMWhere({
    this.column,
    this.value,
    required this.condition,
    this.op,
    this.val1,
    this.val2,
    this.where,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'column': column,
      'value': value,
      'condition': condition,
    };

    if (op != null) {
      json['op'] = op;
    }

    if (val1 != null) {
      json['val1'] = val1;
    }

    if (val2 != null) {
      json['val2'] = val2;
    }

    if (where != null) {
      json['where'] = where;
    }

    return json;
  }
}
