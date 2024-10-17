import 'package:dorm_client/src/models/jobs/queries/dorm_column.dart';
import 'package:test/test.dart';

void main() {
  group('Column Construction', () {
    test('Minimal object construction', () {
      final columnName = 'column_name';

      final column = DORMColumn(column: columnName);

      final expected = {'column': columnName};

      expect(column.toJson(), expected);
    });

    test('fromJson construction', () {
      final columnName = 'column_name';

      final compareColumn = DORMColumn(column: columnName);

      final json = {'column': columnName};

      final equalColumn = DORMColumn.fromJson(json);

      expect(compareColumn, equalColumn);
    });
  });

  group('Default class functions', () {
    test('equals', () {
      final equalColumnName = 'column_name';
      final unequalColumnName = 'name_column';

      final compareColumn = DORMColumn(column: equalColumnName);
      final equalColumn = DORMColumn(column: equalColumnName);
      final unequalColumn = DORMColumn(column: unequalColumnName);

      expect(compareColumn, equalColumn);
      expect(compareColumn, isNot(unequalColumn));
    });
  });
}
