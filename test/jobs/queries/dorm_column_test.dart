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
  });
}
