import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mission K3',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
          fontFamily: 'Barlow',
          textTheme: TextTheme(
              headline1: const TextStyle(
                  fontSize: 70,
                  color: Colors.white,
                  fontFamily: 'DMSerifDisplay'),
              headline2: const TextStyle(
                  fontSize: 55,
                  color: Colors.white,
                  fontFamily: 'DMSerifDisplay'),
              headline3: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontFamily: 'DMSerifDisplay'),
              subtitle1: TextStyle(fontSize: 30, color: Colors.grey[500]),
              subtitle2: TextStyle(fontSize: 20, color: Colors.grey[500]),
              bodyText1:
                  const TextStyle(fontSize: 20, color: Colors.white, height: 1.25),
              bodyText2:
                  const TextStyle(fontSize: 17, color: Colors.white, height: 1.25),
              caption:
                  const TextStyle(fontSize: 15, color: Colors.white, height: 1.25),
              button: const TextStyle(fontSize: 17, color: Color(0xff1e1e24)))),
      home: HomePage(),
    );
  }
}
