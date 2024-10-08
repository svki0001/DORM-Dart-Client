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

    test('fromJson should return an empty object when there are no jobs', () {
      final after = DORMAfter.fromJson({});

      expect(after.jobs, []);
    });

    // TODO: check json from DORM
    test('fromJson should return a list of jobs when there are jobs', () {
      final compareJob1 = DORMtoBase64(['picture', 'file']);

      final json = {
        'toBase64': ['picture', 'file'],
      };

      final equalJob1 = DORMtoBase64.fromJson(json);
      final compareAfter = DORMAfter(jobs: [compareJob1]);
      final equalAfter = DORMAfter.fromJson(json);

      expect(compareAfter, equalAfter);
      expect(compareAfter.jobs[0], equalAfter.jobs[0]);
      expect(compareAfter.jobs[0], equalJob1);
    });
  });

  group('Default class functions', () {
    test('equals', () {
      final job1 = DORMtoBase64(['picture', 'file']);
      final job2 = DORMtoBase64(['picture', 'file']);
      final job3 = DORMtoBase64(['file', 'picture']);

      final compareAfter = DORMAfter(jobs: [job1]);
      final equalAfter = DORMAfter(jobs: [job2]);
      final unequalAfter = DORMAfter(jobs: [job3]);

      expect(compareAfter, equalAfter);
      expect(compareAfter, isNot(unequalAfter));
    });
  });
}
