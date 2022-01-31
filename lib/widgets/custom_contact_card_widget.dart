import 'package:byte_bank_alura_app/helpers/constants.dart';
import 'package:byte_bank_alura_app/models/contact_model.dart';
import 'package:flutter/material.dart';

class ContactCardWidget extends StatelessWidget {
  const ContactCardWidget({required this.contact, Key? key}) : super(key: key);
  final Contact contact;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: const TextStyle(
            fontSize: extraLarge,
          ),
        ),
        subtitle: Text(
          contact.displayAccount,
          style: const TextStyle(
            fontSize: regularSize,
          ),
        ),
        onTap: () => Navigator.pushNamed(context, 'edit', arguments: contact),
      ),
    );
  }
}
