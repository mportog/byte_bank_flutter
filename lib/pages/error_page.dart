import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({this.errorMessage, Key? key}) : super(key: key);
  final String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage ?? '404 - Not Found'));
  }
}
