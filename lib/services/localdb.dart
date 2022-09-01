import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  static final uidkey = 'vasubanti';
  static final levelkey = "467435bvesgwyh";
  static final rankkey = "4543467435bvesgwyh";
  static final namekey = "45363w54svegrft";
  static final photokey = "65g14ascafder4ev45";
  static final moneykey = "65g1hurehr7r76f2fe5";

  static Future<bool> saveUserID(String uid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(uidkey, uid);
  }

  static Future<String?> getUserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(uidkey);
  }

  static Future<bool> saveName(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(namekey, name);
  }

  static Future<String?> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(namekey);
  }

  static Future<bool> saveUrl(String prourl) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(photokey, prourl);
  }

  static Future<String?> getUrl() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(photokey);
  }

  static Future<bool> saveLevel(String level) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(levelkey, level);
  }

  static Future<String?> getLevel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(levelkey);
  }

  static Future<bool> saveMoney(String money) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(moneykey, money);
  }

  static Future<String?> getMoney() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(moneykey);
  }

  static Future<bool> saveRank(String rank) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(rankkey, rank);
  }

  static Future<String?> getRank() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(rankkey);
  }
}
