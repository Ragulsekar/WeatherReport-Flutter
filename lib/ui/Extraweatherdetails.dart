import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_report/model/CityModel.dart';

class ExtraDetails extends StatefulWidget {
  final CityModel cityModel;

  ExtraDetails({Key key, @required this.cityModel}) : super(key: key);

  @override
  _ExtraDetailsState createState() => _ExtraDetailsState();
}

class _ExtraDetailsState extends State<ExtraDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Container(
            child: reportColumn(
                SvgPicture.asset(
                  "assets/pressure.svg",
                  height: 30.0,
                  width: 30.0,
                  color: Colors.black,
                ),
                "Pressure",
                widget?.cityModel?.current?.pressure.toString()),
          ),
          new Container(
            child: reportColumn(
                SvgPicture.asset(
                  "assets/humidity.svg",
                  height: 30.0,
                  width: 30.0,
                  color: Colors.black,
                ),
                "Humidity",
                widget?.cityModel?.current?.humidity.toString()),
          ),
          new Container(
            child: reportColumn(
                SvgPicture.asset(
                  "assets/wind.svg",
                  height: 30.0,
                  width: 30.0,
                  color: Colors.black,
                ),
                "Wind",
                widget?.cityModel?.current?.windSpeed.toString() + " m/s"),
          )
        ],
      ),
    );
  }
}

reportColumn(Widget icons, String title, String value) {
  var reportColumn = new Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[Container(child: icons), Text(title), Text(value)],
  );
  return reportColumn;
}
