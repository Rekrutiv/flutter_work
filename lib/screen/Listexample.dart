import 'package:flutter/material.dart';
import 'package:flutterwork/modals/author.dart';
import 'package:flutterwork/providerPage/Photoprovider.dart';
import 'package:provider/provider.dart';

final photoProvider = Photoprovider();

class Listexample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Author> imagefullscreen = Provider.of<List<Author>>(context);
    //final photo = Provider.of<Photoprovider>(context, listen: false);

    return Scaffold(
        body: (imagefullscreen == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<Photoprovider>(
                builder: (_, photoProvider, __) => ListView.builder(
                    itemCount: imagefullscreen.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Image.network(
                                imagefullscreen[index].urls.raw,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                  imagefullscreen[index].user.username.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 25,
                                    color: Colors.lightBlue,
                                  ))
                            ],
                          ),
                        ),
                      );
//                      ListTile(
//                      title: Text(imagefullscreen[index].user.username.toString(),
//                        textAlign: TextAlign.center,
//                          style: TextStyle(
//                            fontWeight: FontWeight.w400,
//                            fontSize: 25,
//                            color: Colors.lightBlue,
//                          )),
//                      leading: CircleAvatar(
//                          backgroundImage:
//                              NetworkImage(imagefullscreen[index].urls.raw)),
//                      onTap: () {
//                        photoProvider.setphoto(imagefullscreen[index].urls.full);
//                        print(photoProvider.getphoto);
////                      Navigator.of(context).push(MaterialPageRoute(
////                          builder: (context) => Imagescreen(
////                              image: photoProvider.getphoto)));
//                     },
//                    );
                    }),
              ));
  }
}
