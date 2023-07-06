import 'package:shared_preferences/shared_preferences.dart';

class StationFavoriteViewModel {
  static String stationFavoriteId='';

  static Future<bool> setFavoriteStationId(String id) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(stationFavoriteId, id);
  }

  static Future getFavoriteStationId() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(stationFavoriteId);
  }

}