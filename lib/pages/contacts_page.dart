import 'package:byte_bank_alura_app/dao/contact_dao.dart';
import 'package:byte_bank_alura_app/helpers/constants.dart';
import 'package:byte_bank_alura_app/models/contact_model.dart';
import 'package:byte_bank_alura_app/pages/edit_contact_page.dart';
import 'package:byte_bank_alura_app/pages/error_page.dart';
import 'package:byte_bank_alura_app/widgets/custom_contact_card_widget.dart';
import 'package:flutter/material.dart';

const String contactsPageRouteName = 'contacts';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final ContactDao _contactDao = ContactDao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(contactsPageTitle),
        ),
        body: FutureBuilder(
            future: _contactDao.getAll(),
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
          onPressed: () => Navigator.pushNamed(context, editPageRouteName),
          icon: newContacIcon,
          tooltip: addContactLabel,
        ));
  }
}
