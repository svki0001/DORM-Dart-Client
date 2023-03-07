## main.dart
```Dart
import 'package:dorm_client/dorm_client.dart';
import 'package:dorm_example/models/profile.dart';

DORM _dorm = DORM(
  schema: "DORM 0.0.3",
  url: "https://dorm.taskforce.space/api.php",
  token: "1234556",
);

void main(List<String> arguments) async {
  DORMRequest request = DORMRequest().addRead(
    from: Profile.tableName,
  );

  DORMResponse response = await _dorm.post(request);

  List<Profile>? profiles = response.rows(
    "identspace_profile",
    (json) => Profile.fromJson(json),
  );

  print(profiles);
}
```

## profile.dart
```Dart
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  static final String tableName = "identspace_profile";

  final String id;
  final String name;

  Profile({
    required this.id,
    required this.name,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  @override
  String toString() {
    return "$id: $name";
  }
}
```
## profile.g.dart
```Dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
```