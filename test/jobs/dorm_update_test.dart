import 'package:dorm_client/src/models/jobs/after/dorm_after.dart';
import 'package:dorm_client/src/models/jobs/after/dorm_to_base64.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_before.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_from_base64.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_last_insert_id.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_value.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_where.dart';
import 'package:dorm_client/src/models/jobs/dorm_update.dart';
import 'package:test/test.dart';

void main() {
  group('Update Construction', () {
    test('Minimal object construction', () {
      final tableName = 'table_name';

      final update = DORMUpdate(
        from: tableName,
        values: [],
      );

      final expected = {
        'job': 'update',
        'from': tableName,
        'values': {},
      };

      expect(update.toJson(), expected);
    });

    test('Maximal object construction', () {
      final tableName = 'table_name';

      final values = [
        DORMValue(columnName: 'column1_name', value: 'column1_value'),
        DORMValue(columnName: 'column2_name', value: 'column2_value'),
      ];

      final where = [
        DORMWhere(
          column: 'column1_name',
          value: 'column1_value',
          condition: '=',
        ),
        DORMWhere(
          column: 'column2_name',
          value: 'column2_value',
          condition: '=',
        ),
      ];

      final before = DORMBefore(
        jobs: [
          DORMLastInsertId(
            fromTable: 'last_insert_id_table_name',
            setColumn: 'column_name',
          ),
          DORMFromBase64(['picture', 'file']),
        ],
      );

      final after = DORMAfter(
        jobs: [
          DORMtoBase64(['picture', 'file']),
        ],
      );

      final update = DORMUpdate(
        from: tableName,
        values: values,
        where: where,
        before: before,
        after: after,
      );

      final expected = {
        'job': 'update',
        'from': tableName,
        'values': {
          'column1_name': 'column1_value',
          'column2_name': 'column2_value',
        },
        'where': [
          {
            'column': 'column1_name',
            'value': 'column1_value',
            'condition': '=',
          },
          {
            'column': 'column2_name',
            'value': 'column2_value',
            'condition': '=',
          },
        ],
        'before': {
          'lastInsertId': {
            'fromTable': 'last_insert_id_table_name',
            'setColumn': 'column_name',
          },
          'fromBase64': ['picture', 'file'],
        },
        'after': {
          'toBase64': ['picture', 'file'],
        },
      };

      expect(update.toJson(), expected);
    });
  });

  test('Update to JSON', () {
    final tableName = 'table_name';

    final values = [
      DORMValue(columnName: 'column1_name', value: 'column1_value'),
      DORMValue(columnName: 'column2_name', value: 'column2_value'),
    ];

    final where = [
      DORMWhere(
        column: 'column1_name',
        value: 'column1_value',
        condition: '=',
      ),
      DORMWhere(
        column: 'column2_name',
        value: 'column2_value',
        condition: '=',
      ),
    ];

    final before = DORMBefore(
      jobs: [
        DORMLastInsertId(
          fromTable: 'last_insert_id_table_name',
          setColumn: 'column_name',
        ),
        DORMFromBase64(['picture', 'file']),
      ],
    );

    final after = DORMAfter(
      jobs: [
        DORMtoBase64(['picture', 'file']),
      ],
    );

    final update = DORMUpdate(
      from: tableName,
      values: values,
      where: where,
      before: before,
      after: after,
    );

    final expected = {
      'job': 'update',
      'from': tableName,
      'values': {
        'column1_name': 'column1_value',
        'column2_name': 'column2_value',
      },
      'where': [
        {
          'column': 'column1_name',
          'value': 'column1_value',
          'condition': '=',
        },
        {
          'column': 'column2_name',
          'value': 'column2_value',
          'condition': '=',
        },
      ],
      'before': {
        'lastInsertId': {
          'fromTable': 'last_insert_id_table_name',
          'setColumn': 'column_name',
        },
        'fromBase64': ['picture', 'file'],
      },
      'after': {
        'toBase64': ['picture', 'file'],
      },
    };

    expect(update.toJson(), expected);
  });

  test('Update to JSON without before and after', () {
    final tableName = 'table_name';

    final values = [
      DORMValue(columnName: 'column1_name', value: 'column1_value'),
      DORMValue(columnName: 'column2_name', value: 'column2_value'),
    ];

    final where = [
      DORMWhere(
        column: 'column1_name',
        value: 'column1_value',
        condition: '=',
      ),
      DORMWhere(
        column: 'column2_name',
        value: 'column2_value',
        condition: '=',
      ),
    ];

    final update = DORMUpdate(
      from: tableName,
      values: values,
      where: where,
    );

    final expected = {
      'job': 'update',
      'from': tableName,
      'values': {
        'column1_name': 'column1_value',
        'column2_name': 'column2_value',
      },
      'where': [
        {
          'column': 'column1_name',
          'value': 'column1_value',
          'condition': '=',
        },
        {
          'column': 'column2_name',
          'value': 'column2_value',
          'condition': '=',
        },
      ],
    };

    expect(update.toJson(), expected);
  });

  group('Default class functions', () {
    test('equals', () {
      final tableName = 'table_name';

      final values = [
        DORMValue(columnName: 'column1_name', value: 'column1_value'),
        DORMValue(columnName: 'column2_name', value: 'column2_value'),
      ];

      final where = [
        DORMWhere(
          column: 'column1_name',
          value: 'column1_value',
          condition: '=',
        ),
        DORMWhere(
          column: 'column2_name',
          value: 'column2_value',
          condition: '=',
        ),
      ];

      final before = DORMBefore(
        jobs: [
          DORMLastInsertId(
            fromTable: 'last_insert_id_table_name',
            setColumn: 'column_name',
          ),
          DORMFromBase64(['picture', 'file']),
        ],
      );

      final after = DORMAfter(
        jobs: [
          DORMtoBase64(['picture', 'file']),
        ],
      );

      final update = DORMUpdate(
        from: tableName,
        values: values,
        where: where,
        before: before,
        after: after,
      );

      final expected = {
        'job': 'update',
        'from': tableName,
        'values': {
          'column1_name': 'column1_value',
          'column2_name': 'column2_value',
        },
        'where': [
          {
            'column': 'column1_name',
            'value': 'column1_value',
            'condition': '=',
          },
          {
            'column': 'column2_name',
            'value': 'column2_value',
            'condition': '=',
          },
        ],
        'before': {
          'lastInsertId': {
            'fromTable': 'last_insert_id_table_name',
            'setColumn': 'column_name',
          },
          'fromBase64': ['picture', 'file'],
        },
        'after': {
          'toBase64': ['picture', 'file'],
        },
      };

      expect(update.toJson(), expected);
    });
  });
}
