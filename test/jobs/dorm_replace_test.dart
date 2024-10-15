import 'package:dorm_client/src/models/jobs/after/dorm_after.dart';
import 'package:dorm_client/src/models/jobs/after/dorm_to_base64.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_before.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_from_base64.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_last_insert_id.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_value.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_where.dart';
import 'package:dorm_client/src/models/jobs/dorm_replace.dart';
import 'package:test/test.dart';

void main() {
  group('Replace Construction', () {
    test('Minimal object construction', () {
      final tableName = 'table_name';

      final replace = DORMReplace(
        from: tableName,
        values: [],
      );

      final expected = {
        'job': 'replace',
        'from': tableName,
        'values': {},
      };

      expect(replace.toJson(), expected);
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

      final replace = DORMReplace(
        from: tableName,
        values: values,
        where: where,
        before: before,
        after: after,
      );

      final expected = {
        'job': 'replace',
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

      expect(replace.toJson(), expected);
    });
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

      final compareReplace = DORMReplace(
        from: tableName,
        values: values,
        where: where,
        before: before,
        after: after,
      );
      final equalReplace = DORMReplace(
        from: tableName,
        values: values,
        where: where,
        before: before,
        after: after,
      );
      final unequalReplace = DORMReplace(
        from: tableName,
        values: values,
        where: where,
        before: before,
        after: DORMAfter(jobs: []),
      );

      expect(compareReplace, equalReplace);
      expect(compareReplace, isNot(unequalReplace));
    });
  });
}
