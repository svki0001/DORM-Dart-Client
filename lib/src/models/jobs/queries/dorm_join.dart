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

  factory DORMJoin.fromJson(Map<String, dynamic> json) {
    List<({String tableName, String columnName})> joins = [];

    json.forEach((key, value) {
      joins.add((tableName: key, columnName: value));
    });

    return DORMJoin(
      joins: joins,
    );
  }

  @override
  List<Object?> get props => [joins];
}
