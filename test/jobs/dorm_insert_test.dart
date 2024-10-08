import 'package:dorm_client/src/models/jobs/after/dorm_after.dart';
import 'package:dorm_client/src/models/jobs/after/dorm_to_base64.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_before.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_from_base64.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_last_insert_id.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_value.dart';
import 'package:dorm_client/src/models/jobs/dorm_insert.dart';
import 'package:test/test.dart';

void main() {
  group('Insert Construction', () {
    test('Minimal object construction', () {
      final tableName = 'table_name';

      final insert = DORMInsert(
        from: tableName,
        values: [],
      );

      final expected = {
        'job': 'insert',
        'from': tableName,
        'values': {},
      };

      expect(insert.toJson(), expected);
    });

    test('Maximal object construction', () {
      final tableName = 'table_name';

      final values = [
        DORMValue(columnName: 'column1_name', value: 'column1_value'),
        DORMValue(columnName: 'column2_name', value: 'column2_value'),
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

      final insert = DORMInsert(
        from: tableName,
        values: values,
        before: before,
        after: after,
      );

      final expected = {
        'job': 'insert',
        'from': tableName,
        'values': {
          'column1_name': 'column1_value',
          'column2_name': 'column2_value',
        },
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

      expect(insert.toJson(), expected);
    });

    test('fromJson with Maximal object construction', () {
      final tableName = 'table_name';

      final values = [
        DORMValue<dynamic>(columnName: 'column1_name', value: 'column1_value'),
        DORMValue<dynamic>(columnName: 'column2_name', value: 'column2_value'),
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

      final compareInsert = DORMInsert(
        from: tableName,
        values: values,
        before: before,
        after: after,
      );

      final json = {
        'job': 'insert',
        'from': tableName,
        'values': {
          'column1_name': 'column1_value',
          'column2_name': 'column2_value',
        },
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

      final insert = DORMInsert.fromJson(json);

      expect(insert, compareInsert);
    });
  });

  group('Default class functions', () {
    test('equals', () {
      final tableName = 'table_name';

      final equalValues = [
        DORMValue(columnName: 'column1_name', value: 'column1_value'),
        DORMValue(columnName: 'column2_name', value: 'column2_value'),
      ];
      final unequalValues = [
        DORMValue(columnName: 'name_column', value: 'column1_value'),
        DORMValue(columnName: 'column2_name', value: 'column2_value'),
      ];

      final compareInsert = DORMInsert(from: tableName, values: equalValues);
      final equalInsert = DORMInsert(from: tableName, values: equalValues);
      final unequalInsert = DORMInsert(from: tableName, values: unequalValues);

      expect(compareInsert, equalInsert);
      expect(compareInsert, isNot(unequalInsert));
    });
  });
}
