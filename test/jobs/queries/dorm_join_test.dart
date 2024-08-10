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
  });
}
