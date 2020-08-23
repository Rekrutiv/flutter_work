import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class GeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QRpage();
}

class QRpage extends State<GeneratePage> {
  String qrData =
      "https://github.com/rekrutiv"; // already generated qr code when the page opens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.yellowAccent,
          padding: EdgeInsets.all(35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              QrImage(
                //plce where the QR Image will be shown
                data: qrData,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "New QR Link Generator",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue,
                ),
              ),
              TextField(
                controller: qrdataFeed,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Input your link or data",
                ),
                style: TextStyle(
                  color: Colors.blue,
                  // backgroundColor: Colors.blueGrey,
                  fontFamily: 'OpenSans',
                  fontSize: 20.0,

                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: FlatButton(
                  padding: EdgeInsets.all(15.0),
                  onPressed: () async {
                    if (qrdataFeed.text.isEmpty) {
                      //a little validation for the textfield
                      setState(() {
                        qrData = "";
                      });
                    } else {
                      setState(() {
                        qrData = qrdataFeed.text;
                      });
                    }
                  },
                  child: Text(
                    "Generate QR",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue, width: 3.0),
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final qrdataFeed = TextEditingController();
}
