import 'package:weather_report/model/CityModel.dart';
import 'package:weather_report/resources/APIProvider.dart';

class Repository{
  final apiProvider = ApiProvider();

  Future<CityModel> cityWeather(String accessKey, String city) =>
      apiProvider.cityWeather(accessKey, city).then((value) {
        return value;
      }).catchError((error) {
        return throw error;
      });
}