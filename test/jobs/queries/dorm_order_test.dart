import 'package:dorm_client/src/models/jobs/queries/dorm_order.dart';
import 'package:test/test.dart';

void main() {
  group('Order Construction', () {
    test('Minimal object construction', () {
      final columnName = 'column_name';
      final sort = 'DESC';

      final order = DORMOrder(
        column: columnName,
        sort: sort,
      );

      final expected = {
        'column': columnName,
        'sort': sort,
      };

      expect(order.toJson(), expected);
    });

    test('fromJson construction', () {
      final columnName = 'column_name';
      final sort = 'DESC';

      final compareOrder = DORMOrder(
        column: columnName,
        sort: sort,
      );

      final json = {
        'column': columnName,
        'sort': sort,
      };

      final equalOrder = DORMOrder.fromJson(json);

      expect(compareOrder, equalOrder);
    });
  });

  group('Default class functions', () {
    test('equals', () {
      final equalColumnName = 'column_name';
      final equalSort = 'DESC';
      final unequalColumnName = 'name_column';
      final unequalSort = 'ASC';

      final compareOrder = DORMOrder(column: equalColumnName, sort: equalSort);
      final equalOrder = DORMOrder(column: equalColumnName, sort: equalSort);
      final unequalOrder =
          DORMOrder(column: unequalColumnName, sort: unequalSort);

      expect(compareOrder, equalOrder);
      expect(compareOrder, isNot(unequalOrder));
    });
  });
}
