import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  // static late SharedPreferences sharedPreferences;
  static late FlutterSecureStorage storage;



  static initStorage() async {
    AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions() ) ;
  }

  static Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {

   await storage.write(key: key, value: value );


    // if (value is String) return await sharedPreferences.setString(key, value);
    // if (value is bool) return await sharedPreferences.setBool(key, value);
    // if (value is int) return await sharedPreferences.setInt(key, value);
    // if (value is List<String>) return await sharedPreferences.setStringList(key, value);

    // return await sharedPreferences.setDouble(key, value);
  }

  // static List<String>? getListData({required String key}) {
  //   return sharedPreferences.getStringList(key);
  // }

  static Future<String?> getStringData({required String key}) async{
    return await storage.read(key: key);
    // return sharedPreferences.getString(key);
  }
  //
  // static bool? getBoolData({required String key}) {
  //   return sharedPreferences.getBool(key);
  // }
  // static int? getIntData({required String key}) {
  //   return sharedPreferences.getInt(key);
  // }

  static Future<void> removeData({required String key}) async {
    // return await sharedPreferences.remove(key);
    return await storage.delete(key: key);
  }
}
