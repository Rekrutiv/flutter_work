import 'package:flutter/material.dart';
import 'package:flutterwork/ProviderPage/Photoprovider.dart';
import 'package:provider/provider.dart';

class Imagescreen extends StatelessWidget {
  final String image;
  final photoProvider = Photoprovider();

  Imagescreen({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Consumer<Photoprovider>(
        builder: (context, photoProvider, __) => Scaffold(
            appBar: AppBar(
              title: Text('User'),
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(photoProvider.getphoto),
                    fit: BoxFit.cover,
                    alignment: Alignment.center),
              ),
            )));
  }
}
