class Contact {
  const Contact(this.id, this.name, this.account);
  final int id;
  final String name;
  final int account;
}

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
