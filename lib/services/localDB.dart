import 'package:shared_preferences/shared_preferences.dart';

class LocalDB{
  static const uidKey = "bfiauiwegibahvaiweb";

  static Future<bool> setShowHome(bool showHome) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool("showHome", showHome);
  }

  //gets uid of user
  static Future<bool?> getShowHome() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool("showHome");
  }

  static Future<bool> saveUserId(String uid) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(uidKey, uid);
  }

  //gets uid of user
  static Future<String?> getUserId() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(uidKey);
  }
}