import 'package:equatable/equatable.dart';

class DORMEmbed extends Equatable {
  final String table;

  DORMEmbed({
    required this.table,
  });

  Map<String, dynamic> toJson() => {
        'table': table,
      };

  @override
  List<Object?> get props => [table];
}
