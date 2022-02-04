import 'package:byte_bank_alura_app/pages/contacts_page.dart';
import 'package:byte_bank_alura_app/pages/edit_contact_page.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:nuvigator/next.dart';

const String contactParameter = 'contact';

class ContactsRoute extends NuRoute {
  @override
  String get path => contactsPageRouteName;

  @override
  ScreenType get screenType => materialScreenType;

  @override
  Widget build(BuildContext context, NuRouteSettings settings) {
    return ContactsPage(
      onAddOrEditContactClick: (parameters) =>
          nuvigator.open(editPageRouteName),
      contact: settings.rawParameters[contactParameter],
    );
  }
}
