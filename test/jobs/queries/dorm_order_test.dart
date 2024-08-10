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
  });
}
