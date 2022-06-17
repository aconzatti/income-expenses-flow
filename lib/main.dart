import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:income_expenses_flow/src/app.dart';
import 'package:income_expenses_flow/firebase_options.dart';

void main() {
  initApplication();
  runApp(const App());
}

initApplication() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
