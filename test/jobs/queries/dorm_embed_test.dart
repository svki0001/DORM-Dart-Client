import 'package:dorm_client/src/models/jobs/queries/dorm_embed.dart';
import 'package:test/test.dart';

void main() {
  group('Embed Construction', () {
    test('Minimal object construction', () {
      final tableName = 'table_name';

      final embed = DORMEmbed(table: tableName);

      final expected = {'table': tableName};

      expect(embed.toJson(), expected);
    });
  });
}
