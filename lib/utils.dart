import 'package:shared_preferences/shared_preferences.dart';

const String USER_TOKEN = "user_token";
logd(dynamic data) {
  print("tony -> $data");
}

class Sf {
  //write async

/*   static addToSf(String key,dynamic value) async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   switch(value.runtimeType){
     case int:
      prefs.setInt(key, value);
      break;
     case String:
      prefs.setString(key, value);
      break;
    case bool:
      prefs.setBool(key, value);
      break;
    case double:
      prefs.setDouble(key, value);
      break;
    case List:
      prefs.setStringList(key, value);
      break;
   }
  } */
  static addStringToSF(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static addIntToSF(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  static addDoubleToSF(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  static addBoolToSF(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  //read async
  static Future<String?> getStringValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString(key);
    return stringValue;
  }

  static Future<bool?> getBoolValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool? boolValue = prefs.getBool(key);
    return boolValue;
  }

  static Future<int?> getIntValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int? intValue = prefs.getInt(key);
    return intValue;
  }

  static Future<double?> getDoubleValuesSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    double? doubleValue = prefs.getDouble(key);
    return doubleValue;
  }
}
