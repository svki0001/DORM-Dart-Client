import 'package:equatable/equatable.dart';

class DORMValue<T> extends Equatable {
  final String columnName;
  final T value;

  DORMValue({
    required this.columnName,
    required this.value,
  });

  Map<String, dynamic> toJson() => {
        columnName: value.toString(),
      };

  // TODO: Test this
  factory DORMValue.fromJson(Map<String, dynamic> json) {
    return DORMValue(
      columnName: json.keys.first,
      value: json.values.first as T,
    );
  }

  @override
  List<Object?> get props => [columnName, value];
}
