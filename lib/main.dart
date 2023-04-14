import 'package:congo_tourisme/pages/accueil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/splash.dart';
import 'utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Congo Tourisme',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Utils.gojekSwatch,
        ),
        home: Splash()
        //Accueil(),
        );
  }
}
