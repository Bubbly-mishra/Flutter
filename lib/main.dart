import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_doyel/constants/constants.dart';
import 'package:flutter_doyel/ui/login.dart';
import 'package:flutter_doyel/ui/signup.dart';
import 'package:flutter_doyel/ui/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login",
      theme: ThemeData(primaryColor: Colors.orange[200]),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) =>  SplashScreen(),
        LOG_IN: (BuildContext context) =>  LogInPage(),
        SIGN_UP: (BuildContext context) =>  SignUpScreen(),
      },
      initialRoute: SPLASH_SCREEN,
    );
  }
}



