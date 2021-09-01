import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  static const tokenValue = 'TOKEN';
  static const store = 'STORAGE_BOX';
  static const fullName = "FULL_NAME";
  static const email = "EMAIL";
  static const walletBallance = "WALLET_BALLANCE";
  static const bank = "BANK";
  static const account = "ACCOUNT";

  //TOKEN
  saveToken(token) async {
    var box = await Hive.openBox(store);

    box.put(tokenValue, token);
  }

  getToken() async {
    var box = await Hive.openBox(store);

    return box.get(tokenValue);
  }

  clearToken() async {
    var box = await Hive.openBox(store);
    box.clear();
  }

//EMAIL

  saveEmail(userEmail) async {
    var box = await Hive.openBox(store);

    box.put(email, userEmail);
  }

  getEmail() async {
    var box = await Hive.openBox(store);

    return box.get(email);
  }

  //FULLNAME

  saveFullName(userFullName) async {
    var box = await Hive.openBox(store);

    box.put(fullName, userFullName);
  }

  getFullName() async {
    var box = await Hive.openBox(store);

    return box.get(fullName);
  }

  //WALLET

  savewalletBallance(userWalletBallance) async {
    var box = await Hive.openBox(store);

    box.put(walletBallance, userWalletBallance);
  }

  getwalletBallance() async {
    var box = await Hive.openBox(store);

    return box.get(walletBallance);
  }

  //BANK

  saveBank(userBank) async {
    var box = await Hive.openBox(store);

    box.put(bank, userBank);
  }

  getBank() async {
    var box = await Hive.openBox(store);

    return box.get(bank);
  }

  //ACCOUNT NO
  saveAccount(userAccount) async {
    var box = await Hive.openBox(store);

    box.put(account, userAccount);
  }

  getAccount() async {
    var box = await Hive.openBox(store);

    return box.get(account);
  }
}
