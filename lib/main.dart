import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const InitialApp());
}

class InitialApp extends StatelessWidget {
  const InitialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const InitialClass(),
        ),
      ],
    );
  }
}

class InitialClass extends StatelessWidget {
  const InitialClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text('Hello'),
      ),
    );
  }
}
