import 'package:equatable/equatable.dart';

class DORMJoin extends Equatable {
  final List<({String tableName, String columnName})> joins;

  DORMJoin({
    required this.joins,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    for (var join in joins) {
      json.addAll({join.tableName: join.columnName});
    }

    return json;
  }

  @override
  List<Object?> get props => [joins];
}
