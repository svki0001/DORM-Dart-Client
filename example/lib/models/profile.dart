import 'package:dorm_client/dorm_client.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@DORMTable("identspace_profile")
@JsonSerializable()
class Profile {
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
