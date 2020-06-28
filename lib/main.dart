//import 'package:akrams_app/pages/home_page.dart';
import 'package:akrams_app/pages/home_page.dart';
import 'package:akrams_app/pages/home_page_with_fb.dart';
import 'package:akrams_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:akrams_app/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance()
;  runApp(MyApp()
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Constants.prefs.getBool("loggedIn") == true 
      ? HomePageFB() 
      : LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        // ignore: equal_keys_in_map
        HomePage.routeName: (context) => HomePage(),
      },
      );
  }
}