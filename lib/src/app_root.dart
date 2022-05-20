import 'package:flutter/material.dart';
import 'package:testfb/provider/google_signin_provider.dart';
import 'package:provider/provider.dart';
import '../views/splash.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.black),
          home: SplachScreen(),
        ));
  }
}
