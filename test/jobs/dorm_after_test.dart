import 'package:dorm_client/src/models/jobs/after/dorm_after.dart';
import 'package:dorm_client/src/models/jobs/after/dorm_to_base64.dart';
import 'package:test/test.dart';

void main() {
  group('After Construction', () {
    test('toJson should return an empty map when there are no jobs', () {
      final after = DORMAfter(jobs: []);

      final expected = {};

      expect(after.toJson(), expected);
    });

    test('toJson should return a map with job data when there are jobs', () {
      final job1 = DORMtoBase64(['picture', 'file']);

      final after = DORMAfter(jobs: [job1]);

      final expected = {
        'toBase64': ['picture', 'file'],
      };

      expect(after.toJson(), expected);
    });
  });
}
