import 'package:dorm_client/src/models/jobs/queries/dorm_where.dart';
import 'package:test/test.dart';

void main() {
  group('Where Construction', () {
    test('Single value condition', () {
      final join = DORMWhere(
        column: 'column_name',
        value: 'column_value',
        condition: '=',
      );

      final expected = {
        'column': 'column_name',
        'value': 'column_value',
        'condition': '=',
      };

      expect(join.toJson(), expected);
    });

    test('Multiple values condition', () {
      final join = DORMWhere(
        op: 'AND',
        column: 'column_name',
        val1: 'column_value1',
        val2: 'column_value2',
        condition: 'BETWEEN',
      );

      final expected = {
        'op': 'AND',
        'column': 'column_name',
        'val1': 'column_value1',
        'val2': 'column_value2',
        'condition': 'BETWEEN',
      };

      expect(join.toJson(), expected);
    });

    test('Nested', () {
      final join = DORMWhere(
        condition: 'block',
        where: [
          DORMWhere(
            column: 'column_name',
            value: 'column_value',
            condition: '=',
          ),
          DORMWhere(
            op: 'AND',
            column: 'column_name',
            val1: 'column_value1',
            val2: 'column_value2',
            condition: 'BETWEEN',
          ),
        ],
      );

      final expected = {
        'condition': 'block',
        'where': [
          {
            'column': 'column_name',
            'value': 'column_value',
            'condition': '=',
          },
          {
            'op': 'AND',
            'column': 'column_name',
            'val1': 'column_value1',
            'val2': 'column_value2',
            'condition': 'BETWEEN',
          },
        ],
      };

      expect(join.toJson(), expected);
    });
  });
}
