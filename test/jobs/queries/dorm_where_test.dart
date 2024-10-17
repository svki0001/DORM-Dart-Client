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

    // TODO: Check json from DORM
    test('Single value condition, fromJson construction', () {
      final compareWhere = DORMWhere<String>(
        column: 'column_name',
        value: 'column_value',
        condition: '=',
      );

      final json = {
        'column': 'column_name',
        'value': 'column_value',
        'condition': '=',
      };

      // Note: Don't forget to add the type parameter to the fromJson method
      final equalWhere = DORMWhere<String>.fromJson(json);

      expect(compareWhere, equalWhere);
    });

    // TODO: Check json from DORM
    test('Multiple values condition, fromJson construction', () {
      final compareWhere = DORMWhere(
        op: 'AND',
        column: 'column_name',
        val1: 'column_value1',
        val2: 'column_value2',
        condition: 'BETWEEN',
      );

      final json = {
        'op': 'AND',
        'column': 'column_name',
        'val1': 'column_value1',
        'val2': 'column_value2',
        'condition': 'BETWEEN',
      };

      final equalWhere = DORMWhere.fromJson(json);

      expect(compareWhere, equalWhere);
    });

    // TODO: Check json from DORM
    test('Nested, fromJson construction', () {
      final compareWhere = DORMWhere(
        condition: 'block',
        where: [
          DORMWhere<dynamic>(
            column: 'column_name',
            value: 'column_value',
            condition: '=',
          ),
          DORMWhere<dynamic>(
            op: 'AND',
            column: 'column_name',
            val1: 'column_value1',
            val2: 'column_value2',
            condition: 'BETWEEN',
          ),
        ],
      );

      final json = {
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

      final equalWhere = DORMWhere.fromJson(json);

      expect(compareWhere, equalWhere);
    });
  });

  group('Default class functions', () {
    test('equals', () {
      final compareWhere = DORMWhere(
        column: 'column_name',
        value: 'column_value',
        condition: '=',
      );
      final equalWhere = DORMWhere(
        column: 'column_name',
        value: 'column_value',
        condition: '=',
      );
      final unequalWhere = DORMWhere(
        column: 'name_column',
        value: 'column_value',
        condition: '=',
      );

      expect(compareWhere, equalWhere);
      expect(equalWhere, isNot(unequalWhere));
    });

    test('equals with Multiple values condition', () {
      final compareWhere = DORMWhere(
        op: 'AND',
        column: 'column_name',
        val1: 'column_value1',
        val2: 'column_value2',
        condition: 'BETWEEN',
      );
      final equalWhere = DORMWhere(
        op: 'AND',
        column: 'column_name',
        val1: 'column_value1',
        val2: 'column_value2',
        condition: 'BETWEEN',
      );
      final unequalWhere = DORMWhere(
        op: 'AND',
        column: 'name_column',
        val1: 'column_value1',
        val2: 'column_value2',
        condition: 'BETWEEN',
      );

      expect(compareWhere, equalWhere);
      expect(equalWhere, isNot(unequalWhere));
    });

    test('equals with Nested', () {
      final compareWhere = DORMWhere(
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
      final equalWhere = DORMWhere(
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
      final unequalWhere = DORMWhere(
        condition: 'block',
        where: [
          DORMWhere(
            column: 'name_column',
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

      expect(compareWhere, equalWhere);
      expect(equalWhere, isNot(unequalWhere));
    });
  });
}
