import 'package:rxdart/rxdart.dart';
import 'package:weather_report/model/CityModel.dart';
import 'package:weather_report/resources/Repository.dart';

class CityBloc {
  final _repository = Repository();
  var cityWeather = PublishSubject<CityModel>();

  Observable<CityModel> get cityWeatherResponse => cityWeather.stream;

  currentCityWeather(String accessKey, String city) async {
    _repository.cityWeather(accessKey, city).then((value) {
      cityWeather.sink.add(value);
    }).catchError((error) {
      cityWeather.sink.addError(error);
    });
  }

  dispose() {
    cityWeather.close();
  }
}
final cityBloc = CityBloc();
