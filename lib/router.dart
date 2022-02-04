import 'package:byte_bank_alura_app/pages/dashboard_page.dart';
import 'package:byte_bank_alura_app/routes/contacts_route.dart';
import 'package:byte_bank_alura_app/routes/dashboard_route.dart';
import 'package:byte_bank_alura_app/routes/edit_route.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:nuvigator/next.dart';

class MyRouter extends NuRouter {
  @override
  String get initialRoute => dashboardPageRouteName;

  @override
  List<NuRoute> get registerRoutes => [
        DashboardRoute(),
        ContactsRoute(),
        EditContactRoute(),
      ];
}

Widget build(BuildContext context) {
  return Nuvigator(
    router: MyRouter(),
  );
}
