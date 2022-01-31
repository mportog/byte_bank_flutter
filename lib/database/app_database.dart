import 'package:byte_bank_alura_app/models/contact_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(path,
        onCreate: (db, version) {
          db.execute('CREATE TABLE contacts('
              'id INTEGER PRIMARY KEY, '
              'name TEXT, '
              'account INTEGER)');
        },
        version: 1,
        onUpgrade: (db, oldVersion, newVersion) {
          // run sql code for upgrade
        });
  });
}

Future<int> save(Contact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = <String, dynamic>{};
    contactMap['id'] = contact.id;
    contactMap['name'] = contact.name;
    contactMap['account'] = contact.account;
    return db.insert('contacts', contactMap,
        conflictAlgorithm: ConflictAlgorithm.replace);
  });
}

Future<List<Contact>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact> contacts = List.empty(growable: true);
      for (Map<String, dynamic> map in maps) {
        final Contact contact = Contact(
          map['id'],
          map['name'],
          map['account'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}

Future<int> getLastContactIndex() async {
  return createDatabase().then((db) {
    return db
        .rawQuery('SELECT COUNT(id) FROM "contacts"')
        .then((counter) => counter.length);
  });
}
