import 'package:equatable/equatable.dart';

class DORMOrder extends Equatable {
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

  @override
  List<Object?> get props => [column, sort];
}
