import 'package:flutter/material.dart';
import 'package:magento_mobile/constants.dart';
import 'package:magento_mobile/routes.dart';
import 'package:magento_mobile/screens/splash/splash_screen.dart';
import 'package:magento_mobile/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: AppName,
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      // home: Scaffold(
      //   body: Column(children: [Text("dsfsbdfubds huf dshu fhu")]),
      // )
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
