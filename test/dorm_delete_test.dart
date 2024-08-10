import 'package:dorm_client/src/models/after/dorm_after.dart';
import 'package:dorm_client/src/models/after/dorm_to_base64.dart';
import 'package:dorm_client/src/models/before/dorm_before.dart';
import 'package:dorm_client/src/models/before/dorm_from_base64.dart';
import 'package:dorm_client/src/models/before/dorm_last_insert_id.dart';
import 'package:dorm_client/src/models/dorm_where.dart';
import 'package:dorm_client/src/models/jobs/dorm_delete.dart';
import 'package:test/test.dart';

void main() {
  group('Delete Construction', () {
    test('Minimal object construction', () {
      final tableName = 'table_name';

      final delete = DORMDelete(from: tableName);

      expect(delete.toJson(), {
        'job': 'delete',
        'from': tableName,
      });
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

      expect(delete.toJson(), {
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
      });
    });
  });
}
