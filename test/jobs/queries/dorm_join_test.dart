import 'package:dorm_client/src/models/jobs/queries/dorm_join.dart';
import 'package:test/test.dart';

void main() {
  group('Join Construction', () {
    test('Minimal object construction', () {
      final join = DORMJoin(
        joins: [
          (tableName: 'table1_name', columnName: 'column1_name'),
          (tableName: 'table2_name', columnName: 'column2_name'),
        ],
      );

      final expected = {
        'table1_name': 'column1_name',
        'table2_name': 'column2_name',
      };

      expect(join.toJson(), expected);
    });

    // TODO: Check json from DORM
    test('fromJson construction', () {
      final compareJoin = DORMJoin(
        joins: [
          (tableName: 'table1_name', columnName: 'column1_name'),
          (tableName: 'table2_name', columnName: 'column2_name'),
        ],
      );

      final json = {
        'table1_name': 'column1_name',
        'table2_name': 'column2_name',
      };

      final equalJoin = DORMJoin.fromJson(json);

      expect(compareJoin, equalJoin);
    });
  });

  group('Default class functions', () {
    test('equals', () {
      final equalJoins = [
        (tableName: 'table1_name', columnName: 'column1_name'),
        (tableName: 'table2_name', columnName: 'column2_name'),
      ];
      final unequalJoins = [
        (tableName: 'name_table1', columnName: 'column1_name'),
        (tableName: 'table2_name', columnName: 'column2_name'),
      ];

      final compareJoin = DORMJoin(joins: equalJoins);
      final equalJoin = DORMJoin(joins: equalJoins);
      final unequalJoin = DORMJoin(joins: unequalJoins);

      expect(compareJoin, equalJoin);
      expect(compareJoin, isNot(unequalJoin));
    });
  });
}
