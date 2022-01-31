import 'package:byte_bank_alura_app/database/app_database.dart';
import 'package:byte_bank_alura_app/helpers/constants.dart';
import 'package:byte_bank_alura_app/models/contact_model.dart';
import 'package:byte_bank_alura_app/pages/error_page.dart';
import 'package:byte_bank_alura_app/widgets/custom_contact_card_widget.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(contactsPageTitle),
        ),
        body: FutureBuilder(
            future: findAll(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return const ErrorPage();
                  } else {
                    final List<Contact> contacts =
                        snapshot.data as List<Contact>;
                    return ListView.builder(
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          return ContactCardWidget(contact: contacts[index]);
                        });
                  }
                default:
                  return const ErrorPage();
              }
            }),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text(addContactLabel),
          elevation: cardElevation,
          onPressed: () => Navigator.pushNamed(context, 'edit'),
          icon: newContacIcon,
          tooltip: addContactLabel,
        ));
  }
}
