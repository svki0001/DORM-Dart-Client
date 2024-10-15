import 'package:equatable/equatable.dart';

class DORMColumn extends Equatable {
  final String column;

  DORMColumn({
    required this.column,
  });

  Map<String, dynamic> toJson() => {
        'column': column,
      };

  @override
  List<Object?> get props => [column];
}
