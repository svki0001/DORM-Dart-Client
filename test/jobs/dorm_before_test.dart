import 'package:dorm_client/src/models/jobs/before/dorm_before.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_from_base64.dart';
import 'package:dorm_client/src/models/jobs/before/dorm_last_insert_id.dart';
import 'package:test/test.dart';

void main() {
  group('Before Construction', () {
    test('toJson should return an empty map when there are no jobs', () {
      final before = DORMBefore(jobs: []);

      final expected = {};

      expect(before.toJson(), expected);
    });

    test('toJson should return a map with job data when there are jobs', () {
      final job1 = DORMLastInsertId(
        fromTable: 'last_insert_id_table_name',
        setColumn: 'column_name',
      );
      final job2 = DORMFromBase64(['picture', 'file']);

      final before = DORMBefore(jobs: [job1, job2]);

      final expected = {
        'lastInsertId': {
          'fromTable': 'last_insert_id_table_name',
          'setColumn': 'column_name',
        },
        'fromBase64': ['picture', 'file'],
      };

      expect(before.toJson(), expected);
    });

    test('fromJson should return an empty object when there are no jobs', () {
      final compareBefore = DORMBefore(jobs: []);

      final equalBefore = DORMBefore.fromJson({});

      expect(compareBefore, equalBefore);
    });

    test('fromJson should return a list of jobs when there are jobs', () {
      final job1 = DORMLastInsertId(
        fromTable: 'last_insert_id_table_name',
        setColumn: 'column_name',
      );
      final job2 = DORMFromBase64(['picture', 'file']);

      final compareBefore = DORMBefore(jobs: [job1, job2]);

      final json = {
        'lastInsertId': {
          'fromTable': 'last_insert_id_table_name',
          'setColumn': 'column_name',
        },
        'fromBase64': ['picture', 'file'],
      };

      final equalBefore = DORMBefore.fromJson(json);

      expect(compareBefore, equalBefore);
    });
  });

  group('Default class functions', () {
    test('equals', () {
      final job1 = DORMLastInsertId(
        fromTable: 'last_insert_id_table_name',
        setColumn: 'column_name',
      );
      final job2 = DORMLastInsertId(
        fromTable: 'last_insert_id_table_name',
        setColumn: 'column_name',
      );
      final job3 = DORMLastInsertId(
        fromTable: 'table_name',
        setColumn: 'name_column',
      );

      final compareBefore = DORMBefore(jobs: [job1]);
      final equalBefore = DORMBefore(jobs: [job2]);
      final unequalBefore = DORMBefore(jobs: [job3]);

      expect(compareBefore, equalBefore);
      expect(compareBefore, isNot(unequalBefore));
    });
  });
}
