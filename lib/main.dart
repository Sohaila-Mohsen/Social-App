import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:testfb/src/app_root.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AppRoot());
}
