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

  @override
  List<Object?> get props => [columnName, value];
}
