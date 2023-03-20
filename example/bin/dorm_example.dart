import 'package:dorm_client/dorm_client.dart';
import 'package:dorm_example/models/profile.dart';

DORM _dorm = DORM(
  schema: "DORM 0.0.5",
  url: "localhost/api.php",
  token: "",
);

void main(List<String> arguments) async {
  DORMRequest request = DORMRequest().addRead(
    from: "profile",
  );

  DORMResponse response = await _dorm.post(request);

  List<Profile>? profiles = response.rows(
    "profile",
    (json) => Profile.fromJson(json),
  );

  print(profiles);
}
