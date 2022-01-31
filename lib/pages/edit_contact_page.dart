import 'package:byte_bank_alura_app/dao/contact_dao.dart';
import 'package:byte_bank_alura_app/helpers/constants.dart';
import 'package:byte_bank_alura_app/models/contact_model.dart';
import 'package:byte_bank_alura_app/widgets/custom_contact_textfield_widget.dart';
import 'package:byte_bank_alura_app/widgets/custom_elevated_bar_buttom_widget.dart';
import 'package:flutter/material.dart';

const String editPageRouteName = 'edit';

class EditContactPage extends StatefulWidget {
  const EditContactPage({this.contact, Key? key}) : super(key: key);
  final Contact? contact;
  @override
  _EditContactPageState createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final ContactDao _contactDao = ContactDao();
  @override
  Widget build(BuildContext context) {
    loadData();
    return Scaffold(
      appBar: AppBar(title: setPageTitle()),
      body: Padding(
        padding: const EdgeInsets.all(extraLarge),
        child: ListView(
          children: <Widget>[
            ContactTextFieldWidget(_nameController, nameTextfieldLabel),
            ContactTextFieldWidget(
              _accountController,
              accountTextFieldLabel,
              textInputType: TextInputType.number,
            ),
            ElevatedBarButton(saveContactLabel, saveContact)
          ],
        ),
      ),
    );
  }

  Text setPageTitle() {
    return Text(
        widget.contact != null ? editContactPageTitle : newContactPageTitle);
  }

  void loadData() {
    if (widget.contact != null) {
      _nameController.text = widget.contact!.name;
      _accountController.text = widget.contact!.account.toString();
    }
  }

  void saveContact() {
    final name = _nameController.text;
    final account = int.tryParse(_accountController.text);
    if (account != null) {
      final Contact contactToSave = Contact(
          widget.contact != null ? widget.contact!.id : 0, name, account);
      _upsertContact(contactToSave).then((id) => Navigator.pop(context));
    }
  }

  Future<dynamic> _upsertContact(Contact contact) {
    return widget.contact != null
        ? _contactDao.update(contact)
        : _contactDao.insert(contact);
  }
}
