import 'package:dorm_client/dorm_client.dart';
import 'package:dorm_example/models/profile.dart';

DORM _dorm = DORM(
  schema: "DORM 0.1.0",
  url: "https://dorm.taskforce.space/api.php",
  token: "123456",
);

void main(List<String> arguments) async {
  DORMRequest request = DORMRequest().addRead(
    from: Profile.tableName,
  );

  DORMResponse response = await _dorm.post(request, authorization: "Bearer 123456");

  List<Profile>? profiles = response.rows(
    "profile",
    (json) => Profile.fromJson(json),
  );

  print(profiles);
}
