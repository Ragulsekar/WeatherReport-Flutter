import 'package:flutter/material.dart';
import 'package:weather_report/model/CityModel.dart';

class MainTemperature extends StatefulWidget {
  final CityModel cityModel;

  MainTemperature({Key key, @required this.cityModel}) : super(key: key);
  @override
  _MainTemperatureState createState() => _MainTemperatureState();
}

class _MainTemperatureState extends State<MainTemperature> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            child:  new RichText(
              text: new TextSpan(
                  text:"${widget?.cityModel?.current?.temperature}\u00b0",
                  style: new TextStyle(fontSize: 50.0,color: Colors.black),
                  children: <TextSpan>[
                    new TextSpan(
                        text: "C",style: new TextStyle(fontSize: 50.0,color: Colors.black54)
                    )
                  ]
              ),
            ),
          ),
        ]
    );
  }
}