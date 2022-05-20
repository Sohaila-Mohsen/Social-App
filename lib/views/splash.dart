import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:testfb/views/home.dart';

import '../core/utils/navigation.dart';
import '../core/utils/sizeConfig.dart';

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        body: Center(
      child: Lottie.asset("Assets/images/73937-social.json"),
    ));
  }

  startTime() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    AppNavigator.customNavigator(
        context: context, screen: const Home(), finish: false);
  }
}
