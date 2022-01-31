import 'package:byte_bank_alura_app/database/app_database.dart';
import 'package:byte_bank_alura_app/models/contact_model.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _account = 'account';
  static const String createTable = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_account INTEGER)';

  Future<int> insert(Contact contact) async {
    final Database db = await openDb();
    return db.insert(_tableName, _toMap(contact),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Contact>> getAll() async {
    final Database db = await openDb();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    return _toList(result);
  }

  Future<void> update(Contact contact) async {
    final Database db = await openDb();
    await db.update(
      _tableName,
      _toMap(contact),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<void> deleteById(int id) async {
    final Database db = await openDb();
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = <String, dynamic>{};
    contactMap[_id] = contact.id;
    contactMap[_name] = contact.name;
    contactMap[_account] = contact.account;
    return contactMap;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = List.empty(growable: true);
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_account],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
