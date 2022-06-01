// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_k3_web/homepage.dart';

import 'views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAP-5Tbc4CxouX6FPjCEuTSrz-y1mwk0s8",
        appId: "1:735665091280:web:4ae1830ca3a7cdeecf24d5",
        projectId: "mission-k3-4f577",
        storageBucket: "mission-k3-4f577.appspot.com",
        messagingSenderId: "735665091280",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  User? firebaseUser = FirebaseAuth.instance.currentUser;
  // Define a widget
  late Widget firstWidget;

  MyApp({Key? key}) : super(key: key);

// Assign widget based on availability of currentUser

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (firebaseUser != null) {
      firstWidget = const HomePageView();
    } else {
      firstWidget = const LoginScreen();
    }
    return GetMaterialApp(
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
              bodyText1: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                height: 1.25,
              ),
              bodyText2: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                height: 1.25,
              ),
              caption: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                height: 1.25,
              ),
              button: const TextStyle(fontSize: 17, color: Color(0xff1e1e24)))),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => firstWidget,
        ),
        GetPage(
          name: '/home',
          page: () => const HomePageView(),
        ),
      ],
    );
  }
}
