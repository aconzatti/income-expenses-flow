import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:income_expenses_flow/src/app.dart';
import 'package:income_expenses_flow/firebase_options.dart';

sum({required int n1, int? n2}) {
  return n1 + (n2 ?? 0);
}

sumSuggar({required int n1, int? n2}) => n1 + (n2 ?? 0);

void main() {
  initApplication();
  runApp(const App());
}

initApplication() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
