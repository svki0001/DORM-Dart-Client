import 'package:dorm_client/dorm_client.dart';
import 'package:dorm_example/models/profile.dart';

DORM _dorm = DORM(
  schema: "DORM 0.0.3",
  url: "https://dorm.taskforce.space/api.php",
  token: "1234556",
);

void main(List<String> arguments) async {
  DORMRequest request = DORMRequest().addRead(
    from: "identspace_profile",
  );

  DORMResponse response = await _dorm.post(request);

  List<Profile>? profiles = response.rows<Profile>(
    (json) => Profile.fromJson(json),
  );

  print(profiles);
}
