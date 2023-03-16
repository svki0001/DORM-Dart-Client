import 'package:dorm_client/dorm_client.dart';
import 'package:dorm_example/models/profile.dart';

DORM _dorm = DORM(
  schema: "DORM 0.0.3",
  url: "http://technologielabor.stud.unixag.net/dorm/api.php",
  token: "Bz2&1z2IwdW0",
);

void main(List<String> arguments) async {
  DORMRequest request = DORMRequest().addRead(
    from: "vtl_mask_aligner",
  );

  DORMResponse response = await _dorm.post(request);

  // List<Profile>? profiles = response.rows(
  //   "identspace_profile",
  //   (json) => Profile.fromJson(json),
  // );

  // print(profiles);
}
