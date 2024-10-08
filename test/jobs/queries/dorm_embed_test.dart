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

    test('fromJson construction', () {
      final tableName = 'table_name';

      final compareEmbed = DORMEmbed(table: tableName);

      final json = {'table': tableName};

      final equalEmbed = DORMEmbed.fromJson(json);

      expect(compareEmbed, equalEmbed);
    });
  });

  group('Default class functions', () {
    test('equals', () {
      final equalTableName = 'table_name';
      final unequalTableName = 'name_table';

      final compareEmbed = DORMEmbed(table: equalTableName);
      final equalEmbed = DORMEmbed(table: equalTableName);
      final unequalEmbed = DORMEmbed(table: unequalTableName);

      expect(compareEmbed, equalEmbed);
      expect(compareEmbed, isNot(unequalEmbed));
    });
  });
}
