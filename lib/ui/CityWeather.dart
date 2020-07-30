import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_report/bloc/CityBloc.dart';
import 'package:weather_report/model/CityModel.dart';
import 'package:weather_report/resources/APIProvider.dart';
import 'package:weather_report/ui/Maintemperature.dart';
import 'package:weather_report/util/GlobalConstants.dart';

import 'Extraweatherdetails.dart';
import 'WeatherImage.dart';

class CityWeatherDetails extends StatefulWidget {
  final String city;

  CityWeatherDetails({Key key, @required this.city}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CityWeatherDetailsState();
}

class _CityWeatherDetailsState extends State<CityWeatherDetails> {
  bool showProgressIndicator = false;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  final apiProvider = ApiProvider();

  Request request = Request();
  Location location = Location();
  Current current = Current();
  CityModel _cityModel = CityModel();

  @override
  void initState() {
    currentCityApi();
    apiListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: new Text(
            location.name != null ? location.name : '',
            style: new TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.teal,
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).maybePop();
            },
          ),
        ),
        body: showProgressIndicator
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Column(children: <Widget>[
                  Expanded(flex: 4, child: WeatherImage(cityModel: _cityModel)),
                  Expanded(
                      flex: 1,
                      child: MainTemperature(
                        cityModel: _cityModel,
                      )),
                  Expanded(
                      flex: 2,
                      child: ExtraDetails(
                        cityModel: _cityModel,
                      )),
                ]),
              ),
      ),
    );
  }

  currentCityApi() async {
    showProgressIndicator = true;
    cityBloc.currentCityWeather(GlobalConstants.accessKey, widget.city);
  }

  apiListener() {
    cityBloc.cityWeatherResponse.listen((response) {
      if (mounted) {
        setState(() {
          showProgressIndicator = false;
          _cityModel = response;
          location = response.location;
          current = response.current;
          request = response.request;
          print(location.name);
          print(response.location.lat);
        });
      }
    });
  }
}
