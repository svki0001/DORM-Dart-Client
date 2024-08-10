import 'package:dorm_client/src/models/after/dorm_after.dart';
import 'package:dorm_client/src/models/after/dorm_to_base64.dart';
import 'package:dorm_client/src/models/before/dorm_before.dart';
import 'package:dorm_client/src/models/before/dorm_from_base64.dart';
import 'package:dorm_client/src/models/before/dorm_last_insert_id.dart';
import 'package:dorm_client/src/models/dorm_column.dart';
import 'package:dorm_client/src/models/dorm_join.dart';
import 'package:dorm_client/src/models/dorm_order.dart';
import 'package:dorm_client/src/models/dorm_where.dart';
import 'package:dorm_client/src/models/jobs/dorm_read.dart';
import 'package:test/test.dart';

void main() {
  group('Read Construction', () {
    test('Minimal object construction', () {
      final tableName = 'table_name';

      final read = DORMRead(
        from: tableName,
      );

      expect(read.toJson(), {
        'job': 'read',
        'from': tableName,
      });
    });

    test('Maximal object construction', () {
      final tableName = 'table_name';

      final columns = [
        DORMColumn(column: 'column1_name'),
        DORMColumn(column: 'column2_name'),
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

      final join = DORMJoin(jobsColumns: {
        'table1_name': 'column1_name',
        'table2_name': 'column2_name',
      });

      final order = DORMOrder(
        column: 'column_name',
        sort: 'DESC',
      );

      final limit = 1000;

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

      final read = DORMRead(
        from: tableName,
        columns: columns,
        where: where,
        join: join,
        order: order,
        limit: limit,
        before: before,
        after: after,
      );

      expect(read.toJson(), {
        'job': 'read',
        'from': tableName,
        'columns': [
          {'column': 'column1_name'},
          {'column': 'column2_name'},
        ],
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
        'join': {
          'table1_name': 'column1_name',
          'table2_name': 'column2_name',
        },
        'order': {
          'column': 'column_name',
          'sort': 'DESC',
        },
        'limit': 1000,
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
