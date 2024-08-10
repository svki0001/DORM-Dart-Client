import 'package:dorm_client/src/models/after/dorm_after.dart';
import 'package:dorm_client/src/models/after/dorm_to_base64.dart';
import 'package:test/test.dart';

void main() {
  group('Construction', () {
    test('toJson should return an empty map when there are no jobs', () {
      final after = DORMAfter(jobs: []);

      expect(after.toJson(), {
        "after": {},
      });
    });

    test('toJson should return a map with job data when there are jobs', () {
      final job1 = DORMtoBase64(['picture', 'file']);

      final after = DORMAfter(jobs: [job1]);

      final expectedJson = {
        "after": {
          "toBase64": ['picture', 'file'],
        },
      };

      expect(after.toJson(), expectedJson);
    });
  });
}
