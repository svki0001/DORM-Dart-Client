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

  group('Default class functions', () {
    test('equals', () {
      final equalColumnName = 'column_name';
      final equalColumnValue = 'column_value';
      final unequalColumnName = 'name_column';
      final unequalColumnValue = 'value_column';

      final compareValue =
          DORMValue(columnName: equalColumnName, value: equalColumnValue);
      final equalValue =
          DORMValue(columnName: equalColumnName, value: equalColumnValue);
      final unequalValue =
          DORMValue(columnName: unequalColumnName, value: unequalColumnValue);

      expect(compareValue, equalValue);
      expect(compareValue, isNot(unequalValue));
    });
  });
}
