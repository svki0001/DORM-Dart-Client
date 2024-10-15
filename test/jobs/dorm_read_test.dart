import 'package:dorm_client/src/models/jobs/after/dorm_after.dart';
import 'package:dorm_client/src/models/jobs/after/dorm_to_base64.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_before.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_from_base64.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_last_insert_id.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_column.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_embed.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_join.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_order.dart';
import 'package:dorm_client/src/models/jobs/queries/dorm_where.dart';
import 'package:dorm_client/src/models/jobs/dorm_read.dart';
import 'package:test/test.dart';

void main() {
  group('Read Construction', () {
    test('Minimal object construction', () {
      final tableName = 'table_name';

      final read = DORMRead(
        from: tableName,
      );

      final expected = {
        'job': 'read',
        'from': tableName,
      };

      expect(read.toJson(), expected);
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

      final joins = [
        DORMJoin(
          joins: [
            (tableName: 'table1_name', columnName: 'column1_name'),
            (tableName: 'table2_name', columnName: 'column2_name'),
          ],
        ),
      ];

      final order = DORMOrder(
        column: 'column_name',
        sort: 'DESC',
      );

      final limit = 1000;

      final embeds = [
        DORMEmbed(table: 'embed1_table_name'),
        DORMEmbed(table: 'embed2_table_name'),
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

      final read = DORMRead(
        from: tableName,
        columns: columns,
        where: where,
        join: joins,
        order: order,
        limit: limit,
        embed: embeds,
        before: before,
        after: after,
      );

      final expected = {
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
        'join': [
          {
            'table1_name': 'column1_name',
            'table2_name': 'column2_name',
          },
        ],
        'order': {
          'column': 'column_name',
          'sort': 'DESC',
        },
        'limit': 1000,
        'embed': [
          {'table': 'embed1_table_name'},
          {'table': 'embed2_table_name'},
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

      expect(read.toJson(), expected);
    });
  });

  group('Default class functions', () {
    test('equals', () {
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

      final joins = [
        DORMJoin(
          joins: [
            (tableName: 'table1_name', columnName: 'column1_name'),
            (tableName: 'table2_name', columnName: 'column2_name'),
          ],
        ),
      ];

      final order = DORMOrder(
        column: 'column_name',
        sort: 'DESC',
      );

      final limit = 1000;

      final embeds = [
        DORMEmbed(table: 'embed1_table_name'),
        DORMEmbed(table: 'embed2_table_name'),
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

      final read1 = DORMRead(
        from: tableName,
        columns: columns,
        where: where,
        join: joins,
        order: order,
        limit: limit,
        embed: embeds,
        before: before,
        after: after,
      );

      final read2 = DORMRead(
        from: tableName,
        columns: columns,
        where: where,
        join: joins,
        order: order,
        limit: limit,
        embed: embeds,
        before: before,
        after: after,
      );

      final read3 = DORMRead(
        from: 'table_name',
        columns: [
          DORMColumn(column: 'column1_name'),
          DORMColumn(column: 'column2_name'),
        ],
        where: [
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
        ],
        join: [
          DORMJoin(
            joins: [
              (tableName: 'table1_name', columnName: 'column1_name'),
              (tableName: 'table2_name', columnName: 'column2_name'),
            ],
          ),
        ],
        order: DORMOrder(
          column: 'column_name',
          sort: 'DESC',
        ),
        limit: 1000,
        embed: [
          DORMEmbed(table: 'embed1_table_name'),
          DORMEmbed(table: 'embed2_table_name'),
        ],
        before: DORMBefore(
          jobs: [
            DORMLastInsertId(
              fromTable: 'last_insert_id_table_name',
              setColumn: 'column_name',
            ),
            DORMFromBase64(['picture', 'file']),
          ],
        ),
        after: DORMAfter(
          jobs: [
            DORMtoBase64(['picture', 'file']),
          ],
        ),
      );

      expect(read1, read2);
      expect(read1, isNot(read3));
    });
  });
}
