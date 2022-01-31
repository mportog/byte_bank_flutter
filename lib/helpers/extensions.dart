import 'package:byte_bank_alura_app/models/contact_model.dart';

extension AccountExtension on Contact {
  String get accountNumber {
    return account.toString().substring(0, account.toString().length - 1);
  }

  String get accountDigit {
    return account.toString().substring(account.toString().length - 1);
  }

  String get displayAccount {
    return '$accountNumber-$accountDigit';
  }
}
