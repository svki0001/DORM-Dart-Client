import 'package:equatable/equatable.dart';

class DORMWhere<T> extends Equatable {
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
      if (column != null) 'column': column,
      if (value != null) 'value': value.toString(),
      'condition': condition,
      if (op != null) 'op': op,
      if (val1 != null) 'val1': val1,
      if (val2 != null) 'val2': val2,
      if (where != null)
        'where': where!.map((whereElement) => whereElement.toJson()).toList(),
    };

    return json;
  }

  // TODO: Test this
  factory DORMWhere.fromJson(Map<String, dynamic> json) {
    return DORMWhere(
      column: json['column'],
      value: json['value'],
      condition: json['condition'],
      op: json['op'],
      val1: json['val1'],
      val2: json['val2'],
      where: (json['where'] as List<Map<String, dynamic>>?)?.map(
        (whereElement) {
          return DORMWhere.fromJson(whereElement) as DORMWhere<T>;
        },
      ).toList(),
    );
  }

  @override
  List<Object?> get props => [column, value, condition, op, val1, val2, where];
}
