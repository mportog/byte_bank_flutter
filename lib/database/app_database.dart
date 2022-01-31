import 'package:byte_bank_alura_app/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String databaseName = 'bytebank.db';
Future<Database> openDb() async {
  final String path = join(await getDatabasesPath(), databaseName);
  return openDatabase(path, onCreate: (db, version) {
    db.execute(ContactDao.createTable);
  }, version: 1);
}
