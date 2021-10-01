import 'package:hive_flutter/hive_flutter.dart';

class AccountHiveStorage {
  static const totalInvestments = 'TOTAL_INVESTMENT';
  static const fractionalOwner = 'FRACTIONAL_OWNER';
  static const accStore = 'ACCOUNT_STORAGE_BOX';

  //TOTAL INVESTMENTS
  saveTotalInvestments(totalInvestment) async {
    var box = await Hive.openBox(accStore);

    box.put(totalInvestments, totalInvestment);
  }

  getTotalInvestments() async {
    var box = await Hive.openBox(accStore);

    return box.get(totalInvestments).toString();
  }

  //FRACTIONAL OWNER
  saveFractionalOwner(fractionalOwn) async {
    var box = await Hive.openBox(accStore);

    box.put(fractionalOwner, fractionalOwn);
  }

  getFractionalOwner() async {
    var box = await Hive.openBox(accStore);
    return box.get(fractionalOwner).toString();
  }

//CLEAR ACCOUNT ON LOGOUT
  clearAccStorage() async {
    var box = await Hive.openBox(accStore);
    box.clear();
  }
}
