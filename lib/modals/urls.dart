import 'package:json_annotation/json_annotation.dart';
part 'urls.g.dart';

@JsonSerializable()
class Urls {
  String raw,full;

  Urls({this.raw,this.full});

  factory Urls.fromJson(Map<String,dynamic> data) => _$UrlsFromJson(data);

  Map<String,dynamic> toJson() => _$UrlsToJson(this);

}