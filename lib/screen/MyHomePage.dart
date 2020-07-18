import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutterwork/providerPage/Photoprovider.dart';
import 'package:flutterwork/screen/Imagescreen.dart';
import 'package:flutterwork/screen/ProfileUser.dart';
import 'package:flutterwork/screen/QRpage.dart';
import 'package:flutterwork/service/AuthorService.dart';
import 'package:provider/provider.dart';
import 'Listexample.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      // ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // This navigator state will be used to navigate different pages
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  final AuthorService authorService = AuthorService();
  //final Photoprovider photoService = Photoprovider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (BuildContext context) => Photoprovider()),
          FutureProvider(create: (context) => authorService.fetchauthors(),     catchError: (context, error) {
        print(error.toString());
     },),
      ],child:
//    Consumer<Photoprovider>(
//        builder: (context, provider, child) =>
         SafeArea(
        child: Scaffold(
          body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
          bottomNavigationBar: _bottomNavigationBar(),
        ),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return CurvedNavigationBar(
      index: 0,
      height: 60.0,
      items: <Widget>[
        Icon(Icons.perm_identity, size: 30),
        Icon(Icons.list, size: 30),
        Icon(Icons.assistant_photo, size: 30),
        Icon(Icons.photo, size: 30),
      ],
      color: Colors.blueAccent,
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.yellowAccent,
      animationCurve: Curves.easeInCubic,
      animationDuration: Duration(milliseconds: 600),

      onTap: _onTap,
      //index: _currentTabIndex,
    );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState.pushReplacementNamed("Home");
        break;
      case 1:
        _navigatorKey.currentState.pushReplacementNamed("QR");
        break;
      case 2:
        _navigatorKey.currentState.pushReplacementNamed("Profile");
        break;
      case 3:
        _navigatorKey.currentState.pushReplacementNamed("Photo");
        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "Home":
        return MaterialPageRoute(builder: (context) =>ProfileUser() );

      case "QR":
        return MaterialPageRoute(builder: (context) => Listexample() );
      case "Photo":
        return MaterialPageRoute(builder: (context) => Imagescreen());
      case "Profile":
        return MaterialPageRoute(builder: (context) =>  GeneratePage());

      default:
        return MaterialPageRoute(builder: (context) => ProfileUser());
    }
  }
}
