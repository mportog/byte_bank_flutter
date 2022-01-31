import 'package:byte_bank_alura_app/models/contact_model.dart';
import 'package:byte_bank_alura_app/pages/contacts_page.dart';
import 'package:byte_bank_alura_app/pages/dashboard_page.dart';
import 'package:byte_bank_alura_app/pages/edit_contact_page.dart';
import 'package:byte_bank_alura_app/pages/error_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final String argumentNotCompatible = 'Wrong type parameter: $args';
    Widget page;
    switch (settings.name) {
      case dashboardPageRouteName:
        page = const DashboardPage();
        break;
      case contactsPageRouteName:
        page = const ContactsPage();
        break;
      case editPageRouteName:
        if (args == null) {
          page = const EditContactPage();
        } else if (args is Contact) {
          page = EditContactPage(contact: args);
        } else {
          page = ErrorPage(
            errorMessage: argumentNotCompatible,
          );
        }
        break;
      default:
        page = ErrorPage(errorMessage: settings.name);
    }
    return MaterialPageRoute(builder: (_) => page);
  }
}
