import 'package:flutterwork/modals/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'urls.dart';
part 'author.g.dart';

@JsonSerializable(explicitToJson: true)
class Author {
  String id;
  Urls urls;
  User user;

  Author({this.id,this.urls, this.user});

  factory Author.fromJson(Map<String,dynamic> data) => _$AuthorFromJson(data);

  Map<String,dynamic> toJson() => _$AuthorToJson(this);

}