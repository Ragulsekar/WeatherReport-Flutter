import 'dart:convert';

import 'package:weather_report/model/CityModel.dart';
import 'package:weather_report/util/GlobalConstants.dart';
import 'package:http/http.dart' as http;

class ApiProvider {

  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  Future<CityModel> cityWeather(String accessKey, String city) async {
    var url = GlobalConstants.currentCity +
        "?access_key=" +
        accessKey +
        "&query=" +
        city;
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      printWrapped(response.body);
      return CityModel.fromJson(json.decode(response.body));
    } else {
      return Future.error(response.reasonPhrase);
    }
  }
}
