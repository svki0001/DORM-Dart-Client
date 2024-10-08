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

    test('fromJson construction', () {
      final String columnName = 'column_name';
      final String columnValue = 'column_value';

      final compareValue = DORMValue<String>(
        columnName: columnName,
        value: columnValue,
      );

      final json = {
        columnName: columnValue,
      };

      // Note: Don't forget to add the type parameter to the fromJson method
      final equalValue = DORMValue<String>.fromJson(json);

      expect(compareValue, equalValue);
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
