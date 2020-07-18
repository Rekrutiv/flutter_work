import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProfileUser extends StatefulWidget {
  @override
  _ProfileUser createState() => _ProfileUser();
}

class _ProfileUser extends State<ProfileUser> {
  File imageUrl;

  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('User'),
        ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF73AEF5),
                    Color(0xFF61A4F1),
                    Color(0xFF478DE0),
                    Color(0xFF398AE5),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 40.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
//                      Align(
//                        alignment: Alignment.topCenter,
//                        // child: Container(width: 50, height: 50, color: Colors.red),
//                      ),
                    SizedBox(
                      child: (imageUrl != null)
                          ? SizedBox(
                              height: 200.0,
                              width: 200.0,
                              child: Image.file(imageUrl))
                          : Placeholder(
                              fallbackHeight: 100.0, fallbackWidth: 100.0),
                    ),
                    RaisedButton(
                      child: Text('Upload Image'),
                      color: Colors.lightBlue,
                      onPressed: () => uploadImage(),
                    ),
                    Text(
                      'Your Full Name',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.yellowAccent,
                      ),
                    ),
                    TextField(
                      //controller: passwordController,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // contentPadding: EdgeInsets.only(top: 14.0),
                        hintText: 'Enter your Full Name',
                      ),
                    ),
                    Text(
                      'Your Age',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.yellowAccent,
                      ),
                    ),
                    TextField(
                      // controller: emailController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 20.0,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your AGE',
                      ),
                    ),
                    Text(
                      'Your Phone',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.yellowAccent,
                      ),
                    ),
                    TextField(
                      // controller: emailController,

                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 20.0,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your PHONE',
                      ),
                    ),
//                    TextField(
//                      //  controller: qrdataFeed,
//                      decoration: InputDecoration(
//                        hintText: "Input your link or data",
//                      ),
//                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  makePostRequest(File file) async {

    final uri = 'https://flutter-test.redentu.com';
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {'password': 123456, 'login_name': 'Rekrutiv', 'photo': file};

    String jsonBody = json.encode(body);
   // final encoding = Encoding.getByName('utf-8');

    Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
     // encoding: encoding,
    );

    int statusCode = response.statusCode;
    print(statusCode);
    String responseBody = response.body;
    print( responseBody);
  }
  uploadImage() async {
    final _picker = ImagePicker();
    PickedFile image;

    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
      var fileImage = File(image.path);
      makePostRequest(fileImage);
      if (image != null) {
        setState(() {
          imageUrl = fileImage;

        });
      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }
  }
}
