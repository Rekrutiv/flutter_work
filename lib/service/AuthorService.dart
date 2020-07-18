import 'package:flutterwork/modals/author.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const json_API =
    "https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0";

class AuthorService {

  Future<List<Author>> fetchauthors() async {
  //  await Future.delayed(Duration(seconds: 3));
    var response = await http.get("https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0");
    List<dynamic> data = convert.jsonDecode(response.body) as List;
    List<Author> author = data.map((data) => Author.fromJson(data)).toList();
    return author;
  }
}
