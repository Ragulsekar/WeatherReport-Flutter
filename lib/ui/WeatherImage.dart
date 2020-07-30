import 'package:flutter/material.dart';
import 'package:weather_report/model/CityModel.dart';
import 'package:weather_report/util/layoutclipping.dart';

class WeatherImage extends StatefulWidget {
  final CityModel cityModel;

  WeatherImage({Key key, @required this.cityModel}) : super(key: key);

  @override
  _WeatherImageState createState() => _WeatherImageState();
}

class _WeatherImageState extends State<WeatherImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: ClipPath(
          clipper: TopLayer(),
          child: Container(
            width: double.infinity,
            color: Colors.teal[300],
            child: Column(
              children: <Widget>[
                Center(
                    child: Container(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    widget?.cityModel?.current?.weatherDescriptions[0],
                    style: new TextStyle(fontSize: 16.0),
                  ),
                )),
                Center(
                  child: Container(
                    child: new CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 60.0,
                      child: Image.network(
                        widget?.cityModel?.current?.weatherIcons[0],
                        height: 50.0,
                        width: 500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
