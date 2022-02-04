import 'package:byte_bank_alura_app/pages/edit_contact_page.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:nuvigator/next.dart';

class EditContactRoute extends NuRoute {
  @override
  String get path => editPageRouteName;

  @override
  ScreenType get screenType => materialScreenType;

  @override
  Widget build(BuildContext context, NuRouteSettings settings) {
    return const EditContactPage();
  }
}
