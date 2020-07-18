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

        appBar: AppBar(
          title: Text('User'),
        ),
        body: (imagefullscreen == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<Photoprovider>(
            builder: (_, photoProvider, __) =>
               ListView.builder(
                  itemCount: imagefullscreen.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(imagefullscreen[index].user.username.toString(),
                        textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                            color: Colors.lightBlue,
                          )),
                      leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(imagefullscreen[index].urls.raw)),
                      onTap: () {
                        photoProvider.setphoto(imagefullscreen[index].urls.full);
                        print(photoProvider.getphoto);
//                      Navigator.of(context).push(MaterialPageRoute(
//                          builder: (context) => Imagescreen(
//                              image: photoProvider.getphoto)));
                     },
                    );
                  }),
            ));
  }
}
