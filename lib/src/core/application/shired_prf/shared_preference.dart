import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:takafol/src/user_managment/domain/app_user_model.dart';

class UserSharedPreference {
  static const String userKey = "UserModel";
  static Future<AppUser?> getLocalUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userModel = sharedPreferences.getString(userKey);
    if (userModel == null) return null;
    return AppUser.fromJson(jsonDecode(userModel));
  }

  static Future<void> saveLocalUser(AppUser appUser) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final userJson = jsonEncode(appUser.toJson());
   await sharedPreferences.setString(userKey, userJson);
  }
  
  static Future<void> deleteLocalUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    
   await sharedPreferences.remove(userKey);
  }
}
