import 'package:dorm_client/src/models/before/dorm_before.dart';
import 'package:dorm_client/src/models/before/dorm_from_base64.dart';
import 'package:dorm_client/src/models/before/dorm_last_insert_id.dart';
import 'package:test/test.dart';

void main() {
  group('Construction', () {
    test('toJson should return an empty map when there are no jobs', () {
      final before = DORMBefore(jobs: []);

      expect(before.toJson(), {
        "before": {},
      });
    });

    test('toJson should return a map with job data when there are jobs', () {
      final job1 = DORMLastInsertId(
        fromTable: 'table_name',
        setColumn: 'column_name',
      );
      final job2 = DORMFromBase64(['picture', 'file']);

      final before = DORMBefore(jobs: [job1, job2]);

      final expectedJson = {
        "before": {
          "lastInsertId": {
            "fromTable": "table_name",
            "setColumn": "column_name",
          },
          "fromBase64": ['picture', 'file'],
        },
      };

      expect(before.toJson(), expectedJson);
    });
  });
}
