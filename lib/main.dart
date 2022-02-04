import 'package:byte_bank_alura_app/helpers/constants.dart';
import 'package:byte_bank_alura_app/router.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:nuvigator/next.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      home: Nuvigator(router: MyRouter()),
    );
  }
}
