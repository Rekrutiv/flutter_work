import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: false)
class User {
  String name;
  String username;


  User({this.name, this.username});

  factory User.fromJson(Map<String,dynamic> data) => _$UserFromJson(data);

  Map<String,dynamic> toJson() => _$UserToJson(this);

}