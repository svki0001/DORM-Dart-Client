import 'package:dorm_client/src/models/jobs/queries/dorm_value.dart';
import 'package:test/test.dart';

void main() {
  group('Value Construction', () {
    test('Minimal object construction', () {
      final String columnName = 'column_name';
      final String columnValue = 'column_value';

      final value = DORMValue(
        columnName: columnName,
        value: columnValue,
      );

      final expected = {
        columnName: columnValue,
      };

      expect(value.toJson(), expected);
    });
  });
}
