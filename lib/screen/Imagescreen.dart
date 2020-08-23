import 'package:flutter/material.dart';
import 'package:flutterwork/providerPage/Photoprovider.dart';
import 'package:provider/provider.dart';

//final photoProvider = Photoprovider();

class Imagescreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:
            //(imagefullscreen == null)
//             Center(
//          child:
//          CircularProgressIndicator(),
//        )
            Consumer<Photoprovider>(
                builder: (_, photoProvider, __) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(photoProvider.getphoto),
                            fit: BoxFit.cover,
                            alignment: Alignment.center),
                      ),
                    )));
  }
}
