import 'package:byte_bank_alura_app/pages/contacts_page.dart';
import 'package:byte_bank_alura_app/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:nuvigator/next.dart';

class DashboardRoute extends NuRoute {
  @override
  String get path => dashboardPageRouteName;

  @override
  ScreenType get screenType => materialScreenType;

  @override
  Widget build(BuildContext context, NuRouteSettings settings) {
    return DashboardPage(
      onContactsClick: () => nuvigator.open(contactsPageRouteName),
    );
  }
}
