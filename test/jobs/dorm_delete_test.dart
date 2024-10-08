import 'package:dorm_client/src/models/jobs/after/dorm_after.dart';
import 'package:dorm_client/src/models/jobs/after/dorm_to_base64.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_before.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_from_base64.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_last_insert_id.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_where.dart';
import 'package:dorm_client/src/models/jobs/dorm_delete.dart';
import 'package:test/test.dart';

void main() {
  group('Delete Construction', () {
    test('Minimal object construction', () {
      final tableName = 'table_name';

      final delete = DORMDelete(from: tableName);

      final expected = {
        'job': 'delete',
        'from': tableName,
      };

      expect(delete.toJson(), expected);
    });

    test('Maximal object construction', () {
      final tableName = 'table_name';

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

      final delete = DORMDelete(
        from: tableName,
        where: where,
        before: before,
        after: after,
      );

      final expected = {
        'job': 'delete',
        'from': tableName,
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

      expect(delete.toJson(), expected);
    });
  });

  group('Default class functions', () {
    test('equals', () {
      final tableName = 'table_name';

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

      final delete1 = DORMDelete(
        from: tableName,
        where: where,
        before: before,
        after: after,
      );

      final delete2 = DORMDelete(
        from: tableName,
        where: where,
        before: before,
        after: after,
      );

      final delete3 = DORMDelete(
        from: 'wrong_table_name',
        where: where,
        before: before,
        after: after,
      );

      expect(delete1, delete2);
      expect(delete1, isNot(delete3));
    });
  });
}
